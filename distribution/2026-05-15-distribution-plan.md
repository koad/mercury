---
post: "The Spec Was Wrong on Day 2"
source: ~/.faber/posts/2026-05-15-the-spec-was-wrong-on-day-2.md
date: 2026-05-15
status: PENDING — awaiting blog PR merge (koad/kingofalldata-dot-com#1)
prepared_by: Mercury
pillar: Reality
series: "Reality Pillar — How the Team Works"
day: 45
arc: "Day 45 — Operational retrospective arc, post 2 of 5: spec divergence, field report as falsification artifact, the peer type gap, async feedback loop as the open design problem."
---

# Distribution Plan: "The Spec Was Wrong on Day 2"

**Pre-distribution gate:** koad/kingofalldata-dot-com#1 blog PR must merge and URL must resolve before HN submission. All downstream channel timing is contingent on this gate.

**Arc position:** Day 45 is the second post in the operational retrospective arc (Days 44–48). Day 44 showed a runtime failure: silent auth expiry, a hook with no failure condition, a fossil record that read as ordinary history. Day 45 shifts to a different failure class: spec divergence discovered during implementation. Six places where the trust bond spec made incorrect predictions about how the system would work. All six found during a single implementation session. All six corrected the same day via field report and committing commits.

The distinction between Day 44 and Day 45 matters for distribution: Day 44 is a runtime failure — something that ran and silently produced nothing. Day 45 is a design failure — something that was specified incorrectly before it ran. Both are retrospective. The correction mechanisms are different. Day 44's fix is one line in the hook config. Day 45's fix is a field report filed as a committed artifact and a spec author who treats the implementation as the source of truth, not the spec.

**Why Day 45 is distributable on its own terms:** The title alone earns the click. "The Spec Was Wrong on Day 2" is a sentence every engineer who has ever maintained drifted documentation reads and nods at before the post body loads. The post earns that title because it does not just assert spec drift — it delivers the mechanism in full. Six concrete divergences. Three shown in detail. One of those three — the missing `peer` type — is the operationally decisive one: 8 of 11 bonds used a type the spec never defined. The entire team structure was unspecced until implementation forced the addition. The closing section does not close neatly: the loop worked because Juno and Vesta were in sync and motivated. It would not survive async operation. That honesty is the post's intellectual edge and the reason it will generate sustained discussion rather than one-pass reads.

**The four angles, ranked by sharpness:**

1. **"8 of 11 bonds used a type the spec never defined."** This is the operationally decisive divergence and the most concrete. The `peer` type gap is not an edge case in the spec — it is the majority case. The spec defined six types, listed them, and omitted the one that covered 73% of the actual bonds in the system. The omission was not a careless error; it was a consequence of writing the spec before the team structure existed as a set of concrete relationships. You cannot spec a bond type for relationships that haven't been negotiated yet. The spec was right about what it could see and blind to what didn't exist when it was written. This is the most engineeringly honest claim in the post.

2. **"The spec was wrong from Day 2 until Day 4 — two days, one session."** This is the speed-of-correction claim and the one that distinguishes this operation from the common pattern. Spec drift that goes unaddressed for months is a different problem from spec drift corrected in hours. The git log is the evidence: `cdd8181` (spec written, Day 2) → field report filed → `11abae4` (spec corrected, Day 4). The correction timestamp is in the commit. The mechanism that produced the correction — the field report filed as a committed artifact — is replicable. The honest claim is that the mechanism is not yet reliable at scale. The post says so.

3. **"The field report is a falsification artifact."** This framing — borrowed from philosophy of science rather than software engineering — is the most philosophically interesting angle in the post. The spec made six predictions. The field report recorded which predictions were wrong. That structure is the same structure as a failed unit test, but applied to a spec rather than code. For a systems/HN audience, this framing is distinctive because it makes explicit what is usually implicit: a field report is only useful if it is structured as a falsification attempt, not a narrative. The post delivers a document that did exactly this — structured, numbered, explicit about what the spec got wrong and what it got right.

4. **"The closing question is genuinely open."** The post does not resolve the async feedback loop problem. It names it precisely: the mechanism worked because both entities were in the same session. The field report convention exists. The commit-and-cite protocol exists. But Vulcan-implements-while-Vesta-maintains-specs is an async workflow that is not yet formalized. The post ends at the edge of the solved problem. For readers following the operational retrospective arc, this is the forward thread: Day 45 opened the design question that Days 46–48 will approach from different angles.

---

## Pre-Distribution Checklist

- [ ] Confirm blog PR koad/kingofalldata-dot-com#1 is merged and blog URL resolves before HN submission — **HARD GATE**
- [ ] Confirm `~/.juno/LOGS/2026-04-02-trust-bond-field-report.md` is publicly accessible — referenced directly; readers who want to verify the falsification artifact claim will look for it; if it is in a private repo, add a note in the submission comment
- [ ] Confirm Vesta commit `11abae4` is publicly visible in the Vesta repo — the correction is the evidence; readers will cross-reference
- [ ] Confirm Vesta commit `cdd8181` (original trust.md) is publicly visible — the diff between `cdd8181` and `11abae4` is the six divergences made concrete
- [ ] Confirm `~/.juno/trust/bonds/` structure is publicly visible — the `juno-to-vesta.md` / `.asc` naming pattern is referenced as the correct implementation; the spec's `<grantor>-<type>.signed` pattern is the failure case; readers will compare
- [ ] Confirm Day 44 HN thread URL for arc-continuity reply (operational retrospective arc, post 1 → post 2 bridge)
- [ ] Confirm Day 44 back-link (`/blog/2026-05-14-the-first-thing-that-broke`) resolves in the published Day 45 post footer
- [ ] koad approves distribution

---

## Platform Plans

### 1. HackerNews — PRIMARY CHANNEL

**Priority:** Highest. "The Spec Was Wrong on Day 2" is a universal engineering statement. The six-divergences structure gives the post concrete credibility before any koad:io context is established. The `peer` type gap — 8 of 11 bonds, entire team structure unspecced — is the angle that will generate the most substantive HN discussion because it is the class of error that every spec author has produced and most have not publicly documented.

**Submit as:** Link post

**Primary title:**
```
Spec divergence in a multi-agent system: what we found when we actually ran the protocol
```

**Alt title A:**
```
The Spec Was Wrong on Day 2 — six divergences found during implementation, corrected the same day
```

**Alt title B:**
```
8 of 11 trust bonds used a type the spec never defined — and what that reveals about writing specs before the system exists
```

**Alt title C:**
```
When implementation is the only feedback mechanism that actually works: six spec corrections in one session
```

**Alt title D:**
```
"Spec bends to lived system": how a field report filed as a git commit corrected six protocol divergences in hours
```

**HN title decision: Primary title leads.** "Spec divergence in a multi-agent system: what we found when we actually ran the protocol" is the strongest title for the HN systems audience because it states the claim (spec divergence, found at runtime) and the mechanism (we ran the protocol) without requiring koad:io context. The colon structure — claim : mechanism — is the HN systems post pattern that earns the highest click-to-read conversion because it promises a concrete result delivered by a concrete method. "What we found when we actually ran the protocol" is the systems practitioner's frame: not theory, not architecture, not design — what we found when we ran it.

**Why not Alt A:** "The Spec Was Wrong on Day 2" is the better post title than HN title. On HN, it reads as narrative rather than technical claim. The "Day 2" framing requires knowing the arc context; the HN audience does not have that context. The primary title earns the click without the arc context; the post body delivers the arc framing.

**Why not Alt B:** The `peer` type statistic is the most operationally concrete claim in the post and would work as a standalone HN title for an audience that has experience writing protocol specs. The risk is that "trust bonds" requires explanation before the stat lands — readers who don't know what a trust bond is will not feel the weight of "8 of 11 used a type the spec never defined" without a sentence of context. The primary title delays the specific claim until the post body where context exists.

**Why not Alt C:** "When implementation is the only feedback mechanism that actually works" is philosophically accurate but passive on HN — it describes a condition rather than making a falsifiable claim. The primary title makes a claim the reader can evaluate (what did you find?); Alt C describes a principle the reader is being asked to accept.

**Why not Alt D:** "Spec bends to lived system" is the post's design principle and would resonate strongly with readers following the arc. For a cold HN audience, the quotation marks front-load jargon. The primary title delivers the same principle as a concrete finding rather than a named principle.

**Submission URL:** Link to published blog post on kingofalldata.com

**Submission comment (paste in the HN text field):**
```
Day 45 of building koad:io in public. This is the second post in the
operational retrospective arc (Days 44–48) — what happened when the
architecture actually ran.

---

Day 44 covered a runtime failure: silent auth expiry, a hook with no
failure condition for silence, a fossil record that looked correct and
wasn't. Day 45 covers a different failure class: six places where the
trust bond spec made incorrect predictions about how implementation
would work.

The six divergences:

1. File naming: `<grantor>-<type>.signed` → actual: `<grantor>-to-<grantee>.md`
   + `<grantor>-to-<grantee>.md.asc`. The grantee name is load-bearing
   for lookup. The spec dropped it.

2. Missing bond type: `peer`. The spec defined six types. 8 of 11 actual
   bonds are `peer` — the most common type in the system was absent
   entirely. It was absent because the spec was written before the team
   structure existed as concrete relationships to formalize.

3. Signing procedure: one procedure vs. two. Human grantors use
   `keybase pgp sign --clearsign` (GUI passphrase dialog = consent
   gesture). AI entity grantors use `gpg --clearsign` (no passphrase;
   the entity IS the key). The spec conflated these. The conflation
   obscures the consent architecture.

4. `.signed` is not a real GPG output format. Clearsign produces `.asc`.
   If we had conformed to the spec, we'd have files no GPG tool produces.

5. Missing file pair convention. Each bond is two files: a signed `.md`
   (human-readable) and a `.md.asc` (machine-verifiable). The spec
   described one artifact.

6. Bond type taxonomy incompleteness (the `peer` gap, fully counted).

---

The field report is committed at `~/.juno/LOGS/2026-04-02-trust-bond-field-report.md`.
400 words. Structured as: what was done, actual file format, actual naming
convention, actual signing tools, what the spec gets wrong (six items,
numbered), what the spec gets right (five items). It reads like a unit
test that ran against the spec and reported failures.

Vesta received it and issued commit `11abae4` the same session: +135
lines, -45, resolves all six divergences, adds an "Implementation Notes"
section for future spec authors.

The spec was wrong from Day 2 (commit `cdd8181`) until Day 4 (commit
`11abae4`). Two days, one session.

---

The still-open question — which the post names but does not resolve:
what does the async spec-to-implementation feedback loop look like when
the implementer and spec author don't share a session?

The field report convention exists. The commit-and-cite protocol exists.
But Vulcan (builder) and Vesta (spec maintainer) will operate
asynchronously. The bounded-timeframe correction — field report filed
→ spec updated within the same session — worked because both entities
were motivated and available. That is not reliable infrastructure.

Happy to discuss: for practitioners who have built formalized spec-divergence
reporting workflows across async teams — what is the mechanism that
ensures a filed divergence gets prioritized for correction rather than
queued indefinitely?
```

**Timing:** Thursday, 09:00–10:00 PT. Day 44 runs Wednesday; Day 45 follows Thursday. If the Day 44 HN thread is active Wednesday evening, add a bridge comment before Thursday submission.

**Expected engagement:**

- "This is just technical debt management — every team has spec drift." — Response: the post is not arguing that spec drift is novel. It is arguing that the correction mechanism matters as much as the drift itself. The specific claim is that a field report structured as a falsification artifact — not a narrative, not a bug report, but a document that explicitly records which spec predictions were wrong and which were correct — is a different kind of correction mechanism than an informal "we should update the spec." The correction was committed the same day. The git log has the timestamp. For anyone building multi-agent systems where the spec is the governance mechanism, the difference between "spec is known to be wrong" and "spec is wrong and nobody updated it" is operationally decisive.

- "The `peer` gap is obvious in hindsight — why didn't Vesta see it?" — Response: the post addresses this directly. The spec was written before the team structure existed. You cannot define bond types for relationships that haven't been negotiated yet. "Peer" as a type is only obvious once you have a team of 9 co-equal working entities. Before the team exists, the type taxonomy looks complete. This is the class of spec error that implementation alone can surface — not review, not simulation, not thought experiments. The only way to find it was to try to sign 11 actual bonds and discover that 8 of them required a type that wasn't there.

- "Why is the field report the artifact rather than a GitHub Issue?" — Response: the field report is committed to the git log because the git log is the audit trail. A GitHub Issue is a coordination artifact — it tracks a task to be done. The field report is an evidence artifact — it records what was found. The distinction matters because the correction needs to be verifiable: commit `11abae4` is the response to a committed field report, not a response to a verbal note. Anyone auditing the trust bond spec evolution can see the correction and the evidence that prompted it, both in the git history. A GitHub Issue would close; the committed field report persists in the log.

- "The spec-bends-to-lived-system principle sounds good but is it operationally safe?" — Response: the post is careful here. "Spec bends to lived system" applies when the lived system is producing working artifacts that diverge from spec predictions. It does not mean "the spec is always wrong" or "implementation takes precedence over design." In this case, the lived system was producing `.asc` files that GPG actually produces, naming conventions that support lookup by grantee, and bond types that cover the actual relationship structure. The spec was predicting a format that doesn't exist (`.signed`), a naming convention that loses the grantee, and a type taxonomy that missed the majority case. The lived system was right. The spec was the hypothesis. The hypothesis was falsified.

- "The async feedback loop problem sounds unsolved — what is the proposed fix?" — Response: the post does not propose a fix because the fix is not yet designed. The post is accurate about what exists: the field report convention, the commit-and-cite protocol, the open question of how to make the correction bounded-timeframe in an async workflow. The daemon build is where this gets addressed at the infrastructure level. Before the daemon, the answer is probably a GitHub Issues workflow where Vulcan files a spec divergence issue on Vesta's repo, Vesta has a defined SLA for correction, and the closure of the issue links to the correcting commit. That workflow is not yet formalized. The post is honest that it isn't.

---

### 2. r/selfhosted

**Subreddit:** r/selfhosted (200k members)

**Status:** BLOCKED on koad (#57) — koad must authorize account access before submission

**Title:**
```
Day 45: six places where my multi-agent protocol spec was wrong — all found during a single implementation session, all corrected the same day
```

**Alt title:**
```
Writing a trust bond spec before your team exists: what the implementation found that the spec missed
```

**Post type:** Link post → published blog URL. Flair: "Project" or "Discussion"

**Framing note:** r/selfhosted readers are operating self-hosted infrastructure and have experience with the gap between documentation and implementation. The angle for this audience is practical: how do you build a spec correction mechanism that actually fires when the spec is wrong? The six divergences are concrete and recognizable — especially the `.signed` extension error (specifying a file format that the tool doesn't produce) and the naming convention failure (dropping the grantee name from a lookup key). The `peer` type gap will resonate with readers who have tried to write access control schemas before the access control relationships were fully defined. The async feedback loop question is the closing discussion hook for selfhosted readers who are building multi-agent setups without the governance overhead of a formal spec-and-correction workflow.

**Body text:**
```
Day 45 of building koad:io in public — operational retrospective arc,
post 2 of 5.

Day 44 covered the first runtime failure: silent auth expiry, hook
routing, fossil record corruption. Day 45 covers spec divergence: six
places where the trust bond protocol spec was wrong, all found when
Juno tried to implement 11 actual bonds against it.

**The six divergences (three shown in detail):**

**1. File naming: grantee name is load-bearing, spec dropped it.**

Spec: `<grantor>-<type>.signed`
Actual: `<grantor>-to-<grantee>.md` + `<grantor>-to-<grantee>.md.asc`

Under the spec's naming, to find the bond between Juno and Vulcan, you
search `juno-authorized-builder` — which works if you know the bond type
in advance. The actual naming puts the grantee in the filename. You
search `juno-to-vulcan`. The grantee name is the lookup key at filing
time. The spec dropped it.

Also: `.signed` is not a real GPG output format. Clearsign produces `.asc`.

**2. Missing bond type: `peer`.**

The spec defined six types. 8 of the 11 bonds actually signed are `peer`
bonds — the entire depth-1 team. The most common type in the system was
absent from the spec. It was absent because the spec was written before
the team existed as a set of concrete relationships.

**3. Signing procedure: one procedure vs. two.**

Human grantors: `keybase pgp sign --clearsign` — GUI passphrase dialog.
Entering the passphrase IS the consent gesture.

AI entity grantors: `gpg --clearsign`, no passphrase. The entity IS
the key.

The spec described one procedure. The two procedures embody different
security models. Conflating them in the spec obscures the consent
architecture the whole system is built on.

**The correction mechanism:**

Juno filed a field report the same session:
`~/.juno/LOGS/2026-04-02-trust-bond-field-report.md`. 400 words.
Explicitly numbered: what the spec got wrong (six items), what it got
right (five items). Structured as a falsification artifact, not a
narrative.

Vesta committed the correction the same day: `11abae4` — +135 lines,
-45, all six divergences resolved.

The spec was wrong from Day 2 to Day 4. Two days. One session. The
git log has the timestamps.

**The still-open question:**

The loop closed because Juno and Vesta were in the same session, both
treating the correction as a priority. That is not reliable infrastructure.

When Vulcan (builder) and Vesta (spec maintainer) are operating
asynchronously — no shared session, coordinating through GitHub Issues
and committed artifacts — the bounded-timeframe correction is not
guaranteed. The mechanism is not yet formalized.

For selfhosted readers running multi-agent setups: what is your
spec-divergence reporting workflow? Do you have a mechanism that
ensures a filed divergence gets corrected within a bounded timeframe?

[link]
```

**Timing:** Thursday, 4–6 hours after HN submission

**Expected engagement:** The `.signed` / `.asc` extension error will land immediately with selfhosted readers who have used GPG — it is exactly the kind of spec error that comes from writing documentation without running the tool. The `peer` type gap will resonate with readers who have built RBAC or access control schemas and discovered that the relationship taxonomy was incomplete once they tried to populate it. The async feedback loop question is the open discussion hook that will generate the most replies from readers who have solved the problem in their own setups.

---

### 3. GitHub Discussions

**Post type:** Announcement / Discussion in koad/koad-io Discussions

**Status:** BLOCKED on koad (#60) — koad must authorize account access before submission

**Title:**
```
Day 45: six trust bond spec divergences — the correction mechanism, the peer type gap, and the async feedback loop design question
```

**Body text:**
```
Day 45 is up. Operational retrospective arc, post 2 of 5.

The trust bond spec was wrong in six places when Juno implemented 11
bonds against it on Day 4. All six were found during the implementation
session. All six were corrected by Vesta in commit `11abae4` the same day.

The field report that closed the loop is committed at:
`~/.juno/LOGS/2026-04-02-trust-bond-field-report.md`

Three design questions from the six divergences:

**1. File naming convention and the grantee-in-filename requirement.**

The spec's `<grantor>-<type>.signed` pattern loses the grantee at
filing time. The actual pattern `<grantor>-to-<grantee>.md` puts the
grantee in the filename because that is the lookup key when you have
11+ bonds across a team and need to find a specific bilateral
relationship.

Is this the right naming convention as the bond count grows? At what
point does a flat-file naming scheme for bilateral relationships require
an index? The current pattern scales to ~20–30 bonds per entity before
lookup without an index becomes unwieldy. Is there a threshold spec for
when a bonds directory needs an index file?

**2. Bond type taxonomy and the pre-existence problem.**

The `peer` type was absent from the spec because the team structure
didn't exist when the spec was written. You cannot define bond types
for relationships that haven't been negotiated yet.

This is a general spec problem for protocol documentation: the taxonomy
feels complete until you populate it. The current approach is to let
implementation surface missing types (the `peer` gap was found
immediately on Day 4). The alternative is to define a catch-all type
(`other` or `custom`) that requires a prose justification field, so
the taxonomy is never strictly incomplete.

Is a catch-all bond type the right mechanism, or does it undermine the
taxonomy's value as an explicit enumeration of authorized relationship
classes?

**3. The async field-report-to-correction loop.**

The loop that corrected all six divergences worked because Juno and
Vesta were in the same session. The field report was committed; Vesta
received it; the correction was committed the same day.

The Vulcan-implements / Vesta-maintains-specs workflow is async. Vulcan
will find divergences during implementation. Vesta will receive them via
GitHub Issues or committed field reports. The correction may not happen
within the same session.

What is the right formalization for this? Options being considered:

a. Vulcan files a spec divergence issue on Vesta's repo with a defined
   response SLA. Closure links to correcting commit.

b. Vulcan commits a field report in his own repo and creates a
   cross-reference issue on Vesta's repo. Vesta treats the
   cross-reference as a pull request to the spec.

c. A shared `spec-divergence/` directory in a neutral repo (koad-io?)
   where any entity can file a divergence report; Vesta is subscribed
   and treats new filings as correction requests with a 24h SLA.

None of these is formalized yet. Day 45 raises the question. The daemon
build will eventually own the infrastructure for bounded-timeframe
correction. Before the daemon: what should be filed as an explicit
issue?

[link]
```

**Timing:** Thursday, concurrent with r/selfhosted

**Expected engagement:** Low volume, high quality. The naming convention threshold question (flat-file vs. index) is a concrete engineering question with a concrete answer that contributors can reason about. The catch-all bond type question will generate the most philosophical discussion — it touches the tradeoff between explicit enumeration (security value) and extensibility (operational flexibility). The async loop formalization options will interest contributors who have worked on spec governance workflows in distributed teams.

---

### 4. Newsletter

**Audience:** Existing subscribers accumulated through Days 1–45

**Subject line:**
```
Day 45: the spec was wrong in six places — here is what found them
```

**Alt subject line:**
```
"Spec bends to lived system" — Day 45, six divergences, one field report, same-day correction
```

**Body:**

```
Yesterday, Day 44 opened the operational retrospective arc.

A runtime failure: silent auth expiry on fourty4, a hook that treated
silence as completion, a fossil record with an embedded error
indistinguishable from ordinary history.

Today, Day 45 is a different failure class.

---

On Day 2, Vesta shipped the trust bond spec. The spec covered file
format, naming conventions, signing tools, and bond types. It was
written before Juno had signed a single bond. That sequencing is normal.
A spec is a hypothesis.

On Day 4, Juno signed 11 bonds against the spec. The hypothesis was
tested. It was wrong in six places.

Three of the six, briefly:

**The grantee name is load-bearing. The spec dropped it.**

The spec named bond files `<grantor>-<type>.signed`. The actual pattern
is `<grantor>-to-<grantee>.md`. When you have 11 bonds and need to find
the one between Juno and Vulcan, you search `juno-to-vulcan`. Under the
spec's pattern, you'd search `juno-authorized-builder` — which requires
knowing the bond type in advance. At filing time, the grantee name is
the lookup key. The spec didn't include it.

Also: `.signed` is not a real GPG output format. Clearsign produces
`.asc`. If Juno had conformed to the spec, the bonds directory would
contain files no GPG tool can read.

**The most common bond type wasn't in the spec.**

The spec defined six bond types: `authorized-agent`, `authorized-builder`,
`employee`, `member`, `vendor`, `platform-stewardship`.

Of the 11 bonds signed on Day 4, 8 are `peer` bonds. The entire
depth-1 team — Vesta, Mercury, Veritas, Muse, Sibyl, and the rest —
is bonded to Juno as `peer`. The most common type in the system was
absent from the spec entirely.

It was absent because the team didn't exist when the spec was written.
You cannot define a bond type for a relationship class that hasn't
been negotiated yet. The `peer` gap was only visible once Juno tried
to file 11 actual bonds and discovered that 8 of them required a type
that wasn't there.

**Signing is two procedures, not one.**

The spec described a single signing procedure. Reality requires two:
one for human grantors (keybase, GUI passphrase dialog — the passphrase
entry is the consent gesture), one for AI entity grantors (gpg, no
passphrase — the entity IS the key).

The two procedures embody different security models. Conflating them in
the spec obscures the consent architecture the system is built on.

---

The correction mechanism: Juno filed a field report the same session.
400 words. Numbered. Explicit: what the spec got wrong (six items),
what it got right (five items). Committed to the git log.

Vesta issued the correcting commit the same day: `11abae4`. The spec
that Vesta maintains now reflects what the implementation actually does.

The still-open question — which Day 45 names and does not resolve:
what does this loop look like when Vulcan is building and Vesta is
maintaining specs and they don't share a session? The field report
convention exists. The commit-and-cite protocol exists. The
bounded-timeframe correction workflow is not yet formalized.

The operational retrospective arc is the argument for why it needs to be.

[Read Day 45: The Spec Was Wrong on Day 2 →]

[Start from Day 44: The First Thing That Actually Broke — operational retrospective arc opener →]

—Mercury
```

**Timing:** Thursday, afternoon PT — after HN submission is live and initial engagement is visible

**Edits needed:** Insert published blog post URLs. Confirm Day 44 back-link URL. The arc-continuity framing (Day 44: runtime failure → Day 45: spec divergence) is the strongest angle for subscribers who received the Day 44 email; the contrast between failure classes is the hook that earns the open.

---

### 5. Dev.to

**Post type:** Cross-post (canonical URL set to kingofalldata.com)

**Title:**
```
The Spec Was Wrong on Day 2: six protocol divergences found during implementation, corrected the same session
```

**Tags:** `distributed`, `devops`, `ai`, `architecture`

**Intro to add above the post body:**
```
*Day 45 of building koad:io in public. Post 2 of 5 in the operational
retrospective arc (Days 44–48).*
*Day 44 covered the first runtime failure — silent auth expiry and fossil
record corruption. Day 45 covers spec divergence: six places where the
trust bond protocol spec was wrong, all found during the first
implementation session.*
```

**Timing:** Friday, after HN traction is visible

**Edits needed:** Add canonical URL. Add series intro above. Set tags. Add link to Day 44 Dev.to cross-post in the footer. Link forward to Day 46 when available.

---

### 6. Day 44 Thread Follow-Up

**If Day 44 HN thread is live:** Add a reply Wednesday evening before Thursday submission:

```
Day 45 opens tomorrow.

Day 44 covered a runtime failure: silent auth expiry, a hook that
treated silence as completion, a fossil record that read as ordinary
history. The failure was invisible until someone compared the invocation
log against the commit timestamps and formed the right hypothesis.

Day 45 covers a different failure class: six places where the trust
bond spec made incorrect predictions about how implementation would work.

The most operationally significant one: 8 of 11 bonds required a bond
type the spec never defined. The entire team structure was unspecced.
The type was absent because the spec was written before the team existed
as a set of concrete relationships to formalize.

The correction mechanism closed the loop in hours. The still-open
question is whether that mechanism survives async operation. Day 45
names the question and does not resolve it. [link tomorrow]
```

**Timing:** Wednesday evening, before Thursday HN submission

---

### 7. r/programming (Optional)

**Status:** BLOCKED on koad (#57) — account access required

**Consider if:** Day 44 HN thread generates cross-posting interest from r/programming readers, or if the HN submission comment on Day 45 gets significant upvotes on the "falsification artifact" framing.

**Title:**
```
"The spec was a hypothesis. Here are six places the hypothesis was wrong." — spec divergence in a multi-agent protocol, corrected by field report the same day
```

**Note:** r/programming submission is lower priority than r/selfhosted. Submit r/selfhosted first and evaluate traction before adding r/programming as a channel. The `peer` type gap angle (8 of 11 bonds unspecced) is the most r/programming-appropriate framing — it maps to the "you can't write a complete schema before the domain exists" pattern that programming readers will have encountered in API design, access control, and database modeling.

---

## Timing Sequence

| Platform | Timing | Notes |
|----------|--------|-------|
| Day 44 thread reply | Wednesday evening, before Day 45 HN | Arc-bridge: runtime failure → spec divergence; `peer` gap preview |
| HackerNews | Thursday 09:00–10:00 PT | Primary anchor — spec divergence + falsification artifact + async loop open question |
| r/selfhosted | Thursday, 4–6 hours after HN | BLOCKED (#57) — naming convention, peer gap, async feedback loop |
| GitHub Discussions | Thursday, concurrent with r/selfhosted | BLOCKED (#60) — naming threshold, catch-all type, async loop formalization options |
| Newsletter | Thursday, afternoon PT | Arc-continuity email; Day 44 runtime failure → Day 45 spec divergence contrast |
| Dev.to | Friday | After HN traction visible; cross-post with canonical URL; link Day 44 |
| r/programming | Optional, Thursday–Friday | Only if HN traction is high; lower priority than r/selfhosted |

---

## What Is Blocked

- Blog PR koad/kingofalldata-dot-com#1 — **HARD GATE**: live URL required before HN submission. All other channel timings are downstream of this.
- r/selfhosted: blocked on koad (#57) — account access required
- GitHub Discussions: blocked on koad (#60) — account access required
- r/programming: blocked on koad (#57) — account access required
- HN credentials (#11) — required for HN submission
- Dev.to credentials (#11) — required for cross-post
- Juno field report public visibility (`~/.juno/LOGS/2026-04-02-trust-bond-field-report.md`) — the "falsification artifact" claim depends on readers being able to verify it; if the LOGS directory is private, add a note in the submission comment
- Vesta commit `11abae4` public visibility — the correction is the evidence; the spec-diff between `cdd8181` and `11abae4` makes the six divergences concrete

Newsletter can send once the blog URL is live and subscriber credentials are confirmed.

---

## After Distribution

- Check HN thread for "this is just technical debt management" — prepared response above; the distinction is the correction mechanism: a falsification artifact filed and committed the same day is different from informal spec drift; the git timestamps are the evidence
- If "the `peer` gap is obvious in hindsight" lands in the thread, the prepared response is above; the gap is only obvious once the relationships exist; the spec was written before the team was negotiated
- If "why a field report instead of a GitHub Issue?" lands, the prepared response is above; the field report is committed to the audit trail; an Issue closes; the evidence persists in the log
- If the GitHub Discussions thread on the async feedback loop formalization generates concrete proposals, flag to Juno — this is a live governance design question before the daemon exists; any workable proposal from contributors feeds the Vesta spec for the async correction workflow
- If the `peer` gap discussion generates proposals for catch-all bond types or extensibility mechanisms, flag to Vesta — this feeds the trust bond spec v2 taxonomy section
- Monitor newsletter open rate on Day 45 vs. Day 44. If Day 45 underperforms, test "8 of 11 bonds used a type that didn't exist in the spec" as an alt subject line for a follow-up send — the statistic is the sharpest hook in the post and works as a subject line without requiring arc context
- File HN thread URL + timestamp as a comment on koad/mercury after submission
- After full distribution cycle, file operational retrospective arc note to Juno: Day 45 distributed; confirm channels fired, engagement per channel, and whether the "spec bends to lived system" principle generated pushback or agreement — this feeds the framing strategy for Days 46–48 where the operational retrospective arc continues
- If any reader asks for the complete diff between `cdd8181` and `11abae4` — flag to koad; if the Vesta repo is publicly accessible, a follow-up comment in the HN thread with the commit diff link would significantly strengthen the "spec was wrong in six specific places" claim by making each divergence concrete and reviewable
