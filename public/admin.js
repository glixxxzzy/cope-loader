(function () {
	const auth = document.getElementById("auth");
	const dash = document.getElementById("dash");
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
	const statTiles = document.getElementById("statTiles");
	const execBars = document.getElementById("execBars");

	let persistent = true;
	let teleCache = [];

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
				"Storage is NOT persistent: keys and this password are in memory and will reset on the next cold start or redeploy. Set DATABASE_URL in Vercel before selling keys.";
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
				dash.classList.remove("hidden");
				loadKeys();
				loadTelemetry();
				loadScript();
				return;
			}
			const s = await (await fetch("/api/admin/setup")).json();
			if (s.needed) {
				setupBox.classList.remove("hidden");
			} else {
				loginBox.classList.remove("hidden");
			}
		} catch {
			msg("Could not reach the loader server.");
		}
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
		auth.classList.add("hidden");
		dash.classList.remove("hidden");
		checkPersistence();
		loadKeys();
		loadTelemetry();
		loadScript();
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
		auth.classList.add("hidden");
		dash.classList.remove("hidden");
		loadKeys();
		loadTelemetry();
		loadScript();
	});

	async function guard(fn) {
		const res = await fn();
		if (res.status === 401) {
			auth.classList.remove("hidden");
			dash.classList.add("hidden");
			msg("Session expired — sign in again.");
			return null;
		}
		return res;
	}

	// ---- stat tiles ---------------------------------------------------------
	async function renderTiles() {
		const res = await guard(() => fetch("/api/admin/stats"));
		if (!res) return;
		const s = await res.json();
		const kb = s.payloadBytes ? (s.payloadBytes / 1024).toFixed(0) : 0;
		statTiles.innerHTML =
			tile("Keys", s.total || 0, "") +
			tile("Active", s.active || 0, "") +
			tile("Redemptions", s.uses || 0, "all time") +
			tile("Payload", kb + " KB", s.payloadBytes ? "obfuscated" : "empty", true);
	}

	function tile(label, value, sub, glow) {
		return (
			'<div class="tile' + (glow ? " glow" : "") + '"><div class="t">' + label +
			'</div><div class="v">' + esc(value) + (sub ? " <small>" + esc(sub) + "</small>" : "") + "</div></div>"
		);
	}

	// ---- keys ----------------------------------------------------------------
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
			const expText = k.expires ? esc(k.expires.slice(0, 10)) : "—";
			tr.innerHTML =
				'<td class="mono"><div class="keycell"><span>' + esc(k.key) + "</span>" +
				'<button class="linkbtn" data-copy="' + esc(k.key) + '">copy</button></div></td>' +
				"<td>" + esc(k.note) + "</td>" +
				"<td class=\"mono\">" + expText + "</td>" +
				'<td><span class="badge ' + status.c + '">' + status.t + "</span></td>" +
				"<td>" + (k.uses || 0) + "</td>" +
				"<td class=\"mono\">" + (k.last_use ? esc(k.last_use.slice(0, 19).replace("T", " ")) : "—") + "</td>" +
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
		}
		renderTiles();
	}

	// ---- telemetry / analytics -----------------------------------------------
	async function loadTelemetry() {
		const res = await guard(() => fetch("/api/admin/telemetry?limit=1000"));
		if (!res) return;
		const data = await res.json();
		const list = data.telemetry || [];
		teleCache = list;
		teleRows.innerHTML = "";
		teleEmpty.classList.toggle("hidden", list.length > 0);
		teleStat.textContent = "(" + (data.total || 0) + " total)";
		renderExecBars(list);
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
	}

	function renderExecBars(list) {
		if (!list.length) {
			execBars.innerHTML = "";
			return;
		}
		const byExec = {};
		let last24 = 0;
		const now = Date.now();
		for (const t of list) {
			const ex = (t.executor || "Unknown").slice(0, 28);
			byExec[ex] = (byExec[ex] || 0) + 1;
			if (t.time && now - new Date(t.time).getTime() < 24 * 3600e3) last24 += 1;
		}
		const top = Object.entries(byExec).sort((a, b) => b[1] - a[1]).slice(0, 6);
		const max = Math.max(1, top[0] ? top[0][1] : 0);
		execBars.innerHTML =
			'<p class="meta" style="margin-bottom:2px">' + last24 + " executions in the last 24h" +
			(list.length ? " · top executors:" : "") + "</p>" +
			top.map(([name, n]) =>
				'<div class="barline"><div class="lbl">' + esc(name) + '</div>' +
				'<div class="track"><div class="fill" style="width:' + Math.round((n / max) * 100) + '%"></div></div>' +
				'<div class="val">' + n + "</div></div>"
			).join("");
	}

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
		const served = st.servedIsObfuscated ? "obfuscated" : st.obfuscateEnabled ? "plaintext" : "plaintext";
		const badge = st.servedIsObfuscated
			? '<span class="badge live">obfuscated</span>'
			: '<span class="badge warn">plaintext</span>';
		el.innerHTML =
			"Serving <code>" + esc(st.servedPath.split(/[\\/]/).pop()) + "</code> " + badge +
			" · " + kb + " KB · " + (st.mtime ? esc(st.mtime.slice(0, 19).replace("T", " ")) : "no script") +
			" · updated via this panel ships on the next loader load.";
		const ok = document.getElementById("scriptStatus");
		ok.textContent = "(" + kb + " KB · " + (st.mtime ? st.mtime.slice(0, 19).replace("T", " ") : "none") + ")";
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
			renderTiles();
		} finally {
			btn.disabled = false;
			btn.innerHTML = '<span class="cta">Update &amp; obfuscate</span>';
		}
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
			} else {
				msg(data.error || "Could not build loader.");
			}
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
			} else {
				msg(data.error || "Could not build one-liner.");
			}
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

	// ---- generate / misc ------------------------------------------------------
	document.getElementById("generate").addEventListener("click", async () => {
		const body = {
			count: parseInt(document.getElementById("count").value, 10) || 1,
			note: document.getElementById("note").value.trim(),
			expiresIn: document.getElementById("expiry").value,
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
	document.getElementById("refreshTele").addEventListener("click", loadTelemetry);
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
		} else {
			msg(data.error || "Could not build the key-page loader.");
		}
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
		} else {
			msg(data.error || "Could not build the one-liner.");
		}
	});
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
		dash.classList.add("hidden");
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