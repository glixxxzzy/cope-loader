"use strict";
// Storage layer: Postgres when DATABASE_URL is set (the Vercel/serverless
// path - Neon, Supabase, Railway...), otherwise an in-memory fallback so
// `npm start` works with zero external services. Everything is async and
// shares one public API (used by app.js).

const crypto = require("crypto");

const MINUTE_MS = 60 * 1000;

// --------------------------------------------------------------------------
// Postgres backend
// --------------------------------------------------------------------------
let pool = null;
function getPool() {
	if (!pool) {
		const { Pool } = require("pg");
		const url = process.env.DATABASE_URL;
		const isLocal = /localhost|127\.0\.0\.1/.test(url);
		pool = new Pool({
			connectionString: url,
			ssl: isLocal ? undefined : { rejectUnauthorized: false },
			max: 5,
		});
	}
	return pool;
}

// Ensure schema exists (idempotent; runs once per cold start).
async function initDb() {
	const p = getPool();
	await p.query(`
		CREATE TABLE IF NOT EXISTS cope_keys (
			key text PRIMARY KEY,
			note text NOT NULL DEFAULT '',
			created text NOT NULL,
			expires text,
			type text NOT NULL DEFAULT 'temporary',
			revoked int NOT NULL DEFAULT 0,
			uses int NOT NULL DEFAULT 0,
			last_use text
		);
		CREATE TABLE IF NOT EXISTS cope_admin (
			name text PRIMARY KEY,
			hash text NOT NULL
		);
		CREATE TABLE IF NOT EXISTS cope_sessions (
			sid text PRIMARY KEY,
			expires_at bigint NOT NULL
		);
		CREATE TABLE IF NOT EXISTS cope_tokens (
			token text PRIMARY KEY,
			claimed int NOT NULL DEFAULT 0,
			created_at bigint NOT NULL,
			expires_at bigint NOT NULL
		);
		CREATE TABLE IF NOT EXISTS cope_rate (
			ip text PRIMARY KEY,
			hits int NOT NULL,
			resets bigint NOT NULL
		);
		CREATE TABLE IF NOT EXISTS cope_login_rate (
			ip text PRIMARY KEY,
			attempts int NOT NULL,
			blocked_until bigint NOT NULL
		);
		CREATE TABLE IF NOT EXISTS cope_parts (
			token text PRIMARY KEY,
			seeds text NOT NULL,
			expires_at bigint NOT NULL
		);
		CREATE TABLE IF NOT EXISTS cope_telemetry (
			id bigserial PRIMARY KEY,
			time text NOT NULL,
			username text NOT NULL DEFAULT '',
			user_id text NOT NULL DEFAULT '',
			executor text NOT NULL DEFAULT '',
			key text NOT NULL DEFAULT ''
		);
	`);
	await p.query(`
		ALTER TABLE cope_keys ADD COLUMN IF NOT EXISTS type text NOT NULL DEFAULT 'temporary';
		CREATE TABLE IF NOT EXISTS cope_flags (
			name text PRIMARY KEY,
			value text NOT NULL
		);
		CREATE TABLE IF NOT EXISTS cope_stats (
			day text PRIMARY KEY,
			redeems int NOT NULL DEFAULT 0,
			rejects int NOT NULL DEFAULT 0
		);
		CREATE TABLE IF NOT EXISTS cope_hwid (
			key text PRIMARY KEY,
			hwid text NOT NULL DEFAULT '',
			user_tag text NOT NULL DEFAULT '',
			updated text NOT NULL
		);
	`);
}
let initialized = false;
async function ensureInit() {
	if (!initialized) {
		await initDb();
		initialized = true;
	}
}

async function cleanupExpired() {
	const now = Date.now();
	const p = getPool();
	await p.query("DELETE FROM cope_tokens WHERE expires_at < $1", [now]);
	await p.query("DELETE FROM cope_sessions WHERE expires_at < $1", [now]);
	await p.query("DELETE FROM cope_rate WHERE resets < $1", [now]);
	await p.query("DELETE FROM cope_parts WHERE expires_at < $1", [now]);
}

async function partSessionCreate(token, seedsJson, ttlSeconds) {
	await ensureInit();
	await getPool().query(
		"INSERT INTO cope_parts (token, seeds, expires_at) VALUES ($1, $2, $3)",
		[token, seedsJson, Date.now() + ttlSeconds * 1000]
	);
}
async function partSessionGet(token) {
	await ensureInit();
	const { rows } = await getPool().query(
		"SELECT seeds FROM cope_parts WHERE token = $1 AND expires_at > $2",
		[token, Date.now()]
	);
	return rows[0] ? rows[0].seeds : null;
}
async function partSessionDelete(token) {
	await ensureInit();
	await getPool().query("DELETE FROM cope_parts WHERE token = $1", [token]);
}

