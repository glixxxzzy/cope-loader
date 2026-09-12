(function () {
	const auth = document.getElementById("auth");
	const setupBox = document.getElementById("setupBox");
	const loginBox = document.getElementById("loginBox");
	const authMsg = document.getElementById("authMsg");
	const rows = document.getElementById("rows");
	const empty = document.getElementById("empty");
	const statline = document.getElementById("statline");
	const persistWarn = document.getElementById("persistWarn");
	const teleRows = document.getElementById("teleRows");
	const teleEmpty = document.getElementById("teleEmpty");
	const teleStat = document.getElementById("teleStat");
	const serverDot = document.getElementById("serverDot");
	const serverChip = document.getElementById("serverChip");
	const dashTiles = document.getElementById("dashTiles");
	const execBars = document.getElementById("execBars");
	const dayChart = document.getElementById("dayChart");
	const dayChartMeta = document.getElementById("dayChartMeta");
	const killSwitchBtn = document.getElementById("killSwitch");
	const killLabel = document.getElementById("killLabel");
	const killBanner = document.getElementById("killBanner");
	const pageTitle = document.getElementById("pageTitle");
	const pageSub = document.getElementById("pageSub");

	let persistent = true;
	let teleCache = [];
	let killOn = false;

	const VIEW_TITLES = {
		dashboard: { title: "Dashboard", sub: "System health and execution overview" },
		scripts: { title: "Scripts", sub: "Payload management, kill switch, offline build" },
		users: { title: "Users & Keys", sub: "Generate, extend, export and revoke license keys" },
		api: { title: "API & Profile", sub: "External key-check API, key and IP whitelist" },
	};

	// ---- bootstrap state / auth probe -------------------------------------
	function checkPersistence() {
		return fetch("/api/status")
			.then((r) => r.json())
			.then((s) => {
				persistent = !!s.persistent;
				renderPersistence();
				const online = !s.adminNeeded;
				serverDot.classList.toggle("off", !online);
				serverChip.textContent = online ? "server online" : "password not set";
				return s;
			})
			.catch(() => {
				serverDot.classList.add("off");
				serverChip.textContent = "offline";
			});
	}

	function renderPersistence() {
		if (persistent) {
			persistWarn.classList.add("hidden");
		} else {
			persistWarn.textContent =
				"Storage is NOT persistent — keys and this password live in memory and will reset on the next cold start or redeploy. Set DATABASE_URL in Vercel before selling keys.";
			persistWarn.classList.remove("hidden");
		}
	}

	function msg(text, kind) {
		authMsg.className = "msg " + (kind || "err");
		authMsg.textContent = text || "";
		authMsg.classList.remove("hidden");
	}

	async function probe() {
		checkPersistence();
		try {
			const authed = await fetch("/api/admin/keys");
			if (authed.ok) {
				auth.classList.add("hidden");
				showShell();
				return;
			}
			const s = await (await fetch("/api/admin/setup")).json();
			if (s.needed) setupBox.classList.remove("hidden");
			else loginBox.classList.remove("hidden");
		} catch {
			msg("Could not reach the loader server.");
		}
	}

	function showShell() {
		auth.classList.add("hidden");
		document.body.classList.add("authed");
		switchView("dashboard");
		loadAll();
	}

	function loadAll() {
		checkPersistence();
		loadKeys();
		loadTelemetry();
		loadScript();
		loadConfig();
	}

	document.getElementById("doSetup").addEventListener("click", async () => {
		const password = document.getElementById("pwSetup").value;
		const res = await fetch("/api/admin/setup", {
			method: "POST",
			headers: { "Content-Type": "application/json" },
			body: JSON.stringify({ password }),
		});
		const data = await res.json();
		if (!res.ok) return msg(data.error || "Failed");
		showShell();
	});

	document.getElementById("doLogin").addEventListener("click", async () => {
		const password = document.getElementById("pwLogin").value;
		const remember = document.getElementById("rememberLogin").checked;
		const res = await fetch("/api/admin/login", {
			method: "POST",
			headers: { "Content-Type": "application/json" },
			body: JSON.stringify({ password, remember }),
		});
		const data = await res.json();
		if (!res.ok || !data.ok) return msg(data.error || "Wrong password");
		showShell();
	});

	async function guard(fn) {
		const res = await fn();
		if (res.status === 401) {
			document.body.classList.remove("authed");
			arrayFrom(document.querySelectorAll(".view")).forEach((v) => v.classList.add("hidden"));
			auth.classList.remove("hidden");
			loginBox.classList.remove("hidden");
			msg("Session expired — sign in again.");
			return null;
		}
		return res;
	}

	function arrayFrom(list) {
		return Array.prototype.slice.call(list);
	}

	// ---- view switching -----------------------------------------------------
	function switchView(name) {
		if (!document.body.classList.contains("authed")) return;
		arrayFrom(document.querySelectorAll(".view")).forEach((v) => v.classList.add("hidden"));
		const view = document.getElementById("view-" + name);
		if (view) view.classList.remove("hidden");
		arrayFrom(document.querySelectorAll(".navbtn")).forEach((b) =>
			b.classList.toggle("active", b.dataset.view === name)
		);
		const t = VIEW_TITLES[name] || VIEW_TITLES.dashboard;
		pageTitle.textContent = t.title;
		pageSub.textContent = t.sub;
		loadView(name);
	}

	function loadView(name) {
		if (name === "dashboard") loadDash();
		else if (name === "users") loadKeys();
		else if (name === "api") loadConfig();
		else if (name === "scripts") {
			loadScript();
			renderKill();
		}
	}

	arrayFrom(document.querySelectorAll(".navbtn")).forEach((b) =>
		b.addEventListener("click", () => switchView(b.dataset.view))
	);

	// ---- dashboard ----------------------------------------------------------
	async function loadDash() {
		const res = await guard(() => fetch("/api/admin/stats"));
		let s = null;
		if (res) s = await res.json();

		killOn = s ? !!s.killSwitch : killOn;
		renderKill();

		const list = teleCache;
		let exec24h = 0;
		let users = new Set();
		const now = Date.now();
		for (const t of list) {
			const ts = t.time ? new Date(t.time).getTime() : 0;
			if (ts && now - ts < 24 * 3600e3) exec24h += 1;
			if (t.user_id) users.add(t.user_id);
			else if (t.username) users.add("u:" + t.username);
		}
		const kb = s && s.payloadBytes ? (s.payloadBytes / 1024).toFixed(0) : 0;
		const errToday = s ? s.rejectRateToday : 0;
		const errColor = errToday > 5 ? "warn" : errToday > 0 ? "warn" : "";
		dashTiles.innerHTML =
			tile("Executions today", exec24h, "last 24h") +
			tile("Total executions", list.length, "all time") +
			tile("Active users", users.size, "unique") +
			tile("Keys issued", s ? s.total : 0, s ? s.active + " active" : "") +
			tile("Redeems", s ? (s.todayRedeems || 0) : 0, "today") +
			tile("Error rate", errToday + "%", "today", errColor) +
			tile("Payload", kb + " KB", s ? "served" : "missing", true);

		renderDayChart(s ? (s.dayStats || []) : []);
		renderExecBars(list);
	}

	function tile(label, value, sub, glow) {
		return (
			'<div class="tile' + (glow ? " glow" : "") + '"><div class="t">' + label +
			"</div><div class=\"v\">" + esc(value) + (sub ? " <small>" + esc(sub) + "</small>" : "") + "</div></div>"
		);
	}

	function renderDayChart(dayStats) {
		const days = [];
		for (let i = 13; i >= 0; i--) {
			const d = new Date(Date.now() - i * 86400e3);
			const iso = d.toISOString().slice(0, 10);
			const row = dayStats.find((x) => x.day === iso) || { redeems: 0, rejects: 0 };
			days.push({ iso, label: d.getUTCDate(), redeems: row.redeems, rejects: row.rejects });
		}
		const max = Math.max(1, ...days.map((d) => d.redeems));
		dayChart.innerHTML = days
			.map((d) => {
				const h = Math.max(3, Math.round((d.redeems / max) * 100));
				return (
					'<div class="daycol" title="' + d.iso + " · " + d.redeems + " redeems" +
					(d.rejects ? " · " + d.rejects + " rejected" : "") + '">' +
					'<div class="daywrap"><div class="dayrej"' + (d.rejects ? ' style="height:' + Math.min(100, Math.round((d.rejects / max) * 100)) + '%"' : "") + '></div>' +
					'<div class="daybar" style="height:' + h + '%"></div></div>' +
					'<div class="lbl">' + d.label + "</div></div>"
				);
			})
			.join("");
		const totR = dayStats.reduce((a, b) => a + Number(b.redeems || 0), 0);
		const totJ = dayStats.reduce((a, b) => a + Number(b.rejects || 0), 0);
		const rate = totR + totJ > 0 ? Math.round((totJ / (totR + totJ)) * 1000) / 10 : 0;
		const todayIso = new Date().toISOString().slice(0, 10);
		const today = dayStats.find((x) => x.day === todayIso);
		dayChartMeta.innerHTML =
			(today ? today.redeems + " redeems today" : "no redemptions today") + " · " +
			(totR + totJ) + " total requests tracked · error rate " + rate + "%" +
			' · <span style="color:var(--warn)">' + totJ + " rejected</span>";
	}

	function renderExecBars(list) {
		if (!list.length) {
			execBars.innerHTML = '<p class="meta">No executions logged yet.</p>';
			return;
		}
		const byUser = {};
		const byExec = {};
		let last24 = 0;
		const now = Date.now();
		for (const t of list) {
			const who = t.username || (t.user_id ? "user:" + t.user_id : "Unknown");
			byUser[who] = (byUser[who] || 0) + 1;
			const ex = (t.executor || "Unknown").slice(0, 28);
			byExec[ex] = (byExec[ex] || 0) + 1;
			if (t.time && now - new Date(t.time).getTime() < 24 * 3600e3) last24 += 1;
		}
		const top = Object.entries(byUser).sort((a, b) => b[1] - a[1]).slice(0, 6);
		const max = Math.max(1, top[0] ? top[0][1] : 0);
		execBars.innerHTML =
			'<p class="meta" style="margin-bottom:2px">' + last24 + " executions in the last 24h · top users:</p>" +
			top.map(([name, n]) =>
				'<div class="barline"><div class="lbl">' + esc(name) + "</div>" +
				'<div class="track"><div class="fill" style="width:' + Math.round((n / max) * 100) + '%"></div></div>' +
				'<div class="val">' + n + "</div></div>"
			).join("");
		const topE = Object.entries(byExec).sort((a, b) => b[1] - a[1]).slice(0, 3)
			.map(([n, c]) => n + " (" + c + ")").join(", ");
		if (topE) teleStat.textContent = "Top executors: " + topE;
	}

	// ---- telemetry -----------------------------------------------------------
	async function loadTelemetry() {
		const res = await guard(() => fetch("/api/admin/telemetry?limit=1000"));
		if (!res) return;
		const data = await res.json();
		const list = data.telemetry || [];
		teleCache = list;
		teleRows.innerHTML = "";
		teleEmpty.classList.toggle("hidden", list.length > 0);
		const recent = list.slice(0, 30);
		for (const t of recent) {
			const tr = document.createElement("tr");
			const av = t.user_id
				? "https://www.roblox.com/headshot-thumbnail/image?userId=" + encodeURIComponent(t.user_id) + "&width=60&height=60&format=png"
				: "";
			const avatar = av
				? '<img src="' + av + '" alt="" style="width:36px;height:36px;border-radius:50%;vertical-align:middle;background:#1a1a2e" onerror="this.style.display=\'none\'" /> '
				: "";
			tr.innerHTML =
				"<td>" + avatar + esc(t.username || "—") + "</td>" +
				'<td class="mono">' + esc(t.user_id || "—") + "</td>" +
				"<td>" + esc(t.executor || "—") + "</td>" +
				'<td class="mono">' + esc((t.key || "—").slice(0, 24)) + "</td>" +
				'<td class="mono">' + (t.time ? esc(t.time.slice(0, 19).replace("T", " ")) : "—") + "</td>";
			teleRows.appendChild(tr);
		}
		renderExecBars(list);
		if (document.getElementById("view-dashboard") && !document.getElementById("view-dashboard").classList.contains("hidden")) {
			loadDash();
		}
	}
	document.getElementById("refreshTele").addEventListener("click", loadTelemetry);

	// ---- kill switch ----------------------------------------------------------
	function renderKill() {
		if (!killSwitchBtn) return;
		killSwitchBtn.classList.toggle("on", killOn);
		killSwitchBtn.setAttribute("aria-checked", String(killOn));
		if (killOn) {
			killLabel.innerHTML = '<span style="color:var(--bad);font-weight:700">KILLED</span> — execution is disabled. Every loader is refused until you flip it back. Existing keys stay valid; nothing is revoked.';
			killBanner.textContent = "Kill switch is ON — all execution is paused. Flipping run access back only takes one click.";
			killBanner.classList.remove("hidden");
		} else {
			killLabel.textContent = "Execution enabled. Every loader currently validates and runs normally.";
			killBanner.classList.add("hidden");
		}
	}

	killSwitchBtn.addEventListener("click", async () => {
		const target = !killOn;
		const res = await guard(() =>
			fetch("/api/admin/killswitch", {
				method: "POST",
				headers: { "Content-Type": "application/json" },
				body: JSON.stringify({ enabled: target }),
			})
		);
		if (!res) return;
		const data = await res.json();
		if (!data.ok) return;
		killOn = !!data.enabled;
		renderKill();
	});

	// ---- script management ----------------------------------------------------
	async function loadScript() {
		const res = await guard(() => fetch("/api/admin/script"));
		if (!res) return;
		const data = await res.json();
		if (!data.ok || !data.status) return;
		renderScriptMeta(data.status);
	}

	function renderScriptMeta(st) {
		const el = document.getElementById("scriptMeta");
		const kb = (st.size / 1024).toFixed(1);
		const badge = st.servedIsObfuscated
			? '<span class="badge live">obfuscated</span>'
			: '<span class="badge warn">plaintext</span>';
		el.innerHTML =
			"Serving <code>" + esc(st.servedPath.split(/[\\/]/).pop()) + "</code> " + badge +
			" · " + kb + " KB · " + (st.mtime ? esc(st.mtime.slice(0, 19).replace("T", " ")) : "no script") +
			" · updated via this panel ships on the next loader load.";
		const ok = document.getElementById("scriptStatus");
		ok.textContent = kb + " KB · " + (st.mtime ? st.mtime.slice(0, 19).replace("T", " ") : "none");
	}

	document.getElementById("scriptLoadCurrent").addEventListener("click", async () => {
		const res = await guard(() => fetch("/api/admin/script/source"));
		const data = res ? await res.json() : null;
		if (!data || !data.ok) {
			const box = document.getElementById("scriptOut");
			box.innerHTML = '<div class="msg err">' + esc((data && data.error) || "Could not load the current script") + "</div>";
			return;
		}
		document.getElementById("scriptSrc").value = data.script;
		const box = document.getElementById("scriptOut");
		box.innerHTML = '<div class="msg ok">Loaded ' + (data.bytes / 1024).toFixed(1) + " KB into the editor.</div>";
	});

	document.getElementById("scriptUpdate").addEventListener("click", async () => {
		const box = document.getElementById("scriptOut");
		const btn = document.getElementById("scriptUpdate");
		const textarea = document.getElementById("scriptSrc");
		btn.disabled = true;
		btn.innerHTML = '<span class="spin"></span> Saving…';
		try {
			const res = await guard(() =>
				fetch("/api/admin/script", {
					method: "POST",
					headers: { "Content-Type": "application/json" },
					body: JSON.stringify({ script: textarea.value }),
				})
			);
			const data = res ? await res.json() : null;
			if (!res || !data.ok) {
				box.innerHTML = '<div class="msg err">' + esc((data && data.error) || "Update failed.") + "</div>";
				return;
			}
			if (data.obfuscated) {
				box.innerHTML =
					'<div class="msg ok">Payload updated and obfuscated (' + (data.status.size / 1024).toFixed(1) +
					" KB). Every loader will pick it up on its next load.</div>";
			} else {
				box.innerHTML =
					'<div class="msg warn">Payload updated, but obfuscation could not run — serving plaintext this round.<br><span style="color:var(--muted)">' +
					esc(data.clydeError || "") + "</span></div>";
			}
			renderScriptMeta(data.status);
			loadDash();
		} finally {
			btn.disabled = false;
			btn.innerHTML = '<span class="cta">Update &amp; obfuscate</span>';
		}
	});

	// ---- key factory / rows -------------------------------------------------
	const TYPE_HINTS = {
		temporary: "Temporary: expires after the chosen period. Bunches of keys can be pasted straight into Sellix as a product's keys.",
		daylocked: "Day-locked: a fixed window (the expiry select) after which the key stops working — the classic daily rental.",
		lifetime: "Lifetime: no expiry. Use for permanent buyers, one-time founder tiers or site-wide bundle access.",
	};

	arrayFrom(document.querySelectorAll("#keyType button")).forEach((b) =>
		b.addEventListener("click", () => {
			arrayFrom(document.querySelectorAll("#keyType button")).forEach((x) => x.classList.remove("active"));
			b.classList.add("active");
			document.getElementById("typeHint").textContent = TYPE_HINTS[b.dataset.type] || "";
			const expSel = document.getElementById("expiry");
			expSel.style.display = b.dataset.type === "lifetime" ? "none" : "";
		})
	);

	document.getElementById("generate").addEventListener("click", async () => {
		const type = (document.getElementById("keyType").querySelector("button.active") || {}).dataset.type || "temporary";
		const body = {
			count: parseInt(document.getElementById("keyCount").value, 10) || 1,
			note: document.getElementById("keyNote").value.trim(),
			expiresIn: type === "lifetime" ? "" : document.getElementById("expiry").value,
			type,
		};
		const res = await guard(() =>
			fetch("/api/admin/keys", {
				method: "POST",
				headers: { "Content-Type": "application/json" },
				body: JSON.stringify(body),
			})
		);
		if (!res) return;
		const data = await res.json();
		const box = document.getElementById("genOut");
		if (data.ok && data.keys.length) {
			box.innerHTML = '<div class="msg ok">Generated ' + data.keys.length + ":</div><pre class=\"code\">" +
				data.keys.map((k) => esc(k.key)).join("\n") + "</pre>";
		} else {
			box.innerHTML = '<div class="msg err">No keys generated.</div>';
		}
		loadKeys();
	});

	document.getElementById("refresh").addEventListener("click", loadKeys);

	function typeBadge(t) {
		const c = t === "lifetime" ? "live" : t === "daylocked" ? "warn" : "grey";
		return '<span class="badge ' + c + '">' + esc(t || "temporary") + "</span>";
	}

	async function loadKeys() {
		checkPersistence();
		const res = await guard(() => fetch("/api/admin/keys"));
		if (!res) return;
		const data = await res.json();
		rows.innerHTML = "";
		const list = data.keys || [];
		empty.classList.toggle("hidden", list.length > 0);
		for (const k of list) {
			const tr = document.createElement("tr");
			const expired = k.expires && new Date(k.expires).getTime() < Date.now();
			const status = k.revoked ? { c: "dead", t: "Revoked" }
				: expired ? { c: "dead", t: "Expired" }
				: k.expires ? { c: "live", t: "Live" }
				: { c: "grey", t: "No expiry" };
			const expText = k.expires ? esc(k.expires.slice(0, 10)) : k.type === "lifetime" ? "lifetime" : "—";
			tr.innerHTML =
				'<td class="mono"><div class="keycell"><span>' + esc(k.key) + "</span>" +
				'<button class="linkbtn" data-copy="' + esc(k.key) + '">copy</button></div></td>' +
				"<td>" + typeBadge(k.type) + "</td>" +
				"<td>" + esc(k.note) + "</td>" +
				'<td class="mono">' + expText + "</td>" +
				'<td><span class="badge ' + status.c + '">' + status.t + "</span></td>" +
				"<td>" + (k.uses || 0) + "</td>" +
				'<td class="mono">' + (k.last_use ? esc(k.last_use.slice(0, 19).replace("T", " ")) : "—") + "</td>" +
				'<td style="text-align:right;white-space:nowrap">' +
				'<button class="mini" data-loader="' + esc(k.key) + '">Loader</button> ' +
				'<button class="secondary mini" data-oneline="' + esc(k.key) + '">One-line</button> ' +
				'<button class="secondary mini" data-time="' + esc(k.key) + '" title="Add time to this key">+Time</button> ' +
				'<button class="secondary mini" data-revoke="' + esc(k.key) + '">' + (k.revoked ? "Unrevoke" : "Revoke") + "</button> " +
				'<button class="danger mini" data-del="' + esc(k.key) + '">Del</button></td>';
			rows.appendChild(tr);
		}
		const st = await guard(() => fetch("/api/admin/stats"));
		if (st) {
			const s = await st.json();
			statline.textContent =
				"(" + (s.total || 0) + " total · " + (s.active || 0) + " active · " +
				(s.uses || 0) + " redemptions)";
			killOn = !!s.killSwitch;
			renderKill();
		}
		loadDash();
	}

	document.getElementById("exportCsv").addEventListener("click", async () => {
		const res = await guard(() => fetch("/api/admin/keys"));
		if (!res) return;
		const data = await res.json();
		const list = data.keys || [];
		if (!list.length) {
			showSnippet("Sellix export", "No keys to export yet.", "No keys yet.");
			return;
		}
		const escCsv = (s) => {
			s = String(s == null ? "" : s);
			return /[",\n]/.test(s) ? '"' + s.replace(/"/g, '""') + '"' : s;
		};
		const head = ["key", "type", "note", "expires", "status", "uses"].map(escCsv).join(",");
		const lines = list.map((k) =>
			[key ? k.key : "", k.type || "temporary", k.note, k.expires || "", k.revoked ? "revoked" : "valid", k.uses].map(escCsv).join(",")
		);
		const csv = head + "\n" + lines.join("\n");
		showSnippet(
			"Sellix batch export",
			list.length + " keys formatted as a CSV. In Sellix, open your product → Keys → paste this batch in.",
			csv
		);
	});

	// ---- key row actions ------------------------------------------------------
	rows.addEventListener("click", async (ev) => {
		const t = ev.target;
		if (t.dataset.copy) {
			try { await navigator.clipboard.writeText(t.dataset.copy); t.textContent = "done"; setTimeout(() => (t.textContent = "copy"), 1200); }
			catch { msg("Clipboard blocked — select the key manually."); }
			return;
		}
		if (t.dataset.loader) {
			const res = await guard(() => fetch("/api/admin/keys/" + encodeURIComponent(t.dataset.loader) + "/loader"));
			if (!res) return;
			const data = await res.json();
			if (data.ok && data.loader) {
				showSnippet(
					"Loader for this key",
					"Paste this into your executor once. Every run re-validates the key on the server — revoking the key kills every copy of this snippet instantly.",
					data.loader
				);
			} else msg(data.error || "Could not build loader.");
			return;
		}
		if (t.dataset.oneline) {
			const res = await guard(() => fetch("/api/admin/keys/" + encodeURIComponent(t.dataset.oneline) + "/oneline"));
			if (!res) return;
			const data = await res.json();
			if (data.ok && data.line) {
				showSnippet(
					"One-liner for this key",
					"The key is baked into this URL. Running the line unlocks and starts the script silently.",
					data.line
				);
			} else msg(data.error || "Could not build one-liner.");
			return;
		}
		if (t.dataset.time) {
			openTimeModal(t.dataset.time);
			return;
		}
		if (t.dataset.revoke) {
			await guard(() =>
				fetch("/api/admin/keys/" + encodeURIComponent(t.dataset.revoke) + "/revoke", { method: "POST" })
			);
			loadKeys();
			return;
		}
		if (t.dataset.del) {
			if (!confirm("Delete this key permanently?")) return;
			await guard(() => fetch("/api/admin/keys/" + encodeURIComponent(t.dataset.del), { method: "DELETE" }));
			loadKeys();
		}
	});

	// ---- generic loader / one-liner ------------------------------------------
	document.getElementById("genericLoader").addEventListener("click", async () => {
		const res = await guard(() => fetch("/api/admin/loader/generic"));
		if (!res) return;
		const data = await res.json();
		if (data.ok && data.loader) {
			showSnippet(
				"Key-page loader",
				"Hand this to every buyer. Running it opens a key entry page in the executor; each key is validated on the server when it is submitted.",
				data.loader
			);
		} else msg(data.error || "Could not build the key-page loader.");
	});
	document.getElementById("oneLiner").addEventListener("click", async () => {
		const res = await guard(() => fetch("/api/admin/oneline"));
		if (!res) return;
		const data = await res.json();
		if (data.ok && data.line) {
			showSnippet(
				"One-liner (key page)",
				"Hand this to every buyer. Running the line fetches the script URL from the server and opens the key page in the executor.",
				data.line
			);
		} else msg(data.error || "Could not build the one-liner.");
	});

	// ---- offline convert ------------------------------------------------------
	document.getElementById("convDo").addEventListener("click", () => convert(false));
	document.getElementById("convFile").addEventListener("click", () => convert(true));

	async function convert(fromFile) {
		const box = document.getElementById("convOut");
		const body = fromFile ? { file: true } : { script: document.getElementById("convSrc").value };
		box.innerHTML = '<div class="msg">Converting…</div>';
		const res = await guard(() =>
			fetch("/api/admin/convert", {
				method: "POST",
				headers: { "Content-Type": "application/json" },
				body: JSON.stringify(body),
			})
		);
		if (!res) return;
		const data = await res.json();
		if (!data.ok || !data.snippet) {
			box.innerHTML = '<div class="msg err">' + esc(data.error || "Conversion failed") + "</div>";
			return;
		}
		box.innerHTML =
			'<div class="msg ok">Converted ' + (data.size / 1024).toFixed(1) + " KB of source &rarr; " +
			(data.blobChars / 1024).toFixed(0) + " KB packed. Copy and paste into your executor.</div>" +
			'<div class="row" style="margin-top:8px"><button class="small" data-convcopy="1">Copy loadstring</button></div>' +
			'<pre class="code" id="convText" style="margin-top:8px;user-select:all">' + esc(data.snippet) + "</pre>";
		box.dataset.snippet = data.snippet;
	}

	document.getElementById("convOut").addEventListener("click", async (ev) => {
		if (!ev.target.dataset.convcopy) return;
		const text = document.getElementById("convText").textContent || "";
		try { await navigator.clipboard.writeText(text); ev.target.textContent = "Copied"; setTimeout(() => (ev.target.textContent = "Copy loadstring"), 1200); }
		catch { msg("Clipboard blocked — select the text manually."); }
	});

	// ---- API & profile -------------------------------------------------------
	async function loadConfig() {
		const res = await guard(() => fetch("/api/admin/config"));
		if (!res) return;
		const data = await res.json();
		if (!data.ok) return;
		killOn = !!data.killSwitch;
		renderKill();
		const box = document.getElementById("apiKeyBox");
		if (box) {
			if (data.apiKey) {
				box.textContent = data.apiKey;
				box.dataset.apiKey = data.apiKey;
			} else {
				box.textContent = "not configured";
				box.dataset.apiKey = "";
			}
		}
		const wl = document.getElementById("whitelistInput");
		if (wl) wl.value = data.ipWhitelist || "";
		const ex = document.getElementById("apiExample");
		if (ex) {
			const base = location.origin;
			ex.textContent =
				"# Check a key (returns valid/revoked/expired/uses)\n" +
				"curl -H \"Authorization: Bearer <API_KEY>\" " + base + "/api/v1/key/HERE-THE-KEY\n\n" +
				"# Revoke a key instantly\n" +
				"curl -X POST -H \"Authorization: Bearer <API_KEY>\" -H \"Content-Type: application/json\" \\\n" +
				"  -d '{\"revoked\":true}' " + base + "/api/v1/key/HERE-THE-KEY/revoke\n\n" +
				"# Add time to a key (h | d | w)\n" +
				"curl -X POST -H \"Authorization: Bearer <API_KEY>\" -H \"Content-Type: application/json\" \\\n" +
				"  -d '{\"amount\":30,\"unit\":\"d\"}' " + base + "/api/v1/key/HERE-THE-KEY/extend";
		}
		const apiKeyBox = document.getElementById("apiKeyBox");
		if (apiKeyBox && data.apiKey) apiKeyBox.dataset.apiKey = data.apiKey;
	}

	document.getElementById("apiKeyCopy").addEventListener("click", async () => {
		const box = document.getElementById("apiKeyBox");
		if (!box.dataset.apiKey) {
			boxOut("No API key exists yet — regenerate one first.", "err");
			return;
		}
		try {
			await navigator.clipboard.writeText(box.dataset.apiKey);
			boxOut("API key copied. Store it somewhere safe.", "ok");
		} catch {
			boxOut("Clipboard blocked — select the key manually.", "err");
		}
	});
	document.getElementById("apiKeyRegen").addEventListener("click", async () => {
		if (!confirm("Regenerate the API key? Any service using the old key will stop working immediately.")) return;
		const res = await guard(() =>
			fetch("/api/admin/config", {
				method: "POST",
				headers: { "Content-Type": "application/json" },
				body: JSON.stringify({ action: "api-key" }),
			})
		);
		if (!res) return;
		const data = await res.json();
		if (!data.ok) {
			boxOut(data.error || "Failed.", "err");
			return;
		}
		const box = document.getElementById("apiKeyBox");
		box.textContent = data.apiKey;
		box.dataset.apiKey = data.apiKey;
		boxOut("New API key generated. Copy it now — you will not see it again after leaving this page.", "ok");
	});

	function boxOut(text, kind) {
		const box = document.getElementById("apiKeyOut");
		box.className = "msg " + kind;
		box.textContent = text;
		box.classList.remove("hidden");
	}

	document.getElementById("whitelistSave").addEventListener("click", async () => {
		const wl = document.getElementById("whitelistInput").value;
		const res = await guard(() =>
			fetch("/api/admin/config", {
				method: "POST",
				headers: { "Content-Type": "application/json" },
				body: JSON.stringify({ ipWhitelist: wl }),
			})
		);
		if (!res) return;
		const data = await res.json();
		const out = document.getElementById("whitelistOut");
		out.className = "msg " + (data.ok ? "ok" : "err");
		out.textContent = data.ok
			? "Whitelist saved — " + ((data.ipWhitelist || "").split("\n").filter(Boolean).length || 0) + " entries."
			: data.error || "Save failed.";
		out.classList.remove("hidden");
	});

	// ---- add time modal -------------------------------------------------------
	let timeTarget = null;
	const TIME_CHIPS = [
		["1h", 1, "h"], ["1d", 1, "d"], ["7d", 7, "d"], ["30d", 30, "d"],
	];
	document.getElementById("timeClose").addEventListener("click", () => {
		document.getElementById("timeModal").classList.add("hidden");
	});
	document.getElementById("timeConfirm").addEventListener("click", doExtend);

	function openTimeModal(keyVal) {
		timeTarget = keyVal;
		const chipEl = document.getElementById("timeChips");
		chipEl.innerHTML = TIME_CHIPS.map(
			([label, a, u], i) =>
				'<button type="button" data-a="' + a + '" data-u="' + u + '" class="' + (i === 0 ? "active" : "") + '">+' + label + "</button>"
		).join("");
		document.getElementById("timeCustom").value = "";
		document.getElementById("timeUnit").value = "d";
		document.getElementById("timeTitle").textContent = "Add time to key";
		document.getElementById("timeKey").textContent = keyVal;
		document.getElementById("timeOut").className = "msg hidden";
		document.getElementById("timeOut").textContent = "";
		document.getElementById("timeModal").classList.remove("hidden");
		chipEl.querySelectorAll("button").forEach((b) => {
			b.addEventListener("click", () => {
				chipEl.querySelectorAll("button").forEach((x) => x.classList.remove("active"));
				b.classList.add("active");
				document.getElementById("timeCustom").value = b.dataset.a;
				document.getElementById("timeUnit").value = b.dataset.u;
			});
		});
	}

	async function doExtend() {
		let amount = parseInt(document.getElementById("timeCustom").value, 10);
		if (!Number.isFinite(amount) || amount < 1) amount = 1;
		const unit = document.getElementById("timeUnit").value;
		const box = document.getElementById("timeOut");
		const btn = document.getElementById("timeConfirm");
		btn.disabled = true;
		try {
			const res = await guard(() =>
				fetch("/api/admin/keys/" + encodeURIComponent(timeTarget) + "/extend", {
					method: "POST",
					headers: { "Content-Type": "application/json" },
					body: JSON.stringify({ amount, unit }),
				})
			);
			const data = res ? await res.json() : null;
			if (!res || !data.ok) {
				box.className = "msg err";
				box.textContent = (data && data.error) || "Could not extend the key.";
				if (res && res.status === 401) return;
				return;
			}
			box.className = "msg ok";
			const when = data.expires ? new Date(data.expires).toISOString().slice(0, 16).replace("T", " ") : "never";
			box.textContent = "Extended. New expiry: " + when;
			loadKeys();
		} finally {
			btn.disabled = false;
		}
	}

	// ---- snippet modal ---------------------------------------------------------
	document.getElementById("snippetClose").addEventListener("click", () => {
		document.getElementById("snippetModal").classList.add("hidden");
	});
	document.getElementById("snippetCopy").addEventListener("click", async () => {
		const text = document.getElementById("snippetText").textContent || "";
		try { await navigator.clipboard.writeText(text); document.getElementById("snippetCopy").textContent = "Copied"; setTimeout(() => (document.getElementById("snippetCopy").textContent = "Copy"), 1200); }
		catch { msg("Clipboard blocked — select the text manually."); }
	});

	function showSnippet(title, desc, text) {
		document.getElementById("snippetTitle").textContent = title;
		document.getElementById("snippetDesc").textContent = desc;
		document.getElementById("snippetText").textContent = text;
		document.getElementById("snippetCopy").textContent = "Copy";
		document.getElementById("snippetModal").classList.remove("hidden");
	}

	document.getElementById("logout").addEventListener("click", async () => {
		await fetch("/api/admin/logout", { method: "POST" });
		arrayFrom(document.querySelectorAll(".view")).forEach((v) => v.classList.add("hidden"));
		document.body.classList.remove("authed");
		auth.classList.remove("hidden");
		loginBox.classList.remove("hidden");
	});

	function esc(s) {
		return String(s).replace(/[&<>"']/g, (c) => (
			{ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" }[c]
		));
	}

	probe();
})();