# CopE Loader — key-gated script loader

A free, self-hosted Roblox script loader with a key system, script packing and
an admin console — **admin-only**. There is no public homepage: you create keys
in the console and hand buyers a **loader snippet** instead of a website link.
When the buyer pastes the snippet into their executor it POSTs their key to
`/api/redeem`; the server validates it and returns the **packed** script, which
the snippet decrypts and runs. No plaintext is ever served, and revoking a key
kills every copy of that snippet instantly.

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

1. Open `http://127.0.0.1:3300` — it redirects to `/admin` (this site is
   admin-only).
2. The **first** thing `/admin` asks is to set an admin password (min 8 chars).
   It's stored as a SHA-256 in the database (table `cope_admin`); keep it safe.
3. On the admin page: set the note (buyer name), pick an expiry, enter the
   count, hit **Generate keys**.
4. For each key hit **Loader** → **Copy**. Send that Luau snippet to the buyer
   (it contains their key). You never give out website links.
5. Replace `scripts/main.luau` with your real script — the server picks the new
   file up automatically (it re-reads on mtime change).

## How it works for a buyer

1. You send them a one-key loader snippet (from the admin console).
2. They paste it into their executor. The snippet:

   - POSTs the key to `/api/redeem` (server-side validation, rate-limited);
   - on success gets the **only** copy of the packed payload + seed;
   - rebuilds the keystream with the **same Park–Miller LCG the server used**
     (verified byte-for-byte against the JS packer in an executor);
   - XORs the bytes back to your source and `loadstring`s it.

Every run re-validates the key. If you revoke a key, every snippet carrying it
stops working on the next load — no loader redistribution survives a revoke.
The same key can be re-redeemed as often as the buyer wants; keys never expire
unless you set an expiry.

## Protection model (read this — honest limits)

| What | How |
|---|---|
| Script never leaks as text | payload only ever leaves the server XOR-packed, gated by a valid server-side key check |
| Keys | unique `KEY-XXXX...` per buyer; revoke anytime; optional expiry |
| Revoke = kill switch | a revoked key makes every snippet carrying it fail at the next run |
| Script won't run for free | without a valid key no blob is ever handed out |
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

- `POST /api/redeem {key}` → `{ ok, blob, seed, size }` (packed payload; used by the loader snippet)
- Admin (session cookie): `POST /api/admin/setup`, `POST /api/admin/login`,
  `GET/POST /api/admin/keys`, `GET /api/admin/keys/:id/loader` (build the snippet),
  `POST /api/admin/keys/:id/revoke`, `DELETE /api/admin/keys/:id`, `GET /api/admin/stats`
- Root `/` redirects to `/admin` — no public buyer page exists

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