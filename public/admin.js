(function () {
	const auth = document.getElementById("auth");
	const dash = document.getElementById("dash");
	const setupBox = document.getElementById("setupBox");
	const loginBox = document.getElementById("loginBox");
	const authMsg = document.getElementById("authMsg");
	const rows = document.getElementById("rows");
	const empty = document.getElementById("empty");
	const statline = document.getElementById("statline");

	function msg(text, kind) {
		authMsg.className = "msg " + (kind || "err");
		authMsg.textContent = text || "";
		authMsg.classList.remove("hidden");
	}

	async function probe() {
		try {
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
		loadKeys();
	});

	document.getElementById("doLogin").addEventListener("click", async () => {
		const password = document.getElementById("pwLogin").value;
		const res = await fetch("/api/admin/login", {
			method: "POST",
			headers: { "Content-Type": "application/json" },
			body: JSON.stringify({ password }),
		});
		const data = await res.json();
		if (!res.ok || !data.ok) return msg(data.error || "Wrong password");
		auth.classList.add("hidden");
		dash.classList.remove("hidden");
		loadKeys();
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

	async function loadKeys() {
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
				: { c: "live", t: "Live" };
			tr.innerHTML =
				'<td class="mono"><div class="keycell"><span>' + esc(k.key) + "</span>" +
				'<button class="linkbtn" data-copy="' + esc(k.key) + '">copy</button></div></td>' +
				"<td>" + esc(k.note) + "</td>" +
				"<td class=\"mono\">" + (k.expires ? esc(k.expires.slice(0, 10)) : "—") + "</td>" +
				'<td><span class="badge ' + status.c + '">' + status.t + "</span></td>" +
				"<td>" + (k.uses || 0) + "</td>" +
				"<td class=\"mono\">" + (k.last_use ? esc(k.last_use.slice(0, 19).replace("T", " ")) : "—") + "</td>" +
				'<td style="text-align:right">' +
				'<button class="small" data-loader="' + esc(k.key) + '">Loader</button> ' +
				'<button class="secondary small" data-revoke="' + esc(k.key) + '">' + (k.revoked ? "Unrevoke" : "Revoke") + "</button> " +
				'<button class="danger small" data-del="' + esc(k.key) + '">Del</button></td>';
			rows.appendChild(tr);
		}
		const st = await guard(() => fetch("/api/admin/stats"));
		if (st) {
			const s = await st.json();
			statline.textContent =
				"(" + (s.total || 0) + " total · " + (s.active || 0) + " active · " +
				(s.uses || 0) + " redemptions · " + (s.payloadBytes ? (s.payloadBytes / 1024).toFixed(0) + " KB payload" : "no payload") + ")";
		}
	}

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
				document.getElementById("loaderText").textContent = data.loader;
				document.getElementById("loaderModal").classList.remove("hidden");
			} else {
				msg(data.error || "Could not build loader.");
			}
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
	document.getElementById("genericLoader").addEventListener("click", async () => {
		const res = await guard(() => fetch("/api/admin/loader/generic"));
		if (!res) return;
		const data = await res.json();
		if (data.ok && data.loader) {
			document.getElementById("loaderText").textContent = data.loader;
			document.getElementById("loaderModal").classList.remove("hidden");
		} else {
			msg(data.error || "Could not build the key-page loader.");
		}
	});
	document.getElementById("convDo").addEventListener("click", () => convert( false ));
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
	document.getElementById("loaderClose").addEventListener("click", () => {
		document.getElementById("loaderModal").classList.add("hidden");
	});
	document.getElementById("loaderCopy").addEventListener("click", async () => {
		const text = document.getElementById("loaderText").textContent || "";
		try { await navigator.clipboard.writeText(text); document.getElementById("loaderCopy").textContent = "Copied"; setTimeout(() => (document.getElementById("loaderCopy").textContent = "Copy"), 1200); }
		catch { msg("Clipboard blocked — select the loader text manually."); }
	});
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