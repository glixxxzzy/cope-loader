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
				'<button class="secondary small" data-revoke="' + k.id + '">' + (k.revoked ? "Unrevoke" : "Revoke") + "</button> " +
				'<button class="danger small" data-del="' + k.id + '">Del</button></td>';
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
		if (t.dataset.revoke) {
			await guard(() =>
				fetch("/api/admin/keys/" + t.dataset.revoke + "/revoke", { method: "POST" })
			);
			loadKeys();
			return;
		}
		if (t.dataset.del) {
			if (!confirm("Delete this key permanently?")) return;
			await guard(() => fetch("/api/admin/keys/" + t.dataset.del, { method: "DELETE" }));
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