// CopE Loader — standalone Discord bot.
//
// Reads the bot token / guild / channel settings saved from the admin panel's
// "Discord Bot" page, straight out of the SAME database. No config is
// duplicated here.
//
// Buyers get a mini self-service panel in Discord:
//   /redeem <key> <hwid>      - validate a license key and bind it to their HWID
//   /hwidreset <key>          - clear the HWID bound to a key (lost PC / reinstall)
//
// Run:  npm i discord.js pg
//       node discord/bot.js
"use strict";

const { Client, GatewayIntentBits, REST, Routes, SlashCommandBuilder } = require("discord.js");

const DATABASE_URL = process.env.DATABASE_URL;
if (!DATABASE_URL) {
	console.error("DATABASE_URL is not set. Point it at the same Postgres the loader site uses.");
	process.exit(1);
}

const { Pool } = require("pg");
const pool = new Pool({
	connectionString: DATABASE_URL,
	ssl: { rejectUnauthorized: false },
});

async function getFlag(name) {
	const { rows } = await pool.query("SELECT value FROM cope_flags WHERE name = $1", [name]);
	return rows[0] ? rows[0].value : null;
}

async function findByKey(k) {
	const { rows } = await pool.query(
		"SELECT key, expires, revoked, uses, type FROM cope_keys WHERE key = $1",
		[k]
	);
	return rows[0] || null;
}

async function getHwid(key) {
	const { rows } = await pool.query("SELECT hwid, user_tag, updated FROM cope_hwid WHERE key = $1", [key]);
	return rows[0] || null;
}

async function setHwid(key, hwid, userTag) {
	await pool.query(
		`INSERT INTO cope_hwid (key, hwid, user_tag, updated) VALUES ($1, $2, $3, $4)
		 ON CONFLICT (key) DO UPDATE SET hwid = EXCLUDED.hwid, user_tag = EXCLUDED.user_tag, updated = EXCLUDED.updated`,
		[key, hwid, userTag, new Date().toISOString()]
	);
}

async function main() {
	const enabled = (await getFlag("discord_enabled")) === "1";
	const token = (await getFlag("discord_token")) || "";
	if (!enabled) {
		console.log("Discord bot is disabled in the admin panel (Discord Bot → Enabled). Nothing to do.");
		return;
	}
	if (!token) {
		console.error("No Discord bot token saved yet. Save it in the admin panel (Discord Bot) and run again.");
		return;
	}

	const client = new Client({ intents: [GatewayIntentBits.Guilds] });

	client.once("ready", async () => {
		console.log("Logged in as", client.user.tag);
		const commands = [
			new SlashCommandBuilder()
				.setName("redeem")
				.setDescription("Redeem a CopE license key and bind it to your HWID")
				.addStringOption((o) => o.setName("key").setDescription("Your license key").setRequired(true))
				.addStringOption((o) => o.setName("hwid").setDescription("Your hardware ID").setRequired(true)),
			new SlashCommandBuilder()
				.setName("hwidreset")
				.setDescription("Reset the HWID bound to a key (lost PC / reinstall)")
				.addStringOption((o) => o.setName("key").setDescription("Your license key").setRequired(true)),
		];
		const rest = new REST({ version: "10" }).setToken(token);
		try {
			await rest.put(Routes.applicationCommands(client.user.id), { body: commands });
			console.log("Slash commands registered.");
		} catch (err) {
			console.error("Could not register slash commands:", err.message);
		}
	});

	client.on("interactionCreate", async (interaction) => {
		if (!interaction.isChatInputCommand()) return;
		const key = String(interaction.options.getString("key") || "").trim().toUpperCase();

		if (interaction.commandName === "redeem") {
			const hwid = String(interaction.options.getString("hwid") || "").trim();
			if (!hwid) return interaction.reply({ content: "Please include your HWID after the key.", ephemeral: true });

			const row = await findByKey(key);
			if (!row || row.revoked) {
				return interaction.reply({ content: "That key is invalid or has been revoked.", ephemeral: true });
			}
			if (row.expires && Date.now() > new Date(row.expires).getTime()) {
				return interaction.reply({ content: "That key has expired.", ephemeral: true });
			}
			await setHwid(key, hwid, interaction.user.tag);
			const type = row.type || "temporary";
			const exp = row.expires ? new Date(row.expires).toISOString().slice(0, 10) : "never";
			return interaction.reply({
				content: `Key **${key}** redeemed (${type}, expires ${exp}). HWID bound — your loader is unlocked.`,
				ephemeral: true,
			});
		}

		if (interaction.commandName === "hwidreset") {
			const row = await findByKey(key);
			if (!row || row.revoked) {
				return interaction.reply({ content: "That key is invalid or has been revoked.", ephemeral: true });
			}
			const bound = await getHwid(key);
			if (!bound || !bound.hwid) {
				return interaction.reply({ content: "No HWID is bound to that key yet.", ephemeral: true });
			}
			await setHwid(key, "", interaction.user.tag);
			return interaction.reply({
				content: `HWID reset for **${key}**. The next run of the loader will let you bind a new machine.`,
				ephemeral: true,
			});
		}
	});

	client.login(token).catch((err) => {
		console.error("Login failed (bad token?):", err.message);
		process.exit(1);
	});
}

main().catch((err) => {
	console.error("Bot startup error:", err.message);
	process.exit(1);
});