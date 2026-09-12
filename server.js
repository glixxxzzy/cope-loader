"use strict";
const fs = require("fs");
const path = require("path");
const app = require("./app");

const CONFIG_PATH = path.join(__dirname, "config.json");
const config = (() => {
	try {
		return JSON.parse(fs.readFileSync(CONFIG_PATH, "utf8"));
	} catch {
		return {};
	}
})();

const PORT = Number(process.env.PORT || config.port || 3300);

const server = app.listen(PORT, async () => {
	const s = await fetch(`http://127.0.0.1:${PORT}/api/status`)
		.then((r) => r.json())
		.catch(() => ({}));
	console.log("[loader] http://127.0.0.1:" + PORT);
	console.log(
		"[loader] admin " +
			(s.authConfigured
				? "GitHub sign-in ready (restricted to allowlist)"
				: "GitHub OAuth NOT configured - set GITHUB_CLIENT_ID/GITHUB_CLIENT_SECRET/GITHUB_ALLOWED_USERS")
	);
});

process.on("SIGINT", () => {
	server.close();
	process.exit(0);
});