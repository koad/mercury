# PRIMER: Mercury

Mercury manages all external communications and social presence for the koad:io ecosystem. Content calendar, post drafting, distribution, and weekly reporting to Juno. Mercury sits at the end of the creation pipeline — everything published externally goes through here. Named for the Roman messenger god.

---

## Current State

**Queue is built. Waiting on publish blockers.**

Posts 00001–00015 span five content series. Thirteen posts have complete drafts. Four (00010, 00011, 00013, 00012) had GO verdicts and lapsed publish windows in the week of 2026-04-21. Triage completed 2026-04-24 — re-scheduling in progress.

### Publishing Pipeline

```
Juno (assigns via brief) → Mercury drafts → Veritas (fact-check) → Argus (gate) → koad approves → playwright-cli → platform
```

### What's Complete

- Post folder system operational (`~/.mercury/series/` — five series)
- Content calendar established (SCHEDULE.md)
- Distribution plans staged for 27+ posts across six platforms
- Posting constraints defined: max 3/day, primary days Mon/Wed/Fri, no posting 00:00–07:00 local
- Shareable primitives live on kingofalldata.com (flight pages, entity profiles, conversation trees, announcement archives, receipts) — all with OG tags and oembed
- Argus and Veritas gate reports on file for posts 00010, 00011, 00012, 00013

### Platforms

- Twitter/X — primary broadcast (browser profile at `~/.mercury/playwright-profiles/x/`)
- Substack — long-form home, owned subscriber list (profile at `~/.mercury/playwright-profiles/substack/`)
- GitHub — release notes, sponsor thank-yous
- Discord — community (server pending)
- LinkedIn — professional presence (package strategy not finalized)
- Reddit — organic engagement in relevant communities

---

## Active Work

- Post queue triage (2026-04-24): 00010-00013 lapsed windows documented, re-scheduling needed
- 00011 Substack long-form: six key beats defined in README; drafting pending
- 00012 temporal reference: "earlier this week" framing needs revision after 00011 ships

---

## Blocked

- **Stripe keys + founding tier retirement** — cannot publish the founding sponsor CTA until koad/juno unblocks this. This is the highest-leverage single announcement (per Sibyl viral research and Mercury launch arc brief Round 1).
- **Platform credentials handoff** — koad logs into playwright-profiles/ once to seed sessions. Mercury stages; koad approves and submits (stage-and-submit, VESTA-SPEC-037).
- **Publish window re-scheduling (00010–00013)** — all four posts need koad's go-signal to re-assign slots and trigger Argus re-gate.

---

## Key Files

| File | Purpose |
|------|---------|
| `series/` | Post folders organized by series (five series: reality-proof, build-log, alice-curriculum, articulations, human-os) |
| `briefs/` | Assignment briefs from Juno and other entities |
| `ENTITY.md` | Full identity, scope, and publishing constraints |
| `SCHEDULE.md` | Posting schedule and weekly cadence |
| `GOVERNANCE.md` | Trust chain and authorization scope |
| `memories/003-guardrails.md` | Publishing rules — read every session |
| `DISTRIBUTION-QUEUE.md` | Master distribution backlog — 27+ blog posts |
