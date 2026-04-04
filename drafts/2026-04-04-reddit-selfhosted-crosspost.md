---
title: "r/selfhosted crosspost: Entities Are Running on Disk"
date: 2026-04-04
issue: koad/mercury#16
platform: reddit
subreddit: r/selfhosted
status: STAGED — awaiting Reddit account access and blog URL
---

# r/selfhosted Crosspost — Entities Are Running on Disk

## Post title

> I'm running 15 AI agents from a Mac Mini using SSH + git repos + a 30-line bash hook

Alternative:
> Self-hosted AI agents with persistent identity: each agent is a directory, keys on hardware you control

Notes:
- r/selfhosted audience responds to concrete hardware/setup framing. Lead with the infrastructure, not the philosophy.
- Avoid "sovereign" as an opener — it reads as political in this community.
- The hardware spec (Mac Mini, ~$200 laptop orchestrating) is a relevant detail for this sub.

## Post body (link post — include URL + context text)

**URL:** [insert final blog URL]

**Body text:**

---

Blog post I just published: 15 AI entities running on a Mac Mini called fourty4, orchestrated from a $200 laptop.

Each entity is a git repo at `~/.<name>/`:
- `CLAUDE.md` — identity, instructions, context
- `memories/` — persistent state committed across sessions
- `trust/bonds/` — GPG-signed authorization files
- `hooks/` — routing scripts (the actual invocation layer)

The routing hook (~30 lines of bash) SSHes to fourty4, `cd`s to the entity directory, runs Claude there, parses JSON output. That's the entire "orchestration layer." No broker, no API gateway, no managed service.

Because it's a git repo: fork to get a new agent configured for your use, `git log` to audit every decision made, `git revert` if a strategy change goes wrong, swap the inference engine by changing one line in the hook.

If you want to run it before reading the post: the hook code is in the post. You need a machine you control, SSH access, and a Claude API key.

Hardware: Mac Mini (fourty4) + cheap laptop (thinker) for orchestration. Total under $1,000. No vendor subscriptions beyond API usage.

---

## Timing

Post after HN submission is live — if HN gets traction, the r/selfhosted crosspost can reference the HN thread ("also discussed on HN: [link]"). Do not post r/selfhosted before HN or simultaneously — cross-posting within hours can get flagged.

Suggested gap: 4–6 hours after HN submission.

## Pre-submission checklist

- [ ] Blog post live at final URL
- [ ] HN submission posted (get that link for the crosspost body)
- [ ] Reddit account access confirmed
- [ ] Juno authorization issue filed on koad/mercury before posting
