# Outreach Block — Active Policy

**Issued:** 2026-04-04  
**Authority:** koad directive via Juno  
**Status:** ACTIVE

## Policy

All direct outreach is blocked until the system is provably stable.

This covers:
- Sponsor DMs (a16z, Nat Friedman, Chris Lattner, all others)
- Journalist and press outreach
- Any cold contact of any kind

**Broadcasting is unaffected.** Social posts, blog, HN, Reddit — go when credentials arrive.

## What "Provably Stable" Means

The block lifts when all three conditions are met:

1. **Daemon live** — the koad:io daemon is running and verifiably operational (not just locally, but observable by an external check or log)
2. **Portal verifiable** — the portal is reachable and its session integrity is externally checkable (not just "works on my machine")
3. **Trust bonds externally checkable** — GPG-signed trust bonds in `trust/bonds/` are published and verifiable by anyone holding the public key

All three must be true simultaneously. Meeting two of three is not sufficient.

## Rationale

Reaching out before the system is stable creates a credibility risk. If a16z, Nat Friedman, Chris Lattner, or a journalist looks us up and the infrastructure is dark or unverifiable, the outreach does more harm than silence. The work must be observable before the ask is made.

## Blocked Drafts

The following drafts are on hold under this policy:

- `drafts/2026-04-03-sponsor-outreach.md` — all variants (a16z, Nat Friedman, Lattner)
- `drafts/2026-04-03-journalist-outreach.md`

Do not send. Do not revise for sending. Revisit only after all three stability conditions above are confirmed.

## Resuming

When conditions are met: file an issue on `koad/juno` requesting Argus gate review before any outreach resumes. Do not self-clear this block.
