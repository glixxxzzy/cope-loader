# CopE Loader — key-gated script loader

A free, self-hosted Roblox script loader with a key system, script packing and
an admin console. Built as a direct answer to "Luarmor-style, but self-hosted
and free": buyers land on the site, enter a key you gave them, and copy a
paste-into-executor loader containing your **packed** script. No plaintext is
ever served, the generated loader expires, and each loader token can only be
claimed **once**.

## Stack (100% free)

- Node.js `>= 22.5`
- Express (`npm i express`) — plus `pg` (Postgres driver)
- Vanilla HTML/CSS/JS front end — zero CDNs
- Storage: **Postgres** when `DATABASE_URL` is set (free tiers: Neon,
  Supabase, Railway...) — this is what makes Vercel work. Without it the app
  falls back to an in-memory store for local dev only.

## Quick start

```bash
npm install
node server.js
```

1. Open `http://127.0.0.1:3300` — you see the loader page.
2. Open `http://127.0.0.1:3300/admin` — the **first** thing it asks is to set an
   admin password (min 8 chars). It's stored as a SHA-256 in the database (table
   `cope_admin`); keep it safe.
3. On the admin page: set the note (buyer name), pick an expiry, enter the
   count, hit **Generate keys**. Copy the keys, hand them to your buyers.
4. Replace `scripts/main.luau` with your real script — the server picks the new
   file up automatically (it re-reads on mtime change).

## How a buyer uses it

1. Enters their key on the homepage.
2. Gets a Luau snippet + a "copy" button (the snippet expires in ~15 min).
3. Pastes it into their executor. The snippet:

   - calls `/api/claim?token=...` — the **only** place the packed payload exists;
   - rebuilds the keystream with the **same Park–Miller LCG the server used**
     (verified byte-for-byte against the JS packer in an executor);
   - XORs the bytes back to your source and `loadstring`s it.

Re-running a stale snippet after the window (or a re-shared one) fails — the
server rejects used tokens, so copied snippets rot. Your key is unlimited: your
buyer can just redeem again.

## Protection model (read this — honest limits)

| What | How |
|---|---|
| Script never leaks as text | payload only ever leaves the server XOR-packed, gated by a valid token |
| Keys | unique `KEY-XXXX...` per buyer; revoke anytime; optional expiry |
| Loader copies rot | 15-minute tokens, single-claim, server-validated |
| Script won't run for free | without a valid unclaimed token no blob is ever handed out |
| Execution only for intact payload | the loader aborts if `loadstring` fails to compile |

Limits (deliberate, so you don't oversell it): this is **not** a VM obfuscator.
A determined skid who buys one key can capture the decypted source while it
runs, and a skilled reverser can pull the raw bytes — that's inherent to any
client-side scheme. What this stops, effectively, is casual copying, scraper
bots, and shared loaders. For per-machine binding, the clean next step is a HWID
handshake in `/api/claim` (send a machine fingerprint, mint a short secret keyed
to it).

## Configuration

Env vars (all optional except on Vercel):

```text
DATABASE_URL       Postgres connection string (required for real persistence / Vercel)
PUBLIC_BASE_URL    public URL loaders should point at, e.g. https://your-app.vercel.app
TOKEN_TTL_MS       loader expiry window (default 900000 = 15 min)
REDEEM_RATE_LIMIT  redeem attempts per IP per minute (default 10)
PORT               local server port (default 3300)
ADMIN_PASSWORD     if set, pre-installs this as the admin password (first boot only)
```

`publicBaseUrl` in `config.json` also works (used when `PUBLIC_BASE_URL` is not set).

## Deploying for free

- **Local + tunnel (zero config):** run `node server.js`, then
  `cloudflared tunnel --url http://127.0.0.1:3300` (Cloudflare's free CLI). You
  get a public HTTPS URL instantly.
- **Vercel (serverless, always-on):**
  1. Create a free Postgres on [Neon](https://neon.tech) (or Supabase). Copy the
     connection string.
  2. Push this folder to a GitHub repo.
  3. In Vercel: **Add New Project** → import the repo. No build command. The
     install command stays `npm install`.
  4. Add env vars: `DATABASE_URL` (the Neon string) and
     `PUBLIC_BASE_URL` = `https://<your-project>.vercel.app`. Optionally
     `ADMIN_PASSWORD` to pre-set your admin password.
  5. Deploy. Open the project URL → `/admin` to manage keys; the homepage is the
     buyer entry.
  - `vercel.json` bundles `public/`, `scripts/`, `lib/` and `config.json` into
    the serverless function and routes every path through the Express app.
  - Update `scripts/main.luau` in the repo and redeploy to ship a new script.

## API snapshot

- `POST /api/redeem {key}` → `{ loader, ttlSeconds, expiresAt, payloadBytes }`
- `GET /api/claim?token=...` → `{ blob, seed, size }` (single claim, TTL-bound)
- Admin (session cookie): `POST /api/admin/setup`, `POST /api/admin/login`,
  `GET/POST /api/admin/keys`, `POST /api/admin/keys/:id/revoke`,
  `DELETE /api/admin/keys/:id`, `GET /api/admin/stats`

## Files

```
server.js          local launcher (listens + SIGINT handling)
app.js             the whole Express app (shared by local + Vercel)
api/index.js       Vercel serverless entrypoint (module.exports = app)
vercel.json        Vercel routing + function bundle config
lib/protect.js     LCG pack/unpack + key/token generators
lib/kv.js          storage layer (Postgres via DATABASE_URL, else in-memory)
lib/loader.js      builds the Luau snippet (randomized names per redemption)
public/            landing page + admin console
scripts/main.luau  your protected script (replace me)
test-flow.mjs      end-to-end smoke test  (node test-flow.mjs)
```

## Rebuilding the smoke test

```bash
node test-flow.mjs
```