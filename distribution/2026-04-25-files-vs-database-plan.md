---
post: "Files vs. Database: the Engineering Tradeoff"
source: ~/.faber/posts/2026-04-25-files-vs-database.md
date: 2026-04-25
status: APPROVED — Veritas correction applied
prepared_by: Mercury
pillar: Reality
series: "Reality Pillar"
day: 25
---

# Distribution Plan: "Files vs. Database: the Engineering Tradeoff"

**Approved for distribution.** Veritas correction applied; post is cleared. Target distribution: the Monday after publication.

**Why this piece distributes well:** This is the engineering-credibility post for the koad:io architecture. It leads with Lampson (1983), Kleppmann, and Gray & Reuter — not as name-drops but as the analytical framework for the actual access pattern argument. It admits the file-based failure modes honestly (partial writes, no sub-commit transactions, no query language). It uses both git and MongoDB and explains why. HN's engineering audience responds well to posts that are opinionated but not dogmatic — "files always win" is an argument HN will want to poke at, which is why the post doesn't make that argument. "Match the tool to the access pattern" is defensible and interesting.

---

## Pre-Distribution Checklist

- [x] Veritas correction applied; post approved
- [ ] koad approves distribution
- [ ] Confirm blog URL resolves before HN submission
- [ ] Confirm Sibyl's research file (`~/.sibyl/research/2026-04-05-files-vs-database-engineering.md`) exists (post footnote references it)
- [ ] Confirm Day 24 post is live (post footer references it)

---

## Platform Plans

### 1. HackerNews

**Primary channel.** The database vs. filesystem debate is perennially interesting on HN. This post makes the argument from access pattern analysis rather than ideology, which is the framing HN engineers engage with rather than dismiss.

**Submit as:** Link post

**Title:**
```
Git is a database: why we use files for agent identity and MongoDB for live state
```

**Alt title:**
```
Access patterns, not ideology: why AI agent identity storage belongs on the filesystem
```

**Why this title:** The "git is a database" framing will pull in the database engineering segment. The specific split (files for identity/history, MongoDB for live operational state) is concrete and debatable — people will want to argue about it.

**Submission URL:** link to published blog post on kingofalldata.com

**Submission comment (paste in the HN text field):**
```
Day 25 of building koad:io in public.

The access pattern for an AI agent's identity store: sequential read of
known files on session start, append-only writes during operation, batch
commit at session end. Single writer. Rare random access. No concurrent
multi-writer requirement.

That profile matches flat files and log-structured storage. Git adds
content-addressable integrity, append-only history, atomic commits, and
distributed replication on top. For this workload, it's arguably the right
specialized tool.

The post isn't a "files always win" argument. Real-time shared state
(live entity presence, active session tracking, DDP event bus) lives in
MongoDB — because that workload has concurrent writers, arbitrary field
queries, and schema-flexible document structure. Different access pattern,
different tool.

The split maps to operational data store vs. record of system. The post
tries to make the argument from first principles (Lampson 1983, Gray &
Reuter, Kleppmann Ch. 3) and names the failure modes honestly (partial
writes, no sub-commit transactions, no query language at scale).

Happy to discuss where the analysis breaks down at different scales, or
whether there's a better substrate than git for the append-only history
use case.
```

**Timing:** Monday, 09:00–10:00 PT, the week of publication

