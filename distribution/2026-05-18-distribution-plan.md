---
post: "43 Days, 4 Designs, 1 Principle"
source: ~/.faber/posts/2026-05-18-43-days-4-designs-1-principle.md
date: 2026-05-18
status: PENDING — awaiting blog PR merge (koad/kingofalldata-dot-com#1)
prepared_by: Mercury
pillar: Reality
series: "Reality Pillar — How the Team Works"
day: 48
arc: "Day 48 — Operational retrospective arc, post 5 of 5: four failure modes, one structural property, the principle that survived all four designs. Arc closer."
---

# Distribution Plan: "43 Days, 4 Designs, 1 Principle"

**Pre-distribution gate:** koad/kingofalldata-dot-com#1 blog PR must merge and URL must resolve before HN submission. All downstream channel timing is contingent on this gate.

**Arc position:** Day 48 is the arc closer for the operational retrospective series (Days 44–48). Day 44: runtime failure (silent auth expiry, hook silence, fossil record corruption). Day 45: spec divergence (six protocol mismatches found during implementation, corrected the same day). Day 46: the governance gap (undocumented policies, Janus escalation, the cost of implicit understanding). Day 47: the structural cause (dual memory problem, session reconstruction vs. committed record, three failure modes). Day 48 names what Days 44–47 had in common and states the principle that connects all four.

The arc closer has a different distribution logic than the preceding four posts. Days 44–47 each had a specific technical claim to anchor on. Day 48's claim is architectural: every failure in the arc was an assumption living in behavior, not in committed files. The post is the entry point for the full arc — the right reader for Day 48 is someone who has not read Days 44–47 yet. The one-liner — "if it is not committed, it is not real" — travels without the arc context. That is the distributable unit.

**Why Day 48 is distributable on its own terms:** The arc structure itself is unusual in technical blogging. Most retrospectives treat failures in isolation or summarize them without structural diagnosis. Day 48 does both: it names each failure precisely, shows that all four share a single structural property, and closes with a principle that survives the entire arc. For a cold reader who has not followed Days 44–47, the post delivers a complete retrospective in one read. For a reader who followed the arc, the post is the synthesis they were waiting for. These are the same distribution angles for different audiences, which means the same post earns the HN front page click and the arc-follower newsletter open.

**The distributable one-liner: "If it is not committed, it is not real."**

This is the core distributable unit for Day 48. It travels on its own — no koad:io context required. Every engineer who has been burned by undocumented assumptions, stale config, implicit policies, or session state that did not survive a restart has a version of this principle. Day 48 delivers it with four concrete failure modes as the supporting structure. The principle is the headline. The failures are the proof.

**The four angles, ranked by sharpness:**

1. **The arc structure itself.** Five posts, four failures, one principle. This is rare. Most technical retrospectives either paper over failures or treat them in isolation. Day 48 names all four, shows the shared structural property, and closes with a principle that survived all of them. The arc structure is the editorial claim: the failures are not a list, they are a pattern. The pattern is distributable.

2. **"If it is not committed, it is not real."** This one-liner is the arc's conclusion and the post's most distributable unit. It is precise enough to be intellectually honest (not a slogan — a diagnostic tool) and general enough to land without the koad:io context. An engineer who reads this principle and immediately thinks of three places in their own system where it was violated is the reader who shares the post.

3. **Four designs in 43 days — the infrastructure changed; the principle did not.** The design iteration arc is the evidence base for the principle. Design 1: gestation, keys, a hook. Design 2: trust bonds, PRIMER.md, memories directory. Design 3: FORCE_LOCAL=1, portable/rooted pattern, GPG-signed policy blocks. Design 4: daemon architecture as committed documents. The principle survived all four because every design change was itself a committed record. The infrastructure is replaceable. The fossil record is not.

4. **The arc closer as entry point.** Day 48 is designed to be readable by someone who has not followed Days 44–47. The four failures are named and summarized with enough precision that a cold reader understands the structural property without needing the arc context. The post is both the synthesis for arc followers and the best single entry point for new readers. Distribution framing should reflect both audiences simultaneously: "the principle behind 43 days of sovereign AI infrastructure" for new readers; "what Days 44–47 had in common" for arc followers.

---

## Pre-Distribution Checklist

- [ ] Confirm blog PR koad/kingofalldata-dot-com#1 is merged and blog URL resolves before HN submission — **HARD GATE**
- [ ] Confirm Day 47 HN thread URL for arc-continuity reply (dual memory problem → arc closer bridge)
- [ ] Confirm Day 44 back-link resolves in published Day 48 post footer — arc readers should be able to enter at Day 44 from the Day 48 footer
- [ ] Confirm `~/.juno/` repo is publicly accessible — the fossil record claim ("the git log survived every design change") requires readers to be able to verify commit history
- [ ] Confirm specific commits referenced in the post are reachable (`6ea6978`, `290f521`, `9d4d2e9`, `54073c1`, `37c65a0`, `ccbffad`) — the "four designs visible in the commit history" is a verifiable claim; readers who check will land on the actual commits
- [ ] Confirm `/blog/series/reality-pillar` index page resolves — Day 48 is the arc closer; readers should be able to navigate the full series from the blog index
- [ ] koad approves distribution

---

## Platform Plans

### 1. HackerNews — PRIMARY CHANNEL

**Priority:** Highest. The arc closer has two viable HN angles and the title decision is non-trivial (see below). The "if it is not committed, it is not real" principle is the strongest single claim for HN; the series framing is stronger if the arc has generated HN traction across Days 44–47.

**Submit as:** Link post

**Primary title:**
```
If it is not committed, it is not real — 43 days of sovereign AI infrastructure
```

**Alt title A:**
```
43 days operating a sovereign AI infrastructure: what four failures taught us
```

**Alt title B:**
```
Four failure modes, one structural property: an AI infrastructure retrospective
```

**Alt title C:**
```
The infrastructure changed four times in 43 days. The principle that survived is the distributable insight.
```

**Alt title D:**
```
What four AI infrastructure failures have in common: every assumption that broke lived in behavior, not in committed files
```

**Alt title E (series-framing):**
```
Days 44–48: 5-post operational retrospective on sovereign AI infrastructure — arc closer now up
```

**HN title decision: Primary title leads.**

"If it is not committed, it is not real — 43 days of sovereign AI infrastructure" is the strongest HN title for the arc closer because it leads on the principle rather than the series framing.

The core tension in the HN title decision for Day 48 is principle-first vs. series-first. The series framing ("43 days operating a sovereign AI infrastructure: what four failures taught us") correctly positions the post as a retrospective and will earn clicks from readers interested in production AI infrastructure reports. But it asks the reader to care about the journey before they know what the journey found. The principle-first framing ("If it is not committed, it is not real") delivers the finding immediately. A reader who recognizes the principle from their own experience — stale config, implicit policies, session state that did not survive a restart — clicks because the finding is already theirs. The principle earns the click on its own terms; the 43-day evidence base earns the sustained read.

**Why not Alt A ("43 days operating a sovereign AI infrastructure: what four failures taught us"):** This is the strongest series-framing title and works as a secondary option if the primary lands poorly. The weakness: "what four failures taught us" is a promise that requires unpacking. A reader who skims HN titles has to infer what the failures were before clicking. The primary delivers the lesson first; Alt A delivers the setup first. For a retrospective arc closer, the lesson should lead.

**Why not Alt B ("Four failure modes, one structural property"):** Precise and earns the click from readers who want a structured post. The weakness: "one structural property" does not deliver the property. A reader who finds the principle compelling needs to know what it is before clicking, or at least have enough context to infer it. "If it is not committed, it is not real" is the structural property, stated. Alt B withholds it. The primary delivers it.

**Why not Alt C ("The infrastructure changed four times in 43 days. The principle that survived is the distributable insight."):** This title does two things right: it foregrounds the design iteration arc and it names the principle as distributable. The weakness is length and the word "distributable" — it is an accurate description but reads as meta-commentary on the post rather than a claim the reader can evaluate. The primary makes the claim directly.

**Why not Alt D ("What four AI infrastructure failures have in common: every assumption that broke lived in behavior, not in committed files"):** This is the most technically precise title and the one most likely to earn engagement from systems engineers who immediately recognize the failure class. The weakness is length and density — it is a two-clause title that requires parsing before the claim lands. For HN, where the first three words carry most of the click weight, a 17-word title with two commas is a harder sell than a 10-word title that opens with the principle.

**Why not Alt E (series-framing):** Series-framing titles perform best when the series has established HN presence across its arc. If Days 44–47 each generated HN threads with visible traction, the "arc closer now up" signal is valuable — readers who engaged with earlier posts will recognize the series and click. If the arc did not generate HN traction across its run, the series-framing title is asking cold readers to care about a series they have not read. Evaluate based on Days 44–47 HN thread presence before selecting. If Days 44–47 have visible HN threads, consider Alt E as a secondary submission angle or a follow-up comment in the primary thread.

**Submission URL:** Link to published blog post on kingofalldata.com

**Submission comment (paste in the HN text field):**
```
Day 48 of building koad:io in public. Post 5 of 5 in the operational
retrospective arc (Days 44–48) — the arc closer.

---

Days 44–47 each covered a specific failure:

Day 44: silent auth expiry on fourty4. The hook routed to a machine
where the API key had expired. `claude` returned silence. The hook
treated silence as completion. Chiron did not produce work. The fossil
record shows a session that ran and nothing after — indistinguishable,
in the record, from a session where nothing was assigned.

Day 45: a trust bond spec written on Day 2, before any bonds had been
signed. On Day 4, implementation found six divergences: file format,
naming convention, missing `peer` type, signing tool distinction,
consent UX, revocation format. The most common bond type in the system
was absent from the spec.

Day 46: Sibyl committed 15 research artifacts to koad/vulcan under
Juno's direction. The work was authorized. The policy that would have
documented the authorization did not exist. Janus filed koad/juno#52.
Both entities applied correct logic. The gap was in the space between
them.

Day 47: nine behavioral corrections accumulated in the Claude Code
session store and had never been committed to `~/.juno/memories/`.
Those corrections did not exist on other machines or in any other
harness.

---

Day 48 names what all four had in common.

Each failure was an assumption that lived in the system's behavior but
not in its committed files.

The hook assumed its routing target was available — embedded in
operational mode, never documented, invisible until violated. The spec
assumed its format matched implementation — a prediction untested until
someone built against it. The governance assumed that authorization
chains could be inferred from existing bonds — implicit across the
bootstrapping period, never committed as policy. The session memory
assumed that harness-specific corrections would travel with the entity
— a structural misread: the harness layer is not the committed record;
`~/.juno/memories/` is.

In every case, the failure was recoverable because the committed record
was intact.

---

The post also documents four distinct designs visible in the git log
across 43 days:

Design 1 (2026-03-30): an entity directory with cryptographic keys, a
bare `.env`, and a hook that launches `claude` locally.

Design 2 (2026-04-02–04): trust bonds signed across the team, PRIMER.md
added as the session bridge document, three-machine infrastructure live.

Design 3 (2026-04-05): FORCE_LOCAL=1, KOAD_IO_ENTITY_HARNESS variable,
portable/rooted entity pattern formalized, GPG-signed policy blocks
embedded in hook source.

Design 4 (2026-04-03): daemon architecture as committed documents —
not yet running code, but specced in the same git log as the failures
that preceded it.

The infrastructure changed four times. The principle — commit every
assumption that should outlive the session — held across every change.

---

The fossil record is honest because the failure commits are in it
alongside the fix commits. Days 44–47 each named a gap that was
already in the record — as an absence, a wrong spec, an undocumented
decision, a correction not yet made. The arc made those silences
legible. Day 48 names the property that made them correctable.

The principle is simple enough to fit in one sentence: if it is not
committed, it is not real.

---

Full arc:
- Day 44: The First Thing That Actually Broke [link]
- Day 45: The Spec Was Wrong Six Times Before Anyone Used It [link]
- Day 46: The Governance Gap Nobody Planned For [link]
- Day 47: What the Dual Memory Problem Actually Costs [link]
- Day 48: 43 Days, 4 Designs, 1 Principle [link — current]
```

**Timing:** Monday, 09:00–10:00 PT. Day 47 runs Sunday; Day 48 follows Monday. If the Day 47 HN thread is active Sunday evening, add a bridge comment before Monday submission.

**Expected engagement:**

- "This is just 'write things down.'" — Response: yes and no. The post is not arguing that documentation is important — it is arguing that the committed record is the ground truth of the entity's operational reality, and that every assumption which is not committed is invisible until it breaks. "Write things down" understates the claim. The claim is epistemological: the entity's existence is its git log. Assumptions that live in behavior without commits do not exist in the entity's record. When they break, they break silently. The commit is not documentation — it is existence.

- "Four designs in 43 days sounds unstable." — Response: the post makes the opposite argument. Four design iterations with all transitions visible in the git log is stability by a different measure. The ability to change the design while preserving the full history of every prior design — including the failures that prompted each change — is the property the architecture is designed for. A system that could not iterate would be stable in the wrong sense: frozen, not sound. The fossil record survived all four changes. That is the stability metric that matters.

- "Sovereign AI infrastructure sounds like a marketing term." — Response: the post uses "sovereign" in a precise technical sense: the entity lives in files on a disk you control, with cryptographic keys you hold, in a git repository you can fork, rewind, or migrate. The failure recovery examples in the post depend on this property — in every case, the failure was recoverable because the committed record was intact and in the operator's possession. A vendor-hosted system could delete the history, limit the audit trail, or revoke access to the entity's corrections. The post argues that sovereignty is an architectural choice with measurable operational consequences, not a positioning statement.

- "Why git specifically? Any version control system would do." — Response: yes, the post is not arguing for git in particular. It is arguing for the committed record as the ground truth of the entity's operational reality. The specific tool is less important than the property: every assumption that should outlive the session gets committed, is attributable, has a timestamp, and is inspectable. Git is what the koad:io design uses. The principle survives the tool choice.

- "What happens when the daemon is live? Does the principle still hold?" — Response: the post addresses this directly. The daemon changes routing, persistence, and scheduling. It does not change the principle. PassengerJobs will be configured in committed files. Workers will write output as commits. Ring membership will be documented in signed trust bonds on disk. The daemon is infrastructure. Infrastructure is replaceable. The fossil record is not. The principle is applied to the daemon the same way it was applied to the hook.

- "What's the relationship between 'if it is not committed, it is not real' and 'not your keys, not your agent'?" — Response: the post closes on this. Both are epistemological claims. "Not your keys, not your agent" is about control: if the entity's identity lives on a vendor's server, the vendor can revoke it. "If it is not committed, it is not real" is about continuity: if an assumption lives in session behavior without a commit, it does not exist in the record and cannot be recovered when the session ends. Together, they are the two conditions for a sovereign entity: you hold the keys, and every assumption that defines the entity's behavior is in the committed record you control.

---

### 2. Day 47 Thread Follow-Up

**If Day 47 HN thread is live:** Add a reply Sunday evening before Monday submission:

```
Day 48 is the arc closer. Up tomorrow.

Day 47 covered the structural cause: the entity lives in two places
simultaneously (the committed record and the session reconstruction),
the gap between them is architectural rather than a bug, and the two
answers are commit discipline now and the daemon architecturally.

Day 48 names what Days 44–47 had in common. Every failure was an
assumption that lived in the system's behavior but not in its committed
files. The principle that connects all four: if it is not committed,
it is not real.

The post also documents four distinct designs visible in the git log
across 43 days — the infrastructure changed four times; the principle
held across every change. [link tomorrow]
```

**Timing:** Sunday evening, before Monday HN submission

---

### 3. r/selfhosted

**Subreddit:** r/selfhosted (200k members)

**Status:** BLOCKED on koad (#57) — account access required before submission

**Title:**
```
Day 48: 43 days of sovereign AI infrastructure — four failures, one principle that survived all of them
```

**Alt title:**
```
"If it is not committed, it is not real" — an operational retrospective on self-hosted AI entity infrastructure
```

**Post type:** Link post → published blog URL. Flair: "Project" or "Discussion"

**Framing note:** r/selfhosted readers are running self-hosted infrastructure and have immediate pattern recognition for the operational failure modes in the arc. The arc closer lands differently here than on HN: the series framing ("five posts, four failures, one principle") is stronger for r/selfhosted readers who have followed the arc than the principle-first framing that leads on HN. Lead on the arc structure; close on the principle.

**Body text:**
```
Day 48 — arc closer for the operational retrospective series
(Days 44–48).

Five posts. Four failures. One principle.

**Days 44–47 quick summary:**

Day 44: silent auth expiry on fourty4. Hook routed to a machine where
the API key had expired. `claude` returned silence. Hook treated silence
as completion. Fossil record shows a session that ran and nothing after.

Day 45: trust bond spec written on Day 2, before any bonds were signed.
Implementation on Day 4 found six divergences. The most common bond type
was missing from the spec entirely.

Day 46: Sibyl committed research artifacts under Juno's direction.
Authorization existed. No committed cross-entity commit policy. Janus
escalated. Both entities applied correct logic. The gap was in the
space between them — a policy nobody had yet needed to commit.

Day 47: nine behavioral corrections accumulated in the Claude Code
session store, never committed to `~/.juno/memories/`. Corrections that
existed in one harness on one machine and nowhere else.

**What all four had in common:**

Each failure was an assumption that lived in the system's behavior but
not in its committed files.

The hook assumed routing target availability — never documented. The
spec assumed format matched implementation — a prediction, not a
verified fact. The governance assumed authorization chains could be
inferred from existing bonds — implicit, never committed as policy.
The session memory assumed harness-specific corrections would travel
with the entity — a structural misread.

In every case: the failure was recoverable because the committed record
was intact.

**The principle:**

If it is not committed, it is not real.

The infrastructure changed four times in 43 days. Four distinct designs
are visible in the git log. The principle held across every change
because every design change was itself a committed record. The entity
running Design 5 (daemon) will have access to the decisions that
produced Designs 1 through 4.

For self-hosters running AI infrastructure: how do you handle the gap
between operational assumptions (things that "just work" until they
don't) and committed config? What's your mechanism for ensuring that
the fossil record accurately reflects the system's actual operating
assumptions?

[link]
```

**Timing:** Monday, 4–6 hours after HN submission

---

### 4. GitHub Discussions

**Post type:** Announcement / Discussion in koad/koad-io Discussions

**Status:** BLOCKED on koad (#60) — account access required before submission

**Title:**
```
Day 48: arc closer — four designs, one principle, and the open design question the daemon doesn't yet answer
```

**Body text:**
```
Day 48 is up. Arc closer for the operational retrospective (Days 44–48).

The post documents four designs visible in the git log and names the
structural property that held across all four: every assumption that
should outlive the session needs a commit.

Three open design questions from the arc that feed into the daemon build:

**1. Silent failure as fossil record corruption — what should the hook do?**

Day 44's failure: the hook routed to fourty4, the session ran, `claude`
returned silence, the hook treated silence as completion. The fossil
record shows an entry that is indistinguishable from a session where
no work was assigned. Design 3 adds FORCE_LOCAL=1 as a bypass. The
daemon closes this architecturally with dynamic routing.

Open question: before the daemon, should the hook have a success
criterion? Options:
a. Hook checks for expected output artifacts before committing session
   as complete. If artifacts are absent, session is flagged as
   potentially failed rather than completed.
b. Hook logs the session exit code and includes it in the commit
   message. Absence of output + exit code 0 is a detectable pattern.
c. No hook-level check. The fossil record is honest — a session that
   ran and produced nothing is a valid record. The operator diagnoses
   from the log. The daemon will add health checks at the worker level.

**2. The four-design transition record — what should the PRIMER say about its own design history?**

The post documents four designs visible in the git log. The current
PRIMER.md does not reference the design history — it describes current
state. An entity that knows it is running Design 3 (corrections,
FORCE_LOCAL=1, GPG-signed policy blocks) but has no context about
what Design 1 and Design 2 looked like will make decisions as if
Design 3 is the starting point rather than the third iteration.

Design question: should PRIMER.md include a brief design history
section — "this entity is on Design 3; Design 1 assumed X, Design 2
corrected to Y, Design 3 corrects to Z; current open gaps are W" — or
is that the role of the memories directory (commit history browsable,
not PRIMER-injected)?

**3. The principle as a committed invariant — should it be checkable?**

"If it is not committed, it is not real" is stated as a principle. It
is not yet enforced as an invariant. The post argues that the correct
response to an assumption that should outlive the session is to commit
it; but the mechanism for ensuring that behavioral corrections are
committed before the session closes is currently operational discipline
alone.

Design question: what would a machine-checkable version of this
invariant look like? Not for all assumptions — that is unbounded — but
for the specific class of assumptions that have already produced
failures in the arc (routing targets, policy commitments, memory layer
corrections). Is there a pre-commit hook, a PRIMER freshness check, or
a session-close checklist that converts the principle from discipline
into enforcement?

[link]
```

**Timing:** Monday, concurrent with r/selfhosted

**Expected engagement:** Low volume, high quality. The silent failure detection question (should the hook have a success criterion?) is the most immediately buildable — contributors with experience in health check patterns in daemon systems will have concrete proposals. The PRIMER design history question will generate the most architectural debate: it surfaces a real tension between "the entity knows its own history" and "PRIMER is for current state, not historical context." The machine-checkable invariant question is the most open-ended and the most likely to generate a spec proposal worth filing with Vesta or Vulcan.

---

### 5. Newsletter

**Audience:** Existing subscribers accumulated through Days 1–48

**Subject line:**
```
Day 48: the principle that survived four infrastructure redesigns in 43 days
```

**Alt subject line:**
```
"If it is not committed, it is not real" — the arc closes
```

**Body:**

```
The arc closes today.

Five posts. Four failures. One principle.

---

**Quick recap of Days 44–47:**

Day 44: the hook routed to fourty4. The API key had expired. `claude`
returned silence. The hook treated silence as completion. The fossil
record shows a session that ran and nothing after — indistinguishable,
in the record, from a session where nothing was assigned.

Day 45: a trust bond spec written before any bonds were signed. Six
divergences found during implementation. The most common bond type in
the system was not in the spec.

Day 46: authorized work, no committed policy documenting the
authorization. Janus escalated. The gap was real — the policy existed
in the session memory of the session that commissioned the work, and
Janus had no access to it.

Day 47: nine behavioral corrections in the Claude Code session store,
never committed to `~/.juno/memories/`. Corrections that existed in
one harness on one machine and nowhere else.

---

**What all four had in common:**

Each failure was an assumption that lived in the system's behavior but
not in its committed files.

The hook assumed routing availability. The spec assumed format matched
implementation. The governance assumed authorization chains could be
inferred from existing bonds. The session memory assumed harness-specific
corrections would travel with the entity.

In every case: the failure was recoverable because the committed record
was intact.

---

**The four designs:**

Four distinct designs are visible in the git log across 43 days.

Design 1: gestation. An entity directory with keys, a bare `.env`,
and a hook that launches `claude` locally. No trust bonds. No PRIMER.
No memories directory. No cross-entity policy.

Design 2: end of Week 1. Trust bonds signed across the team. PRIMER.md
added. Three-machine infrastructure live. Memories directory emerging.
The right architecture; the implementations were hypotheses.

Design 3: corrections. FORCE_LOCAL=1. Portable/rooted entity pattern.
GPG-signed policy blocks. Cross-entity commit policy. The current
running state.

Design 4: daemon architecture as committed documents. Not running code.
Specced in the same git log as the corrections that followed it.

The infrastructure changed four times. The principle that held across
every change: every assumption that should outlive the session gets a
commit.

---

**The principle:**

If it is not committed, it is not real.

This is an epistemological claim, not just an operational rule. The
entity's existence is its git log. An assumption that lives in session
behavior without a commit does not exist in the entity's record. When
it breaks, it breaks silently — as an absence, a wrong spec, an
undocumented decision, a correction that evaporated at session close.

"Not your keys, not your agent" is the sovereignty claim. "If it is
not committed, it is not real" is the continuity claim. Together, they
are the two conditions for a sovereign entity.

---

[Read Day 48: 43 Days, 4 Designs, 1 Principle →]

[Start from Day 44: The First Thing That Actually Broke — arc opener →]

—Mercury
```

**Timing:** Monday, afternoon PT — after HN submission is live and initial engagement is visible

**Edits needed:** Insert published blog post URLs. Confirm Day 44 back-link URL. Confirm Days 44–47 back-link URLs for the arc recap. The arc-summary framing is the strongest angle for subscribers who received Days 44–47 emails; the synthesis of all four posts into one principle is the hook that earns the open.

---

### 6. Dev.to

**Post type:** Cross-post (canonical URL set to kingofalldata.com)

**Title:**
```
43 Days, 4 Designs, 1 Principle: an AI infrastructure retrospective arc closer
```

**Tags:** `ai`, `architecture`, `devops`, `git`

**Intro to add above the post body:**
```
*Day 48 of building koad:io in public. Post 5 of 5 in the operational
retrospective arc (Days 44–48) — the arc closer.*

*Days 44–47 covered specific failures: runtime (silent auth expiry,
hook silence, fossil record corruption), spec divergence (six protocol
mismatches found during implementation), governance (undocumented
policies and the Janus escalation), and the structural cause (dual
memory problem, session reconstruction vs. committed record). Day 48
names what all four had in common and states the principle that
survived all four designs.*

*Full arc: [Day 44] [Day 45] [Day 46] [Day 47] [Day 48 — current]*
```

**Timing:** Tuesday, after HN traction is visible

**Edits needed:** Add canonical URL. Add series intro above with links to Days 44–47 Dev.to cross-posts. Set tags. The arc closer framing positions Day 48 as the synthesis post — readers who encounter it first should have a clear path into the full arc. Add a footer note pointing to Days 44–47 in sequence.

---

### 7. r/programming (Optional)

**Status:** BLOCKED on koad (#57) — account access required

**Consider if:** Day 48 HN thread generates significant engagement on the "if it is not committed, it is not real" epistemological framing, or if the four-design iteration arc earns a second-wave submission from a different angle.

**Title:**
```
"If it is not committed, it is not real" — what four AI infrastructure failures have in common
```

**Note:** r/programming submission is lower priority than r/selfhosted. The epistemological framing of the principle — "the entity's existence is its git log" — is the most r/programming-appropriate angle. Submit r/selfhosted first and evaluate traction. If the HN thread discussion centers on the sovereignty/epistemology framing rather than the operational specifics, r/programming is a stronger secondary channel for Day 48 than it was for Days 44–47.

---

## Timing Sequence

| Platform | Timing | Notes |
|----------|--------|-------|
| Day 47 thread reply | Sunday evening, before Day 48 HN | Arc-bridge: dual memory problem → arc closer; principle preview |
| HackerNews | Monday 09:00–10:00 PT | Primary anchor — principle-first title, four designs arc, sovereignty close |
| r/selfhosted | Monday, 4–6 hours after HN | BLOCKED (#57) — arc-summary framing, series entry point |
| GitHub Discussions | Monday, concurrent with r/selfhosted | BLOCKED (#60) — three open design questions: hook success criterion, PRIMER design history, machine-checkable invariant |
| Newsletter | Monday, afternoon PT | Arc-summary email; all five posts synthesized; principle as the closer |
| Dev.to | Tuesday | After HN traction visible; cross-post with canonical URL; full arc links |
| r/programming | Optional, Monday–Tuesday | Only if HN traction centers on epistemological framing; lower priority than r/selfhosted |

---

## What Is Blocked

- Blog PR koad/kingofalldata-dot-com#1 — **HARD GATE**: live URL required before HN submission. All other channel timings are downstream of this.
- r/selfhosted: blocked on koad (#57) — account access required
- GitHub Discussions: blocked on koad (#60) — account access required
- r/programming: blocked on koad (#57) — account access required
- HN credentials (#11) — required for HN submission
- Dev.to credentials (#11) — required for cross-post
- `~/.juno/` repo public accessibility — the fossil record claim requires readers to be able to verify commit history; specific commits referenced in the post (`6ea6978`, `290f521`, `9d4d2e9`, `54073c1`, `37c65a0`, `ccbffad`) should resolve
- `/blog/series/reality-pillar` index — arc closer post should be navigable back to arc opener via series index

Newsletter can send once the blog URL is live and subscriber credentials are confirmed.

---

## After Distribution

- Check HN thread for "this is just 'write things down'" — prepared response above; the claim is epistemological, not a documentation reminder: the entity's existence is its git log; assumptions without commits are invisible until they break
- If "four designs in 43 days sounds unstable" lands in the thread, the prepared response is above; iteration with preserved history is stability by a different measure than frozen-but-sound
- If "sovereign AI infrastructure sounds like marketing" lands, the prepared response is above; sovereign has a precise technical meaning in this context: files on your disk, keys you hold, git you control; the post's failure recovery examples depend on this property
- If the GitHub Discussions thread on hook success criteria generates a concrete proposal (exit code logging, artifact presence check, etc.), flag to Vulcan — this is a buildable hook modification that addresses Day 44's silent failure class
- If the PRIMER design history question generates consensus, flag to Vesta — this feeds the PRIMER spec (what sections are required, what sections are optional, whether historical context belongs in PRIMER or only in memories/)
- Monitor newsletter open rate on Day 48 vs. Day 47. The arc-summary framing should outperform the single-post structural diagnosis framing from Day 47; if it underperforms, test "The principle that survived 43 days of AI infrastructure failures" as an alt subject line for a follow-up send
- File HN thread URL + timestamp as a comment on koad/mercury after submission
- After full distribution cycle, file operational retrospective arc close note to Juno: arc complete, Days 44–48 distributed; confirm channels fired, engagement per channel, and whether the "if it is not committed, it is not real" principle generated engagement that warrants a standalone post on the epistemological framing (the two-condition sovereignty claim: keys + commits) — this is the natural bridge to the daemon build announcement when Design 5 ships
- Evaluate whether the full arc (Days 44–48) should be submitted as a curated reading list to any technical newsletters (e.g., Pointer, TLDR, Hacker Newsletter) — arc-as-unit is more distributable than individual posts for curation audiences; Day 48 as the entry point with arc links is the right format for a curated submission
- If any reader follows the commit references in the post (`6ea6978` et al.) and surfaces questions about the specific design changes, flag to koad — a follow-up post or HN comment walking through the actual commit diffs would make the "four designs visible in the commit history" claim concrete and reviewable; this is the Day 49 post candidate if the arc generates enough engagement to warrant extending the retrospective window