async function addTelemetry(entry) {
	await ensureInit();
	await getPool().query(
		`INSERT INTO cope_telemetry (time, username, user_id, executor, key) VALUES ($1, $2, $3, $4, $5)`,
		[entry.time, entry.username, entry.userId, entry.executor, entry.key]
	);
}
async function listTelemetry(limit = 200) {
	await ensureInit();
	const { rows } = await getPool().query(
		"SELECT time, username, user_id, executor, key FROM cope_telemetry ORDER BY id DESC LIMIT $1",
		[limit]
	);
	return rows;
}
async function telemetryCount() {
	await ensureInit();
	const { rows } = await getPool().query(
		"SELECT COUNT(*)::int AS n FROM cope_telemetry"
	);
	return rows[0] ? rows[0].n : 0;
}

async function getAdminHash() {
	await ensureInit();
	const { rows } = await getPool().query(
		"SELECT hash FROM cope_admin WHERE name = $1",
		["password"]
	);
	return rows[0] ? rows[0].hash : null;
}
async function setAdminHash(hash) {
	await ensureInit();
	await getPool().query(
		"INSERT INTO cope_admin (name, hash) VALUES ($1, $2) ON CONFLICT (name) DO UPDATE SET hash = EXCLUDED.hash",
		["password", hash]
	);
}

async function findByKey(k) {
	await ensureInit();
	const { rows } = await getPool().query(
		"SELECT key, note, created, expires, type, revoked, uses, last_use FROM cope_keys WHERE key = $1",
		[k]
	);
	return rows[0] || null;
}
async function insertKey(k, note, created, expires, type) {
	await ensureInit();
	await getPool().query(
		"INSERT INTO cope_keys (key, note, created, expires, type, revoked, uses) VALUES ($1, $2, $3, $4, $5, 0, 0)",
		[k, note, created, expires, type || "temporary"]
	);
}
async function listKeys() {
	await ensureInit();
	const { rows } = await getPool().query(
		"SELECT key, note, created, expires, type, revoked, uses, last_use FROM cope_keys ORDER BY created DESC"
	);
	return rows;
}
async function setKeyType(k, type) {
	await ensureInit();
	await getPool().query("UPDATE cope_keys SET type = $2 WHERE key = $1", [k, type]);
}
async function bumpUse(k) {
	await ensureInit();
	await getPool().query(
		"UPDATE cope_keys SET uses = uses + 1, last_use = $2 WHERE key = $1",
		[k, new Date().toISOString()]
	);
}
async function setRevoked(k, revoked) {
	await ensureInit();
	await getPool().query(
		"UPDATE cope_keys SET revoked = $2 WHERE key = $1",
		[k, revoked ? 1 : 0]
	);
}
async function deleteKey(k) {
	await ensureInit();
	await getPool().query("DELETE FROM cope_keys WHERE key = $1", [k]);
}
async function setExpires(k, expiresIso) {
	await ensureInit();
	await getPool().query("UPDATE cope_keys SET expires = $2 WHERE key = $1", [k, expiresIso]);
}

// ---- flags (kill switch, api key, ip whitelist) ----------------------------
async function getFlag(name) {
	await ensureInit();
	const { rows } = await getPool().query(
		"SELECT value FROM cope_flags WHERE name = $1",
		[name]
	);
	return rows[0] ? rows[0].value : null;
}
async function setFlag(name, value) {
	await ensureInit();
	await getPool().query(
		"INSERT INTO cope_flags (name, value) VALUES ($1, $2) ON CONFLICT (name) DO UPDATE SET value = EXCLUDED.value",
		[name, String(value)]
	);
}
async function deleteFlag(name) {
	await ensureInit();
	await getPool().query("DELETE FROM cope_flags WHERE name = $1", [name]);
}

// ---- per-day redeem/reject counters -------------------------------------------
async function statsHit(day, kind) {
	await ensureInit();
	const col = kind === "reject" ? "rejects" : "redeems";
	await getPool().query(
		`INSERT INTO cope_stats (day, redeems, rejects) VALUES ($1, $2, $3)
		 ON CONFLICT (day) DO UPDATE SET ${col} = cope_stats.${col} + 1`,
		[day, kind === "redeem" ? 1 : 0, kind === "reject" ? 1 : 0]
	);
}
async function statsAll() {
	await ensureInit();
	const { rows } = await getPool().query(
		"SELECT day, redeems, rejects FROM cope_stats ORDER BY day"
	);
	return rows;
}

