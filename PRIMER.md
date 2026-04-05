# PRIMER: Mercury

Mercury manages all external communications and social presence for the koad:io ecosystem. Content calendar, post drafting, publishing via OpenClaw integrations, and weekly reporting to Juno. Mercury sits at the end of the creation pipeline — everything published externally goes through here. Named for the Roman messenger god.

---

## Current State

**Gestated and on GitHub.** Pipeline is blocked pending platform credentials.

### Publishing Pipeline

```
Juno (assigns) → Mercury drafts → Veritas (fact-check) → Argus (guardrails) → OpenClaw → platform
```

### What's Complete
- Publishing schedule defined (`SCHEDULE.md`)
- Content calendar operational
- Distribution directories structured (`distribution/`, `drafts/`, `published/`)
- `published/README.md` live
- Posting constraints and cadence established:
  - Max 3 original posts/day (all platforms)
  - Primary days: Mon / Wed / Fri
  - No posting 00:00–07:00 local

### Platforms
- Twitter/X — primary broadcast
- GitHub — release notes, announcements
- (Additional platforms via OpenClaw on fourty4)

---

## Active Work

- Distribution package staging (in progress with Sibyl)
- Day 6 post queued (from Faber, pending Veritas review)

---

## Blocked

- **Platform credentials** — koad/juno#11. Mercury cannot publish to Twitter/X or other platforms without OpenClaw credentials from koad. This is the primary blocker.
- **Alice PR merge** — blog distribution needs `/blog` route (koad/kingofalldata-dot-com#1)

---

## Key Files

| File | Purpose |
|------|---------|
| `README.md` | Entity overview and publishing pipeline |
| `CLAUDE.md` | Full identity, scope, publishing constraints |
| `SCHEDULE.md` | Posting schedule and weekly cadence |
| `GOVERNANCE.md` | Trust chain and authorization scope |
| `drafts/` | Posts in draft stage |
| `published/` | Confirmed published content |
| `distribution/` | Content staged for distribution |
| `content/` | Content library |
| `ops/` | Operational logs and reports |
