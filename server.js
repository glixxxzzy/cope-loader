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
	const adminNeeded = await (await fetch(`http://127.0.0.1:${PORT}/api/status`))
		.json()
		.then((d) => d.adminNeeded)
		.catch(() => "?");
	console.log("[loader] http://127.0.0.1:" + PORT);
	console.log("[loader] admin " + (adminNeeded ? "NOT SET - create one at /admin" : "ready (admin password set)"));
});

process.on("SIGINT", () => {
	server.close();
	process.exit(0);
});