// ---- sessions --------------------------------------------------------------
async function sessionValid(sid) {
	await ensureInit();
	const { rows } = await getPool().query(
		"SELECT 1 FROM cope_sessions WHERE sid = $1 AND expires_at > $2",
		[sid, Date.now()]
	);
	return rows.length > 0;
}
async function sessionCreate(sid, ttlSeconds) {
	await ensureInit();
	await getPool().query(
		"INSERT INTO cope_sessions (sid, expires_at) VALUES ($1, $2)",
		[sid, Date.now() + ttlSeconds * 1000]
	);
}
async function sessionDestroy(sid) {
	await ensureInit();
	await getPool().query("DELETE FROM cope_sessions WHERE sid = $1", [sid]);
}

// ---- single-claim tokens ---------------------------------------------------
async function tokenGet(token) {
	await ensureInit();
	const { rows } = await getPool().query(
		"SELECT token FROM cope_tokens WHERE token = $1 AND expires_at > $2",
		[token, Date.now()]
	);
	return rows[0] ? { key: token } : null;
}
async function tokenCreate(token, ttlSeconds) {
	await ensureInit();
	await getPool().query(
		"INSERT INTO cope_tokens (token, claimed, created_at, expires_at) VALUES ($1, 0, $2, $3)",
		[token, Date.now(), Date.now() + ttlSeconds * 1000]
	);
}
async function tokenClaimLock(token, ttlSeconds) {
	// Atomically flips claimed 0->1 for an unexpired token; true only for the
	// one call that wins, so a token can redeem the payload exactly once.
	await ensureInit();
	const { rows } = await getPool().query(
		"UPDATE cope_tokens SET claimed = 1 WHERE token = $1 AND claimed = 0 AND expires_at > $2 RETURNING token",
		[token, Date.now()]
	);
	if (rows.length === 0) {
		await cleanupExpired(); // opportunistic garbage collection
	}
	return rows.length > 0;
}

// ---- per-minute rate limit --------------------------------------------------
async function redeemAllowed(ip, limitPerMin) {
	await ensureInit();
	const now = Date.now();
	const { rows } = await getPool().query(
		`INSERT INTO cope_rate (ip, hits, resets) VALUES ($1, 1, $2)
		 ON CONFLICT (ip) DO UPDATE SET
		   hits = CASE WHEN cope_rate.resets < $2 THEN 1 ELSE cope_rate.hits + 1 END,
		   resets = CASE WHEN cope_rate.resets < $2 THEN $2 ELSE cope_rate.resets END
		 RETURNING hits`,
		[ip, now + MINUTE_MS]
	);
	return rows[0].hits <= limitPerMin;
}

// ---- admin login brute-force throttle ---------------------------------------
// After `maxAttempts` failed logins from one IP, further attempts are refused
// until a short cooldown elapses. Successful logins reset the counter.
const LOGIN_MAX_ATTEMPTS = process.env.LOGIN_MAX_ATTEMPTS
	? Number(process.env.LOGIN_MAX_ATTEMPTS)
	: 10;
const LOGIN_LOCK_MS = process.env.LOGIN_LOCK_MS ? Number(process.env.LOGIN_LOCK_MS) : 10 * 60 * 1000;

async function loginAttemptAllowed(ip) {
	await ensureInit();
	const now = Date.now();
	const { rows } = await getPool().query(
		`SELECT attempts, blocked_until FROM cope_login_rate WHERE ip = $1`,
		[ip]
	);
	const row = rows[0];
	if (!row) return true;
	if (row.blocked_until > now) return false;
	return true;
}

async function loginFailed(ip) {
	await ensureInit();
	const now = Date.now();
	await getPool().query(
		`INSERT INTO cope_login_rate (ip, attempts, blocked_until)
		 VALUES ($1, 1, 0)
		 ON CONFLICT (ip) DO UPDATE SET
		   attempts = CASE
		     WHEN cope_login_rate.blocked_until > $2 THEN cope_login_rate.attempts
		     ELSE cope_login_rate.attempts + 1
		   END,
		   blocked_until = CASE
		     WHEN cope_login_rate.attempts + 1 >= $3 AND cope_login_rate.blocked_until <= $2
		       THEN $4
		     ELSE cope_login_rate.blocked_until
		   END`,
		[ip, now, LOGIN_MAX_ATTEMPTS, now + LOGIN_LOCK_MS]
	);
}

