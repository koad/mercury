# Distribution Queue — Master Backlog
**Owner:** Mercury  
**Last updated:** 2026-04-05 (Days 23–26 added)  
**Status:** Credential-blocked on most platforms. This document is the go-signal reference.

---

## 1. Immediate Fire — No Credentials Needed

These can be executed by koad today without waiting on credential handoff (#11).

### Reddit r/selfhosted — READY NOW
**Package:** `distribution/reddit-selfhosted-week1.md`  
**Status:** Staged and cleared. koad's existing Reddit account works.  
**Title:** "I built an AI entity framework where agents live as git repos on your disk — 15 running on one Mac Mini"  
**URL needed:** `https://kingofalldata-dot-com` blog post must be live first (blocked on PR #1 merge)  
**Timing:** Post Monday morning 11:00–13:00 UTC, 4–6 hours after HN submission  
**Action for koad:** Merge PR #1 → confirm live URL → post from existing Reddit account

### GitHub Discussions on koad/koad-io — FIRST POST RECOMMENDATION
**Best opening post:** The Week 1 entities-on-disk write-up, framed as a project update.

**Suggested title:** "Week 1 in public: 15 entities running, architecture write-up, and what we've learned"

**Why this first:** GitHub Discussions requires no third-party credentials — koad is already authenticated. The audience (developers who found koad/koad-io) is the right early adopter segment. A first Discussion post establishes the community hub before social distribution drives traffic there. It also gives external visitors a landing page that isn't just a README.

**Content basis:** `~/.faber/posts/2026-04-04-entities-on-disk.md` (2,469 words, full architecture walkthrough). Link to it once blog is live; paste a condensed version into the Discussion body before then.

**Timing:** Can be done today. No blog dependency — paste content directly into GitHub Discussions.

### Other No-Credential Paths
- **koad/koad-io README update** — Link to first blog post once live. No credential needed, just a commit. Mercury can draft the copy; koad merges.
- **GitHub Release notes** — If/when a versioned framework release is tagged, release notes are a distribution surface with zero credential overhead.

---

## 2. HN Submissions Queue — Priority Order

**Constraint:** Maximum one HN submission per 7 days. Do not submit on Thursday–Sunday. Do not self-compete — wait at least 5 days between submissions from the same account.

**Blog PR dependency:** HN submissions 1–2 require a live blog URL. Submit only after kingofalldata-dot-com PR #1 is merged and the post resolves.

---

### HN-1 — Entities on Disk (Week 1 Show HN)
**File:** `distribution/hn-week1-submission.md`  
**Title:** "Show HN: I run 15 AI agents from a Mac Mini – each is just a directory with a CLAUDE.md"  
**Type:** Show HN  
**Target date:** Monday 2026-04-06 or 2026-04-07, 09:00–10:00 PT  
**Readiness:** Staged — awaiting live blog URL and HN credentials  
**Estimated reception:** Strong. Concrete mechanism (SSH hook + directory), verifiable claim (15 agents), anti-framework framing. HN loves the "how does that actually work" angle. Expect 50–150 points if posted Monday morning. Primary objection prep included in package.  
**Submission comment:** Pre-written in package. Paste within 2 minutes of submit.

---

### HN-2 — Pre-Invocation Context Assembly (PRIMER post)
**File:** `distribution/hn-primer-post-submission.md`  
**Title:** "cd ~/.sibyl && claude — How koad:io Routes Between 15 AI Entities by Filesystem Path"  
**Type:** Standalone link post (not Show HN)  
**Target date:** Tuesday–Wednesday the week after HN-1, 09:00–11:00 PT  
**Readiness:** Staged — awaiting Gist live confirmation (source: `https://gist.github.com/koad/7198a0f0fdeceeca72db2d5e959519dc`) and Juno authorization  
**Estimated reception:** Moderate-high. Targets the ML/arxiv-reading segment; names a pattern against ICM (arxiv:2603.16021). Will draw substantive technical discussion. Less broad appeal than HN-1 but higher quality engagement from the right audience.  
**Constraint:** Post at least 5 days after HN-1 to avoid self-competition in new queue.

---

### HN-3 — Trust Bonds / GPG Agent Authorization
**File:** `distribution/2026-04-06-trust-bonds-plan.md`  
**Title:** "GPG-signed authorization files instead of RBAC for AI agent permissions"  
**Type:** Link post  
**Target date:** Monday 2026-04-07, 09:00–10:00 PT (or the Monday after HN-2)  
**Readiness:** Cleared — Veritas fact-check complete, koad approval pending  
**Estimated reception:** Strong with the security/infosec segment. PKI comparison, real GPG fingerprint, verifiable bond files. The revocation cascade mechanic will drive technical discussion. "Just use SPIFFE" objections are preemptable.  
**Dependency:** kingofalldata.com blog live, GPG key importable from keybase.io confirmed.

---

### HN-4 — Show HN: Agent Home Directory
**File:** `~/.faber/posts/2026-04-10-show-hn-agent-home-directory.md`  
**Title:** "Show HN: koad:io — give your local AI agent a home directory (identity, memory, authorization in git)"  
**Type:** Show HN  
**Target date:** 2026-04-10 (filed as target; Tuesday 08:00–10:00 ET per post metadata)  
**Readiness:** Ready (status: ready in post frontmatter)  
**Estimated reception:** Good second-wave Show HN. Different angle from HN-1 — leads with the identity/memory problem rather than the scale/architecture story. Useful if HN-1 audience wanted more on the agent identity layer.  
**Constraint:** Do not submit within 7 days of HN-1. Use as follow-up if HN-1 lands well.

---

### HN-5 — Files on Disk Beats Cloud (Week 2)
**File:** `~/.faber/posts/2026-04-11-files-on-disk-beats-cloud.md` (also in drafts — confirm final)  
**Title:** TBD — needs Mercury adaptation package  
**Type:** Link post or Ask HN depending on final angle  
**Target date:** 2026-04-11 (calendar target)  
**Readiness:** Draft exists; no distribution package yet. Faber has post; Mercury needs to build the HN package.  
**Gap:** No distribution package. See Section 4.

---

## 3. Blog Posts Ready to Publish

**Dependency:** All posts below require `koad/kingofalldata-dot-com#1` (blog infrastructure / /blog route) to be merged and deployed.

Posts are listed in chronological publish order. "Published" status on `2026-04-05-entities-on-disk.md` likely refers to internal/draft publication — confirm whether it resolved publicly before treating as live.

| Date | Title | Source File | Words | Status |
|------|-------|-------------|-------|--------|
| 2026-04-04 | Entities Are Running on Disk | `posts/2026-04-04-entities-on-disk.md` | 2,469 | Signed (Juno, 2026-04-03) |
| 2026-04-04 | The Filesystem Is the Interface | `posts/2026-04-04-filesystem-is-the-interface.md` | 1,807 | No status — needs review |
| 2026-04-04 | Your AI Forgets You Every Time | `posts/2026-04-04-human-os.md` | 1,132 | No status — needs review |
| 2026-04-04 | Alice Was Built Before the Wave | `posts/2026-04-04-alice-origin.md` | 890 | No status — needs review |
| 2026-04-05 | Entities Are Running on Disk (technical) | `posts/2026-04-05-entities-on-disk.md` | 2,082 | Published (confirm public URL) |
| 2026-04-05 | Pre-Invocation Context Assembly | `posts/2026-04-05-pre-invocation-context-assembly.md` | 1,707 | No status — draft also in `drafts/` |
| 2026-04-05 | Trust Bonds Aren't Policy | `posts/2026-04-05-trust-bonds-arent-policy.md` | 2,058 | Signed (Juno, 2026-04-02) |
| 2026-04-06 | Trust Bonds Aren't Policy — They're Cryptography | `posts/2026-04-06-trust-bonds.md` | 1,730 | Cleared (koad via Keybase, Veritas complete) |
| 2026-04-07 | The $200 Laptop Experiment: Week 1 Retrospective | `posts/2026-04-07-200-dollar-laptop.md` | 1,700 | No status |
| 2026-04-07 | Sibyl Does Research — Here's What That Actually Looks Like | `posts/2026-04-07-sibyl-research.md` | 1,328 | No status |
| 2026-04-08 | Chiron Wrote a Curriculum. Here's Every Level. | `posts/2026-04-08-chiron-wrote-the-curriculum.md` | 2,936 | No status |
| 2026-04-09 | How Four Entities Coordinated to Build Alice | `posts/2026-04-09-alice-coordination.md` | 1,662 | No status |
| 2026-04-09 | How Vesta Specs What We Build | `posts/2026-04-09-how-vesta-specs-what-we-build.md` | 2,536 | Draft (status field = lifecycle enum) |
| 2026-04-10 | Show HN: Agent Home Directory | `posts/2026-04-10-show-hn-agent-home-directory.md` | 1,055 | Ready |
| 2026-04-11 | Files on Disk Beats Cloud | `posts/2026-04-11-files-on-disk-beats-cloud.md` | 2,505 | No status (draft also in `drafts/`) |
| 2026-04-12 | The Week 1 Skeptics Were Right | `posts/2026-04-12-week1-skeptics-were-right.md` | 2,056 | No status |
| 2026-04-13 | This Is Who Should Sponsor This | `posts/2026-04-13-this-is-who-should-sponsor-this.md` | 1,740 | No status |
| 2026-04-14 | Entities Can Fork and Diverge | `posts/2026-04-14-entities-can-fork-and-diverge.md` | 2,217 | No status (draft also in `drafts/`) |
| 2026-04-15 | How I Would Set This Up If I Were Starting Today | `posts/2026-04-15-how-i-would-set-this-up-if-i-were-starting-today.md` | 1,544 | No status |
| 2026-04-16 | Entity Spotlight: Sibyl | `posts/2026-04-16-entity-spotlight-sibyl.md` | 1,938 | No status |
| 2026-04-17 | Fork This Entity and Tell Us What You Built | `posts/2026-04-17-fork-this-entity-and-tell-us-what-you-built.md` | 1,650 | No status |
| 2026-04-18 | Reader Questions: Week 1 | `posts/2026-04-18-reader-questions-week1.md` | 1,868 | No status |
| 2026-04-19 | The First Sponsor Acknowledgment | `posts/2026-04-19-first-sponsor-acknowledgment.md` | 896 | No status |
| 2026-04-19 | The Ring Before the Sponsors | `posts/2026-04-19-ring-before-sponsors.md` | 1,102 | No status |
| 2026-04-20 | Entity Spotlight: Vulcan | `posts/2026-04-20-entity-spotlight-vulcan.md` | 1,719 | No status |
| 2026-04-23 | The Hook Bug We Shipped to Production | `posts/2026-04-23-the-production-bug.md` | ~1,600 | **APPROVED** — distribution package ready |
| 2026-04-24 | Trust Bonds: What They Are, What They Aren't | `posts/2026-04-24-trust-bonds-deep-dive.md` | ~1,600 | **APPROVED** — distribution package ready |
| 2026-04-25 | Files vs. Database: the Engineering Tradeoff | `posts/2026-04-25-files-vs-database.md` | ~1,600 | **APPROVED** — distribution package ready |
| 2026-04-26 | Not Your Keys, Not Your Authorization | `posts/2026-04-26-not-your-keys.md` | ~1,100 | **PENDING** — post in progress; plan staged |

**Total posts:** 25 blog posts plus the Reality Pillar index (`posts/2026-04-00-reality-pillar-index.md`, 803 words) + Days 23–26 pipeline  
**Total word count:** ~50,000 words across the full posts inventory

---

## 6. Days 23–26 Pipeline (added 2026-04-05)

Distribution packages are staged for the next four posts in the Reality Pillar series. All four share the same structural blockers as the earlier queue (blog PR #1 merge, credentials #11), but plans are complete and ready to fire.

### Day 23 — The Hook Bug We Shipped to Production
**File:** `distribution/2026-04-23-production-bug-plan.md`  
**Status:** APPROVED (Veritas cleared)  
**Primary channel:** HackerNews — link post (post-mortem angle)  
**HN title:** "What it costs when your config outlives the assumption it encoded (AI agent post-mortem)"  
**Secondary:** r/selfhosted, Dev.to  
**Reddit angle:** Self-hosted agent fleet, single .env variable as SPOF  
**Timing:** Monday 09:00–10:00 PT after publish date  
**Blocked on:** Blog URL, HN credentials (#11)

---

### Day 24 — Trust Bonds: What They Are, What They Aren't
**File:** `distribution/2026-04-24-trust-bonds-deep-dive-plan.md`  
**Status:** APPROVED (Veritas corrections applied)  
**Primary channel:** HackerNews — link post (technical security/agent authorization)  
**HN title:** "Two-layer authorization for AI agents: GPG for identity attestation, Biscuit tokens for delegation"  
**Secondary:** r/netsec, Dev.to, Mastodon (infosec.exchange)  
**Reddit angle:** r/netsec — PKI/cryptography + agent authorization  
**Timing:** Monday 09:00–10:00 PT after publish date (at least 5 days after Day 23 HN submission)  
**Blocked on:** Blog URL, HN credentials (#11)  
**Note:** Cites arxiv:2501.09674, arxiv:2603.24775, NIST caisi, Entro Security NHI report — verify all links before submitting

---

### Day 25 — Files vs. Database: the Engineering Tradeoff
**File:** `distribution/2026-04-25-files-vs-database-plan.md`  
**Status:** APPROVED (Veritas correction applied)  
**Primary channel:** HackerNews — link post (database engineering angle)  
**HN title:** "Git is a database: why we use files for agent identity and MongoDB for live state"  
**Secondary:** r/programming or r/devops, Dev.to  
**Reddit angle:** r/programming — access pattern analysis, Lampson/Kleppmann citations  
**Timing:** Monday 09:00–10:00 PT after publish date (at least 5 days after Day 24 HN submission)  
**Blocked on:** Blog URL, HN credentials (#11)  
**Note:** "SQLite?" is the most likely HN objection not addressed in the post — flag to koad if it surfaces

---

### Day 26 — Not Your Keys, Not Your Authorization
**File:** `distribution/2026-04-26-not-your-keys-plan.md`  
**Status:** PENDING — post in progress; plan fully staged  
**Primary channel:** HackerNews — link post (secrets sprawl + Okta breach post-mortem)  
**HN title:** "28.65M hardcoded secrets added to GitHub in 2025 — and why the token model is structurally responsible"  
**Secondary:** r/netsec, Dev.to, Mastodon (infosec.exchange)  
**Reddit angle:** r/netsec — Okta breach trust chain, JWT revocation structural problem  
**Timing:** Monday 09:00–10:00 PT after post is finalized + Veritas approved  
**Blocked on:** Post finalization, Veritas review, blog URL, HN credentials (#11)  
**Note:** Verify GitGuardian and Okta figures from primary sources before submitting

**Immediate publish priority (once PR #1 merges):**
1. `2026-04-04-entities-on-disk.md` — HN-1 depends on this live URL
2. `2026-04-06-trust-bonds.md` — HN-3 depends on this live URL; Veritas already cleared
3. `2026-04-05-trust-bonds-arent-policy.md` — supports HN-3 and the "Naming What We Built" series
4. `2026-04-05-pre-invocation-context-assembly.md` — HN-2 depends on this (or the Gist as fallback)

**Note on duplicates:** `2026-04-04` and `2026-04-05` both have an "entities-on-disk" post; `2026-04-05` and `2026-04-06` both cover trust bonds. These appear to be iterative rewrites — confirm with Faber which is canonical before publishing both. Do not publish both versions without a "Part 1 / Part 2" framing or clear differentiation.

---

## 4. Platform-Specific Staging Needed

Distribution packages exist for the first two posts and HN submissions. The following content has no platform adaptation package yet:

| Post | Gap | Priority |
|------|-----|----------|
| `2026-04-07-200-dollar-laptop.md` | No HN, Reddit, or social package | HIGH — Day 7 milestone is the narrative anchor of the $200 laptop experiment thread |
| `2026-04-07-sibyl-research.md` | No distribution package | Medium — good entity spotlight candidate for r/LocalLLaMA |
| `2026-04-08-chiron-wrote-the-curriculum.md` | No distribution package | Medium — AI/education angle; could work on r/MachineLearning |
| `2026-04-09-alice-coordination.md` | No distribution package | Medium — multi-entity coordination story, good for HN if framed technically |
| `2026-04-09-how-vesta-specs-what-we-build.md` | No distribution package | Medium |
| `2026-04-11-files-on-disk-beats-cloud.md` | HN package needed (HN-5 candidate) | HIGH — Week 2 anchor post |
| `2026-04-12-week1-skeptics-were-right.md` | No distribution package | Medium — narrative post, Twitter/blog; less technical |
| `2026-04-13-this-is-who-should-sponsor-this.md` | No distribution package | Medium — sponsor-targeting post; needs a careful framing for public channels |
| `2026-04-14-entities-can-fork-and-diverge.md` | No distribution package | Medium — fork/git angle good for r/selfhosted |
| `2026-04-15-how-i-would-set-this-up-if-i-were-starting-today.md` | No distribution package | HIGH — Week 3 community entry point; needs a Reddit + HN package |
| Week 3 community posts (Apr 16–20) | No packages for any | Medium — community week; Twitter and Discord packages needed |
| `2026-04-04-filesystem-is-the-interface.md` | No distribution package | Low for now — good background piece but not an anchor |
| `2026-04-04-human-os.md` | No distribution package | Medium — accessibility angle; could anchor a LinkedIn post |
| `2026-04-04-alice-origin.md` | No distribution package | Low for now |
| NIST alignment post | Drafted in QUEUE-2026-04-03; Veritas check pending | Low — hold pending news cycle confirmation |
| Dev.to cross-posts | No Dev.to packages except for trust bonds (in `2026-04-06-trust-bonds-plan.md`) | Medium — Dev.to cross-posts are low-effort; need canonical URL and series intro for each |
| Mastodon packages | Only trust bonds has a Mastodon post in its plan | Low — batch these after primary platforms fire |

**Highest-priority gap:** The $200 laptop experiment post (`2026-04-07`) needs a distribution package before Day 7 arrives. It's the series capstone for the first week. Reddit r/selfhosted and HN are both natural fits; the "sovereignty doesn't require expensive hardware" angle is the lead.

---

## 5. Blocked on Credentials

All of the following are staged and ready but cannot fire until koad provides credentials via issue #11.

| Platform | What's Staged | Issue |
|----------|--------------|-------|
| Twitter/X | Week 1 thread (`distribution/twitter-week1-thread.md`), Trust bonds 7-tweet thread (in `distribution/2026-04-06-trust-bonds-plan.md`) | #11 — koad account credentials |
| HackerNews | HN-1 (`distribution/hn-week1-submission.md`), HN-2 (`distribution/hn-primer-post-submission.md`), HN-3 (`distribution/2026-04-06-trust-bonds-plan.md`) | #11 — HN account credentials |
| Dev.to | Trust bonds cross-post (`distribution/2026-04-06-trust-bonds-plan.md`), plus ~10 additional cross-posts to stage | #11 — Dev.to account credentials |
| Mastodon | Trust bonds post (infosec.exchange + fosstodon.org); other posts need packages first | #11 — Mastodon account credentials |
| LinkedIn | No packages staged yet; persona strategy not finalized | Deferred — no packages ready to fire |
| Discord | No community server established yet | Blocked on server creation, not just credentials |

**Critical path note:** HN and Twitter are the highest-leverage platforms for Week 1. Both require credentials from #11. Reddit is the only high-reach channel that can fire without credentials. The GitHub Discussions path is available now and should be used to establish a community anchor while the credential handoff is pending.

---

## Go-Signal Checklist

When credentials arrive and blog PR #1 is merged, fire in this order:

1. Confirm blog URL resolves for `entities-are-running-on-disk`
2. Post GitHub Discussion (no credentials needed — do this first)
3. Submit HN-1 (Monday morning PT, 09:00–10:00)
4. Post Reddit r/selfhosted (4–6 hours after HN-1)
5. Post Twitter/X Week 1 thread (after HN-1 is live)
6. Wait 5+ days
7. Submit HN-2 (PRIMER post, Tuesday–Wednesday)
8. Submit HN-3 (Trust bonds, the Monday after HN-2)
9. Begin staging distribution packages for Week 2 posts (Apr 11–14)

**Mercury is staged. Waiting on: blog PR merge + credentials (#11).**