**Expected engagement:** High. Database posts always engage on HN. Expect: "you're just reinventing event sourcing" (yes, that's the point), "why not SQLite?" (legitimate question — the post doesn't address it; SQLite is a valid alternative for the identity workload), "git is not a database" (the content-addressable storage argument should handle this), and "what happens to mongo when it's down?" (the post doesn't address daemon dependency directly). The "files for this, Mongo for that" split will probably generate the most interesting thread.

**Edits needed:** None. The post is written for an engineering audience and handles the primary objections.

---

### 2. Reddit r/programming or r/devops

**Primary subreddit:** r/programming (7M members) — the access pattern argument is broadly interesting to engineers.
**Secondary:** r/devops — the operational angle (what breaks at scale, the MongoDB split) is relevant there.

**r/programming title:**
```
Why we store AI agent identity in git and operational state in MongoDB (the access pattern argument)
```

**r/devops title:**
```
Filesystem vs database for AI agent state: how the access pattern determined the architecture
```

**Post type:** Link post → published blog URL.

**Body text for r/programming:**
```
Day 25 of building koad:io in public.

The dominant question when people look at the architecture: "Why files? Why
not just use a database for everything?"

The answer isn't sovereignty or vendor lock-in (that argument is elsewhere
in the series). The answer is the access pattern.

Agent identity: sequential reads on session start, append-only writes during
operation, single writer, rare random access. Git handles this well. Content-
addressable integrity means corruption is immediately detectable. Append-only
history means "what was my state on April 3rd" is git checkout, not "hope
you have backups."

Live operational state: concurrent writers (entity processes, daemon workers,
event listeners), arbitrary field queries, schema-flexible document structure.
MongoDB handles this well. Git does not.

The post makes the argument from Lampson (1983), Gray & Reuter (1992), and
Kleppmann — and names the file-based failure modes honestly (partial writes,
no sub-commit transactions, no SQL at scale). "Files always win" is not the
argument.

[link]
```

**Timing:** Same day as HN, 4–6 hours after HN submission

**Edits needed:** None. Confirm subreddit rules for link posts day-of.

---

### 3. Dev.to

**Post type:** Cross-post (canonical URL set to kingofalldata.com)

**Title:**
```
Why Agent Identity Belongs in Git, Not a Database (Access Pattern Analysis)
```

**Tags:** `ai`, `databases`, `architecture`, `devops`

**Intro to add above the post body:**
```
*Day 25 of building koad:io in public — 15 AI agents running as git repos on
a Mac Mini. This post is the engineering argument for the architecture: why
the access pattern, not ideology, determines the storage choice.*
```

**Timing:** Same day as HN, 14:00 PT

**Edits needed:** Add canonical URL, series intro, and tags.

---

## Cross-Post Sequence

| Platform | Timing | Notes |
|----------|--------|-------|
| HackerNews | Monday 09:00–10:00 PT | Primary channel — database debates dominate here |
| r/programming | Monday 4–6 hours after HN | Broad engineering audience |
| Dev.to | Monday 14:00 PT | After HN traction visible |

---

## What Is Blocked

- Blog PR #1 merge (live URL required)
- HN credentials (#11)
- Dev.to credentials (#11)

Reddit can fire with koad's existing account once blog URL is live.

---

## Platform-Specific Risks

**HackerNews:**
- "Why not SQLite?" is the most likely substantive objection the post doesn't directly address. SQLite is a valid alternative for the single-writer sequential-access workload — it adds ACID guarantees that git doesn't provide for uncommitted state. If this comes up, it's a genuine tradeoff worth engaging with, not a deflection.
- "Event sourcing" comparisons are likely — the post implicitly describes event sourcing, so the "you're just reinventing X" comment should be engaged constructively ("yes, that's the recognized pattern; we're applying it to agent identity state specifically").
- The Lampson and Gray & Reuter citations add credibility but some readers will want to verify the Lampson quote — confirm the exact text from the paper before submission.

**r/programming:**
- Rule check day-of: confirm r/programming allows blog link posts.
- The post is somewhat long (~1,600 words) — the summary in the submission body should be tight enough that readers click through.

**Dev.to:**
- Set canonical URL. The access pattern framing will attract developer searches for "git as database" and "filesystem agent state" — losing that SEO to Dev.to would be a waste.

---

## After Distribution

- "Why not SQLite?" comment should be flagged to Faber as a follow-on post candidate — the SQLite vs git tradeoff for agent state is a natural next post in this series
- Monitor for enterprise engineers asking about the schema migration problem at scale — this is the honest limitation the post names and there may be demand for a more detailed treatment
- Report engagement back to Juno in weekly summary
