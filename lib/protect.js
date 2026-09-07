"use strict";
const crypto = require("crypto");

// Everything is a 32-bit LCG (Park-Miller) with modulus M.
// The state always stays < 2^31, so `a * 16807` stays < 2^45 -- exact in
// doubles on BOTH Node.js and Luau, which lets the Roblox-side loader
// reproduce the exact same keystream with the same arithmetic.
const M = 2147483647;

function seedFromToken(token) {
	let s = 0;
	for (let i = 0; i < token.length; i++) {
		s = (s * 33 + token.charCodeAt(i)) % (M - 1);
	}
	s = (s % (M - 1)) + 1; // force into [1, M-1]
	return s;
}

function keystream(seed, n) {
	const out = Buffer.alloc(n);
	let a = seed;
	for (let i = 0; i < n; i++) {
		a = (a * 16807) % M;
		if (a === 0) a = 12345; // keep the generator alive
		out[i] = a & 0xff;
	}
	return out;
}

function pack(sourceUtf8, seed) {
	const src = Buffer.from(sourceUtf8, "utf8");
	const key = keystream(seed, src.length);
	const out = Buffer.alloc(src.length);
	for (let i = 0; i < src.length; i++) out[i] = src[i] ^ key[i];
	return out;
}

// Comma-joined decimal bytes; the loader splits this and XORs its own copy
// of the keystream to rebuild the exact UTF-8 bytes.
function blobToString(outBuf) {
	return Array.from(outBuf, (b) => String(b)).join(",");
}

function unpack(blobCsv, seed) {
	const parts = String(blobCsv).split(",");
	const src = Buffer.alloc(parts.length);
	let a = seed;
	for (let i = 0; i < parts.length; i++) {
		a = (a * 16807) % M;
		if (a === 0) a = 12345;
		src[i] = (Number(parts[i]) ^ (a & 0xff)) & 0xff;
	}
	return src.toString("utf8");
}

function randomToken() {
	return crypto.randomBytes(24).toString("hex");
}

function generateKey() {
	return (
		"KEY-" +
		crypto.randomBytes(9).toString("base64url").replace(/[-_]/g, "9").toUpperCase()
	);
}

// Random stable-ish identifier for loader variable names, so two fetches of
// the loader are never byte-identical.
function loaderIdent() {
	const alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
	let out = alphabet[Math.floor(Math.random() * 26)];
	for (let i = 0; i < 4; i++) {
		out += alphabet[Math.floor(Math.random() * alphabet.length)];
	}
	return out;
}

module.exports = {
	M,
	seedFromToken,
	keystream,
	pack,
	blobToString,
	unpack,
	randomToken,
	generateKey,
	loaderIdent,
};