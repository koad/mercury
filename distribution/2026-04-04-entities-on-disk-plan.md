---
post: "Entities Are Running on Disk"
source: ~/.faber/posts/2026-04-04-entities-on-disk.md
date: 2026-04-04
status: PENDING KOAD REVIEW — do not distribute
prepared_by: Mercury
pillar: Reality
series: "2-Week Reality Proof"
---

# Distribution Plan: "Entities Are Running on Disk"

**Hold until:** koad approves the source post. Veritas fact-check required before any platform submission.

**Why this piece distributes well:** Concrete code (full hook in one terminal screen), a working demo (15 entities, roll call output), and a clear architectural argument. HN and r/selfhosted will engage with the implementation details. The "not your keys, not your agent" framing is memorable and debatable — that drives comments.

---

## Pre-Distribution Checklist

- [ ] koad approves post
- [ ] Veritas fact-check: roll call output, entity count (15), machine names (`thinker`, `fourty4`), hardware cost claim ("under $1,000"), hook code accuracy
- [ ] Argus gate: all four platform submissions
- [ ] Confirm Day 5 post ("trust bonds in depth") is drafted before distributing Day 4 — the post promises it

---

## Platform Plans

### 1. HackerNews

**Submit as:** Show HN

**Title:**
```
Show HN: I run 15 AI agents on a Mac Mini – each is a git repo + SSH hook
```

**Alt title (if Show HN is rejected):**
```
Not your keys, not your agent: sovereign AI agents on your own hardware
```

**Why Show HN:** The post includes the full routing hook (~15 lines of bash), the exact directory structure, and a working demo. This is a working thing, not a concept. Show HN is appropriate.

**Submission URL:** link to published blog post on kingofalldata.com

**Submission comment (paste in the HN text field):**
```
Day 4 of a 2-week public build log. Yesterday we brought kingofalldata.com
live. Today I'm showing what's actually running underneath — 15 entities,
each a git repo at ~/.<entity>/, routed via a ~15-line bash hook over SSH.

The hook is in the post. The directory structure is in the post. The trust
bond format (GPG-signed YAML) is in the post.

Happy to answer questions about the architecture or the failure modes we
hit before this worked.
```

**Timing:** Monday 2026-04-06, 09:00–10:00 PT (HN morning window, US east coast coming online)

**Expected engagement:** Implementation questions about SSH concurrency, the base64 encoding approach, and memory architecture. Likely pushback on "sovereign" framing — be ready to engage, one substantive reply per thread.

**Edits needed:** None. Post is written for a technical audience and reads well as-is.

---

### 2. r/selfhosted

**Subreddit:** r/selfhosted (200k members)

**Title:**
```
Self-hosted AI agents: each entity is a git repo + SSH hook. 15 running on one Mac Mini.
```

**Alt title:**
```
I moved 15 AI agents to a Mac Mini. Each one is just a directory. Here's the routing hook.
```

**Post type:** Link post → published blog URL. If link posts require flair, use "Project".

**Body text (for link post description or if text post required):**
```
Day 4 of building koad:io in public. The core idea: AI agents that are just
directories — CLAUDE.md for identity, memories/ for state, a bash hook for
routing. No cloud platform. No managed service.

The hook that routes all 15 entities is ~15 lines of bash. Full code in the
post, along with the directory structure and how migration works (moving an
entity to a different host = change one variable, commit).

The "not your keys, not your agent" section is the philosophical argument;
the rest is implementation.
```

**Timing:** Monday 2026-04-06, 11:00–13:00 UTC (r/selfhosted peaks mid-morning UTC)

**Expected engagement:** Questions about Claude API costs, model swapping (local LLM compatibility), and whether this works with open models. The post directly addresses vendor failure — that resonates with this community.

**Edits needed:** None. The self-hosted angle is the primary angle of the post — no rework required.

---

### 3. Twitter/X Thread

**Format:** 7-tweet thread

**Thread:**

---

Tweet 1 (hook):
```
This morning I sent one command from a $200 laptop.

15 AI agents answered. All running on a Mac Mini.

Here's what "running on disk" actually means — and why it matters who holds the keys. 🧵
```

Tweet 2 (the roll call):
```
The roll call output:

-> I am Vulcan, product-builder AI, confirmed running on fourty4.
-> I am Mercury, communications entity, confirmed running on fourty4.
-> I am Vesta, platform-keeper, running on fourty4.
-> I am Alice, onboarding guide, confirmed running on fourty4.

All 15. In parallel.
```

Tweet 3 (the hook — paste the code):
```
The entire routing layer. ~15 lines of bash.

No message broker. No API gateway. No service registry.

SSH + a directory.

[screenshot of the hook code from the post]
```

Tweet 4 (what an entity is):
```
Each entity is:
- A git repo at ~/.<entity>/ on a machine you control
- CLAUDE.md = identity (loaded every session)
- memories/ = state (written and committed between sessions)
- hooks/ = routing

The git log IS the long-term memory.
```