async function loginSucceeded(ip) {
	await ensureInit();
	await getPool().query(`DELETE FROM cope_login_rate WHERE ip = $1`, [ip]);
}

// --------------------------------------------------------------------------
// In-memory fallback (same public API, nothing persists across restarts)
// --------------------------------------------------------------------------
class MemoryBackend {
	constructor() {
		this.keys = new Map();
		this.admin = new Map();
		this.sessions = new Map();
		this.tokens = new Map();
		this.rates = new Map();
		this.loginRates = new Map();
		this.partSessions = new Map();
		this.telemetry = [];
		this.flags = new Map();
		this.statsMap = new Map();
	}

	async getAdminHash() {
		return this.admin.get("password") || null;
	}
	async setAdminHash(hash) {
		this.admin.set("password", hash);
	}
	async findByKey(k) {
		return this.keys.get(k) || null;
	}
	async insertKey(k, note, created, expires, type) {
		this.keys.set(k, { key: k, note, created, expires, type: type || "temporary", revoked: 0, uses: 0, last_use: null });
	}
	async listKeys() {
		return [...this.keys.values()].sort((a, b) => (a.created < b.created ? 1 : -1));
	}
	async setKeyType(k, type) {
		const r = this.keys.get(k);
		if (r) r.type = type;
	}
	async bumpUse(k) {
		const r = this.keys.get(k);
		if (r) {
			r.uses += 1;
			r.last_use = new Date().toISOString();
		}
	}
	async setRevoked(k, revoked) {
		const r = this.keys.get(k);
		if (r) r.revoked = revoked ? 1 : 0;
	}
	async deleteKey(k) {
		this.keys.delete(k);
	}
	async setExpires(k, expiresIso) {
		const r = this.keys.get(k);
		if (r) r.expires = expiresIso;
	}
	async getFlag(name) {
		return this.flags.get(name) ?? null;
	}
	async setFlag(name, value) {
		this.flags.set(name, String(value));
	}
	async deleteFlag(name) {
		this.flags.delete(name);
	}
	async statsHit(day, kind) {
		const row = this.statsMap.get(day) || { day, redeems: 0, rejects: 0 };
		if (kind === "reject") row.rejects += 1;
		else row.redeems += 1;
		this.statsMap.set(day, row);
	}
	async statsAll() {
		return [...this.statsMap.values()].sort((a, b) => (a.day < b.day ? -1 : 1));
	}
	async sessionValid(sid) {
		const exp = this.sessions.get(sid);
		return !!exp && exp > Date.now();
	}
	async sessionCreate(sid, ttlSeconds) {
		this.sessions.set(sid, Date.now() + ttlSeconds * 1000);
	}
	async sessionDestroy(sid) {
		this.sessions.delete(sid);
	}
	async tokenGet(token) {
		const t = this.tokens.get(token);
		if (t && t.exp > Date.now()) return { key: token };
		return null;
	}
	async tokenCreate(token, ttlSeconds) {
		this.tokens.set(token, { claimed: false, exp: Date.now() + ttlSeconds * 1000 });
	}
	async tokenClaimLock(token) {
		const t = this.tokens.get(token);
		if (!t || t.claimed || t.exp <= Date.now()) return false;
		t.claimed = true;
		return true;
	}
	async partSessionCreate(token, seedsJson, ttlSeconds) {
		this.partSessions.set(token, { seeds: seedsJson, exp: Date.now() + ttlSeconds * 1000 });
	}
	async partSessionGet(token) {
		const t = this.partSessions.get(token);
		if (!t || t.exp <= Date.now()) return null;
		return t.seeds;
	}
	async partSessionDelete(token) {
		this.partSessions.delete(token);
	}
	async addTelemetry(entry) {
		this.telemetry.unshift({
			id: this.telemetry.length + 1,
			time: entry.time,
			username: entry.username,
			user_id: entry.userId,
			executor: entry.executor,
			key: entry.key,
		});
	}
	async listTelemetry(limit = 200) {
		return this.telemetry.slice(0, limit);
	}
	async telemetryCount() {
		return this.telemetry.length;
	}
	async redeemAllowed(ip, limitPerMin) {
		const now = Date.now();
		let r = this.rates.get(ip);
		if (!r || r.resets < now) r = { hits: 0, resets: now + MINUTE_MS };
		r.hits += 1;
		this.rates.set(ip, r);
		return r.hits <= limitPerMin;
	}
	async loginAttemptAllowed(ip) {
		const r = this.loginRates.get(ip);
		if (!r) return true;
		return r.blockedUntil <= Date.now();
	}
	async loginFailed(ip) {
		const now = Date.now();
		let r = this.loginRates.get(ip);
		if (!r || r.blockedUntil > now) {
			if (!r) r = { attempts: 0, blockedUntil: 0 };
		} else {
			r = { attempts: r.attempts, blockedUntil: r.blockedUntil };
		}
		r = { attempts: r.blockedUntil > now ? r.attempts : r.attempts + 1, blockedUntil: r.blockedUntil };
		if (r.attempts >= LOGIN_MAX_ATTEMPTS && r.blockedUntil <= now) r.blockedUntil = now + LOGIN_LOCK_MS;
		this.loginRates.set(ip, r);
	}
	async loginSucceeded(ip) {
		this.loginRates.delete(ip);
	}
}

