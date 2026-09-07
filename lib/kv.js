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
		"SELECT key, note, created, expires, revoked, uses, last_use FROM cope_keys WHERE key = $1",
		[k]
	);
	return rows[0] || null;
}
async function insertKey(k, note, created, expires) {
	await ensureInit();
	await getPool().query(
		"INSERT INTO cope_keys (key, note, created, expires, revoked, uses) VALUES ($1, $2, $3, $4, 0, 0)",
		[k, note, created, expires]
	);
}
async function listKeys() {
	await ensureInit();
	const { rows } = await getPool().query(
		"SELECT key, note, created, expires, revoked, uses, last_use FROM cope_keys ORDER BY created DESC"
	);
	return rows;
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
	async insertKey(k, note, created, expires) {
		this.keys.set(k, { key: k, note, created, expires, revoked: 0, uses: 0, last_use: null });
	}
	async listKeys() {
		return [...this.keys.values()].sort((a, b) => (a.created < b.created ? 1 : -1));
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
	async redeemAllowed(ip, limitPerMin) {
		const now = Date.now();
		let r = this.rates.get(ip);
		if (!r || r.resets < now) r = { hits: 0, resets: now + MINUTE_MS };
		r.hits += 1;
		this.rates.set(ip, r);
		return r.hits <= limitPerMin;
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
				sessionValid,
				sessionCreate,
				sessionDestroy,
				tokenGet,
				tokenCreate,
				tokenClaimLock,
				redeemAllowed,
			};
		} else {
			console.log("[kv] using in-memory store (local dev; set DATABASE_URL for real persistence)");
			const m = new MemoryBackend();
			store = {
				getAdminHash: () => m.getAdminHash(),
				setAdminHash: (h) => m.setAdminHash(h),
				findByKey: (k) => m.findByKey(k),
				insertKey: (k, n, c, e) => m.insertKey(k, n, c, e),
				listKeys: () => m.listKeys(),
				bumpUse: (k) => m.bumpUse(k),
				setRevoked: (k, r) => m.setRevoked(k, r),
				deleteKey: (k) => m.deleteKey(k),
				sessionValid: (s) => m.sessionValid(s),
				sessionCreate: (s, t) => m.sessionCreate(s, t),
				sessionDestroy: (s) => m.sessionDestroy(s),
				tokenGet: (t) => m.tokenGet(t),
				tokenCreate: (t, tl) => m.tokenCreate(t, tl),
				tokenClaimLock: (t) => m.tokenClaimLock(t),
				redeemAllowed: (ip, lim) => m.redeemAllowed(ip, lim),
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