Tweet 5 (the principle):
```
"Not your keys, not your coins" → "Not your keys, not your agent."

If Anthropic stops offering Claude tomorrow:
- The directory still exists
- Every memory, strategy doc, trust bond — still on disk
- Swap `claude` for a local model in the hook
- Same entity. Different engine.
```

Tweet 6 (what you can do):
```
Because it's a git repo, you get:

fork → clone, change CLAUDE.md, new entity
branch → test a strategy, merge if it works
diff → compare strategies across time
revert → undo a config change instantly

SaaS agent platforms don't give you git log access to your agent's history.
```

Tweet 7 (close + link):
```
Full post: directory structure, trust bonds (GPG-signed YAML), the migration story, and why this scales differently than traditional services.

Day 4 of a 2-week public build. Tomorrow: trust bonds in depth.

[link to post]
```

---

**Timing:** Monday 2026-04-06, 09:30 PT (after HN submission is live — cross-traffic)

**Edits needed for Twitter:**
- Tweet 3 needs a screenshot of the hook code (not a code block — screenshots render better on X for code). Prepare the screenshot before posting.
- Tweet 1: remove the emoji if voice rules conflict. Current Mercury voice guidelines say no emojis unless explicitly requested — flag for koad.
- Keep replies to engaged technical questions only. One reply per thread unless conversation is active and substantive (per voice rules).

---

### 4. IndieHackers

**Post type:** "In-Progress" milestone post in the build-in-public section

**Title:**
```
Day 4: 15 AI agents confirmed running on one Mac Mini — here's the full architecture
```

**Body:**
```
Day 4 of the 2-week koad:io reality proof. Yesterday: site live. Today: showing what's actually running it.

The core architecture: each AI entity is a git repo. Identity in CLAUDE.md. State in memories/, committed to git between sessions. Routing via a ~15-line bash hook over SSH.

The entire "15 entities answering in parallel" demo runs through parallel SSH invocations to a single Mac Mini. No cloud platform. No managed service. Hardware cost under $1,000.

The post covers:
- What "entities are files" means architecturally
- The exact routing hook (full code)
- How migration works (change one variable, commit)
- Trust bonds as GPG-signed YAML files
- Why "not your keys, not your agent" matters for builders

Full post: [link]

Tomorrow: trust bonds in depth — why GPG beats RBAC for agent authorization, and how to verify one from scratch.
```

**Timing:** Monday 2026-04-06, 12:00 PT (IH audience is builder-heavy, peaks early afternoon)

**Edits needed:** None. IndieHackers readers track build-in-public series — the "Day 4" framing lands well here.

---

## Timing Summary

| Platform | Date | Time | Notes |
|----------|------|------|-------|
| HackerNews | Mon 2026-04-06 | 09:00–10:00 PT | Submit first — anchor for the day |
| Twitter/X | Mon 2026-04-06 | 09:30 PT | After HN submission is live |
| r/selfhosted | Mon 2026-04-06 | 11:00–13:00 UTC | ~03:00–05:00 PT |
| IndieHackers | Mon 2026-04-06 | 12:00 PT | After HN traction is visible |

Rationale for Monday: post was published Saturday. Weekend posts on HN and Reddit underperform. Monday morning gives maximum West Coast + East Coast overlap for HN. r/selfhosted UTC timing catches EU audience first.

---

## Platform-Specific Risks

**HackerNews:**
- Self-promotion risk: mitigated by Show HN format and full code disclosure
- "Just use LangChain" comments likely — post already addresses this implicitly; do not engage defensively
- Do not submit if kingofalldata.com is down or slow — HN readers will check immediately

**r/selfhosted:**
- Rule check before submitting: confirm r/selfhosted allows blog link posts on day of submission (rules change)
- Hardware cost claim ("under $1,000") must be Veritas-verified — this will be challenged

**Twitter/X:**
- Emoji in tweet 1 — flag for koad, Mercury voice rules say no emojis unless requested
- Code screenshot for tweet 3: needs to be prepared in advance (not at post time)

**IndieHackers:**
- Low risk. Audience is warm to build-in-public. No sensitive claims.

---

## What Is Not Being Distributed Here

Per CLAUDE.md stop blocks, the following are out of scope for this distribution push:
- Direct journalist or press outreach (stop block: press/media accounts)
- Posting to any platform not listed above
- Paid promotion or boosting
- Replies to hostile or adversarial accounts engaging with this post

If HN or Reddit threads surface journalist interest, escalate to Juno before responding.

---

## After Distribution

- Comment on the Faber issue with publish log (platform, URL, timestamp, initial engagement)
- Monitor HN/Reddit for technical questions koad wants to answer personally
- Do not reply to comments unless koad explicitly assigns it or conversation is active and substantive
- Report engagement back to Juno in weekly summary
