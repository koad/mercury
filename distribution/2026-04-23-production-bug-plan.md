---
post: "The Hook Bug We Shipped to Production (and What It Cost)"
source: ~/.faber/posts/2026-04-23-the-production-bug.md
date: 2026-04-23
status: APPROVED — Veritas cleared
prepared_by: Mercury
pillar: Reality
series: "Reality Pillar — How It Actually Works"
day: 23
---

# Distribution Plan: "The Hook Bug We Shipped to Production (and What It Cost)"

**Approved for distribution.** Veritas has reviewed and approved. Target distribution: the Monday after the post goes live.

**Why this piece distributes well:** A real production incident with a specific commit reference (`37c65a0`), a named author (Vulcan), a precise failure timeline (3–4 hours of degraded operation), and a genuinely interesting root cause — not a logic bug but a conceptual drift from the original portability principle. HN loves post-mortems with concrete commits and honest accounting. The "assumption that outlived the conditions that made it true" framing is the kind of thing senior engineers forward to their teams.

---

## Pre-Distribution Checklist

- [x] Veritas fact-check complete
- [ ] koad approves distribution
- [ ] Confirm blog URL resolves for this post before submitting to HN
- [ ] Confirm commit `37c65a0` is public on koad/koad-io repo
- [ ] Confirm Day 24 post is published or in queue (post footer references it)

---

## Platform Plans

### 1. HackerNews

**Submit as:** Link post

**Title:**
```
What it costs when your config outlives the assumption it encoded (AI agent post-mortem)
```

**Alt title:**
```
The 4-hour production incident that came from a config setting nobody questioned
```

**Why not Show HN:** This is a post-mortem narrative, not a demo. The technical argument — "conceptual drift is harder to catch than logic errors" — positions better as a straight link post.

**Submission URL:** link to published blog post on kingofalldata.com

**Submission comment (paste in the HN text field):**
```
Day 23 of a build-in-public series on koad:io — 15 AI agents running as git
repos on a Mac Mini.

On Day 5 the entities stopped working. Not loudly. The SSH calls succeeded,
the commands ran, the API calls failed silently two hops away. 3–4 hours of
degraded operation before the cause was visible.

The root cause wasn't a logic error. It was ENTITY_HOST=fourty4 in .env files
for entities that had no business being tied to a specific host. The setting
had been cargo-culted from the infrastructure setup into files where it
served no function except to create a single point of failure when fourty4's
API auth expired.

The fix was four lines of bash (commit 37c65a0, Vulcan). The lesson was
harder: an assumption that made sense in week 1 had become load-bearing
by week 5, and no one noticed the transition.

Post-mortem is here. Happy to discuss the hook architecture, the FORCE_LOCAL
escape hatch, or how we ended up with the portable/rooted/forced-local
classification.
```

**Timing:** Monday, 09:00–10:00 PT, the week of publication

**Expected engagement:** Strong. Post-mortems with specific commits perform well on HN. Expect questions about: how the entities detect they're on the wrong machine, whether ENTITY_HOST should exist at all, and how the orchestrator handles failed invocations. The "promoted assumption" framing will resonate with engineers who've debugged distributed systems failures. Primary objection: "why was ENTITY_HOST a default setting in the first place?" — the post addresses this directly.

**Edits needed:** None. The narrative is structured and the commit ref is live.

---

### 2. r/selfhosted

**Subreddit:** r/selfhosted (200k members)

**Title:**
```
Post-mortem: the config setting that took down all 15 of my self-hosted AI agents for 4 hours
```

**Alt title:**
```
How a single .env variable became a production single point of failure for my self-hosted AI agent fleet
```

**Post type:** Link post → published blog URL. Flair: "Discussion" or "Project"

**Body text:**
```
Day 23 of building koad:io in public — 15 AI agents running as git repos on a
Mac Mini.

Day 5, they all stopped working. The symptom was silent failures two hops
deep: SSH connected fine, commands ran, but the API calls at the far end were
returning 401. Nothing logged it clearly at the invocation point.

Root cause: ENTITY_HOST=fourty4 was set in .env files for most entities.
When fourty4's API key expired, every entity with that setting routed all
calls to a machine that couldn't complete them. No fallback, no error surfaced
at the right level.

The fix was four lines (commit 37c65a0). The real finding was about
configuration hygiene: an ENTITY_HOST setting that was reasonable during
initial setup had been copied into .env files for entities that didn't need
remote routing. It served no purpose there except to create a failure mode.

Full post-mortem with the hook logic and the architecture fix:
[link]
```

**Timing:** Same day as HN, 4–6 hours after HN submission

**Expected engagement:** This audience self-hosts and debugs distributed system failures. They'll engage with the hook architecture and have practical questions about how entity routing works. Expect interest in the FORCE_LOCAL escape hatch and whether the architecture is documented anywhere.

**Edits needed:** None.

---

### 3. Dev.to

**Post type:** Cross-post (canonical URL set to kingofalldata.com)

**Title:**
```
The Config Setting That Took Down Our AI Agent Fleet (Post-Mortem)
```

**Tags:** `ai`, `devops`, `postmortem`, `selfhosted`

**Intro to add above the post body:**
```
*Day 23 of building koad:io in public — 15 AI agents running as git repos on
a Mac Mini, each with its own identity, memory, and signing keys. This is the
honest account of the Day 5 production failure.*
```

**Timing:** Same day as HN, afternoon PT. Dev.to after HN traction is visible.

**Edits needed:** Add canonical URL. Add the series intro above. Set tags.

---

## Cross-Post Sequence

| Platform | Timing | Notes |
|----------|--------|-------|
| HackerNews | Monday 09:00–10:00 PT | Anchor for the day |
| r/selfhosted | Monday 4–6 hours after HN | Drive traffic from HN thread |
| Dev.to | Monday 14:00 PT | After HN traction visible |

---

## What Is Blocked

- Blog PR #1 merge (live URL required before HN submission)
- HN credentials (#11)
- Dev.to credentials (#11)

Reddit (r/selfhosted) can fire with koad's existing Reddit account once the blog URL is live.

---

## After Distribution

- Check whether HN thread surfaces questions about the broader hook architecture — the "portable / rooted / forced-local" model is a follow-on post candidate
- Flag to Faber if Dev.to engagement suggests demand for "how to audit your agent .env files" practical post
- Monitor for "why not just use X routing service" comments — redirect to the sovereignty framing if koad wants to engage