let store = null;
function getStore() {
	if (!store) {
		if (process.env.DATABASE_URL) {
			console.log("[kv] using Postgres (DATABASE_URL set)");
			store = {
				getAdminHash,
				setAdminHash,
				findByKey,
				insertKey,
				listKeys,
				bumpUse,
				setRevoked,
				deleteKey,
				setExpires,
				setKeyType,
				getFlag,
				setFlag,
				deleteFlag,
				statsHit,
				statsAll,
				sessionValid,
				sessionCreate,
				sessionDestroy,
				tokenGet,
				tokenCreate,
				tokenClaimLock,
				partSessionCreate,
				partSessionGet,
				partSessionDelete,
				addTelemetry,
				listTelemetry,
				telemetryCount,
				redeemAllowed,
				loginAttemptAllowed,
				loginFailed,
				loginSucceeded,
			};
		} else {
			console.log("[kv] using in-memory store (local dev; set DATABASE_URL for real persistence)");
			const m = new MemoryBackend();
			store = {
				getAdminHash: () => m.getAdminHash(),
				setAdminHash: (h) => m.setAdminHash(h),
				findByKey: (k) => m.findByKey(k),
				insertKey: (k, n, c, e, t) => m.insertKey(k, n, c, e, t),
				listKeys: () => m.listKeys(),
				bumpUse: (k) => m.bumpUse(k),
				setRevoked: (k, r) => m.setRevoked(k, r),
				deleteKey: (k) => m.deleteKey(k),
				setExpires: (k, e) => m.setExpires(k, e),
				setKeyType: (k, t) => m.setKeyType(k, t),
				getFlag: (n) => m.getFlag(n),
				setFlag: (n, v) => m.setFlag(n, v),
				deleteFlag: (n) => m.deleteFlag(n),
				statsHit: (d, k) => m.statsHit(d, k),
				statsAll: () => m.statsAll(),
				sessionValid: (s) => m.sessionValid(s),
				sessionCreate: (s, t) => m.sessionCreate(s, t),
				sessionDestroy: (s) => m.sessionDestroy(s),
				tokenGet: (t) => m.tokenGet(t),
				tokenCreate: (t, tl) => m.tokenCreate(t, tl),
				tokenClaimLock: (t) => m.tokenClaimLock(t),
				partSessionCreate: (t, seeds, ttl) => m.partSessionCreate(t, seeds, ttl),
				partSessionGet: (t) => m.partSessionGet(t),
				partSessionDelete: (t) => m.partSessionDelete(t),
				addTelemetry: (e) => m.addTelemetry(e),
				listTelemetry: (l) => m.listTelemetry(l),
				telemetryCount: () => m.telemetryCount(),
				redeemAllowed: (ip, lim) => m.redeemAllowed(ip, lim),
				loginAttemptAllowed: (ip) => m.loginAttemptAllowed(ip),
				loginFailed: (ip) => m.loginFailed(ip),
				loginSucceeded: (ip) => m.loginSucceeded(ip),
			};
		}
	}
	return store;
}

function randomId(bytes) {
	return crypto.randomBytes(bytes).toString("hex");
}

// True when a Postgres connection is configured - i.e. the only mode where
// keys, the admin password and sessions survive cold starts and redeploys.
function isPersistent() {
	return !!process.env.DATABASE_URL;
}

module.exports = {
	...getStore(),
	randomId,
	isPersistent,
};