(function () {
	const keyIn = document.getElementById("key");
	const btn = document.getElementById("redeem");
	const msg = document.getElementById("msg");
	const result = document.getElementById("result");
	const out = document.getElementById("out");
	const copy = document.getElementById("copy");
	const meta = document.getElementById("meta");

	function show(el, kind, text) {
		msg.className = "msg " + kind;
		msg.textContent = text;
		el.classList.remove("hidden");
	}

	btn.addEventListener("click", redeeming);
	keyIn.addEventListener("keydown", (e) => { if (e.key === "Enter") redeeming(); });

	async function redeeming() {
		const key = keyIn.value.trim();
		if (!key) return show(msg, "err", "Enter your key first.");
		msg.classList.add("hidden");
		result.classList.add("hidden");
		btn.disabled = true;
		btn.textContent = "Checking...";
		try {
			const res = await fetch("/api/redeem", {
				method: "POST",
				headers: { "Content-Type": "application/json" },
				body: JSON.stringify({ key }),
			});
			const data = await res.json();
			if (!res.ok || !data.ok) {
				show(msg, "err", data.error || "Something went wrong (HTTP " + res.status + ").");
				return;
			}
			out.textContent = data.loader;
			meta.textContent =
				"Payload: " + (data.payloadBytes / 1024).toFixed(0) + " KB packed | " +
				"loadstring expires in " + Math.round(data.ttlSeconds / 60) + " min | " +
				"expires " + new Date(data.expiresAt).toLocaleTimeString();
			show(msg, "ok", "Key accepted.");
			result.classList.remove("hidden");
		} catch (err) {
			show(msg, "err", "Could not reach the loader server. Is it running?");
		} finally {
			btn.disabled = false;
			btn.textContent = "Redeem";
		}
	}

	copy.addEventListener("click", async () => {
		try {
			await navigator.clipboard.writeText(out.textContent);
			copy.textContent = "Copied!";
			setTimeout(() => (copy.textContent = "Copy"), 1600);
		} catch {
			out.select();
			document.execCommand("copy");
		}
	});
})();