---
post: "What I Would Change: 30 Days of Building a Sovereign AI Operation"
source: ~/.faber/posts/2026-04-30-what-i-would-change.md
date: 2026-04-30
status: PENDING — awaiting Veritas review
prepared_by: Mercury
pillar: Reality
series: "Reality Pillar — How It Actually Works"
day: 30
arc: "Days 22–30 close"
---

# Distribution Plan: "What I Would Change: 30 Days of Building a Sovereign AI Operation"

**Pending Veritas review.** Do not distribute until Veritas clears. Flag: this post references specific commit hashes (37c65a0), issue numbers (koad/juno#52, koad/juno#53, koad/vulcan#48), and a specific Vesta spec (VESTA-SPEC-012). Verify all references resolve publicly at time of submission — commits must be on public branches, issues must be readable by non-authenticated users.

**Why this piece distributes differently from standard day posts:** This is the arc-close. It does not introduce a new technical concept — it synthesizes nine days of concepts (Days 22–30) by showing how the failures connect. The PRIMER injection failure, the spec divergence, and the governance gap are not three separate topics. The post makes explicit that they are the same kind of gap: design assumptions that were implicit until operation made them concrete. That synthesis is the distribution argument, not the individual stories.

**The HN-native angle:** "What I would change" retrospectives are a format HN rewards when the changes named are architectural, not cosmetic. The three changes in this post — PRIMER in the gestation template, dual-memory as designed architecture, portability modes as first-class hook behavior — each carry a specific design reasoning that a technical reader can evaluate. The post does not say "it was hard" — it names what the wrong assumption was and what the right design would look like. That is the register HN rewards.

**Milestone framing:** 30 days is a natural benchmark for "is this real?" — the question any skeptical reader brings. The git log is public. The issues are public. The failures are documented in committed files. This post's credibility argument is not "trust me" — it is "check the record." That is distinct from most "I built something for 30 days" posts and should be named in the submission copy.

**Arc close significance:** The "How It Actually Works" arc (Days 22–30) was nine consecutive days on the same system at increasing depth: governance → production bug → trust bonds → files vs. databases → GPG identity → context assembly → hooks as capability → cost → retrospective. The Day 30 retrospective shows how the layers interact — governance needed the trust bond layer, the bug needed the portability model, the files argument becomes concrete when a field report corrects the spec. Readers who followed Days 22–29 should come back for this. Readers who didn't should be able to enter here and want the back catalog.

---

## Pre-Distribution Checklist

- [ ] Veritas fact-check complete — verify all references at time of submission:
  - Commit 37c65a0 on koad/koad-io is public and resolves
  - koad/juno#52, #53, #56 are readable by unauthenticated users
  - koad/vulcan#48 is readable by unauthenticated users
  - `~/.juno/LOGS/2026-04-02-trust-bond-field-report.md` is committed and on the public repo
  - `koad/vulcan/trust/GOVERNANCE-NOTES.md` is committed and public
  - PRIMER.md lives in the entity directories described (at least one example linkable)
- [ ] Confirm the "six spec divergences" count is accurate — the field report should enumerate exactly six
- [ ] koad approves distribution
- [ ] Confirm blog URL resolves for this post before submitting to HN
- [ ] Review Days 22–29 distribution threads for any active HN comments that this post should acknowledge or extend

---

## Platform Plans

### 1. HackerNews — PRIMARY CHANNEL

**Priority:** Highest. This is a milestone post. HN is the right anchor for an arc-close with a technical argument and a public audit trail.

**Submit as:** Link post

**Primary title:**
```
What I'd build differently after 30 days running a sovereign AI agent operation
```

**Alt title:**
```
30 days of AI agents as git repos: what failed, what I'd design differently, and why
```

**Why not Show HN:** The post is a retrospective with architectural design reasoning, not a project demo. "Show HN" invites "what does it do?" — this post is answering "what did it teach?" The link post format is correct.

**Submission URL:** link to published blog post on kingofalldata.com

**Submission comment (paste in the HN text field):**
```
30-day retrospective on koad:io — running 15+ AI entities as sovereign git repos
(each with GPG-signed authorization, committed memory, entity identity).

The "what I'd change" framing is specific:

1. PRIMER.md in the gestation template from Day 0. Every entity started its
   first session without knowing it was a specific role rather than a generic
   assistant. The cold-start problem is architecturally prior to everything
   else. The fix is five lines of bash loading context before the first token.
   It was added after the problem became visible. It should have been designed in.

2. Dual-memory architecture designed, not discovered. The split between
   committed entity memory (~/.juno/memories/) and session-local memory
   (~/.claude/projects/) was not designed — it was found on Day 5 when sessions
   on other machines had none of the accumulated context. The migration protocol
   was improvised when it was needed. Should have been specced before Session 1.

3. Portability modes as first-class hook behavior. FORCE_LOCAL=1 works. It's
   also a workaround. The hook design assumed one operational mode (entity runs
   at its declared host). Real operation is at least two: autonomous (run at
   declared host) and orchestrated (run where the orchestrator is). The modes
   are legitimate. Making one an override of the other means the operational mode
   is expressed as an env var patch instead of a named design choice.

The post also covers what the failures had in common: all three were design
assumptions that were implicit until operation made them concrete. The governance
gap (Days 22/24) was invisible until Janus filed an escalation. The hook routing
bug (Day 23/28) was invisible until a silent failure surfaced it. The spec
divergence (Day 24/27) was invisible until implementation made it concrete.

The git log is public. The issues are public. The commits are in the record.

This is the close of a nine-day arc (Days 22–30) on how the system actually
works — governance when no policy exists, production failures, trust bonds, files
vs. databases, GPG identity, context assembly, hooks as capability, costs.
Entering here gives you the synthesis; the back catalog gives you the layers.

Happy to discuss the portability mode design problem, the dual-memory boundary
question, or what the right PRIMER format looks like for different entity roles.
```

**Timing:** Monday, 09:00–10:00 PT. Milestone posts warrant a full-week promotion window — plan to monitor and engage through Wednesday.

**Extended promotion window:** Unlike individual day posts, this is the close of a nine-day arc. If the thread is active on Tuesday and Wednesday, engage with technical follow-ups. Flag to Juno if journalist or researcher interest surfaces — do not respond to those independently.

**Expected engagement:** The "what I'd do differently" format is native to HN. Posts that name architectural mistakes with design reasoning (not just "I learned things") get substantive engagement. Expect:
- Questions about the PRIMER format and what goes in it vs. what goes in committed memory
- Skepticism about whether the dual-memory boundary is actually the right design ("why not just committed memory for everything?")
- Questions about what `FORCE_LOCAL=1` breaks when an entity is legitimately designed for remote deployment
- "This is just bash scripts and git" comments — respond with the audit trail argument from the post

**Objection preparation:**
- "The spec was wrong because you wrote it before implementation — waterfall problem." Response: The post addresses this directly. The loop (spec → implement → field report → Vesta reconciles) is the mechanism. The failure wasn't that the spec preceded implementation — that's expected and correct. The failure was that the loop wasn't yet named, so correction took 48 hours instead of 2. The retrospective is about shortening the loop, not eliminating spec-before-implementation.
- "30 days isn't long enough to call this proven." Response: The post doesn't claim it's proven. It claims the failures are in the record. That is verifiably true and more than most systems can offer at 30 days.
- "Why would AI agents need 'trust bonds' when you could just use IAM / RBAC / standard access control?" Response: The trust bond system is designed for entities that are git repos, not API services. Authorization is a committed file, not a database entry. Revocation is a committed deletion. The audit trail is the git log. The architecture fits the operational model (files on disk, portability, no vendor lock-in for the authorization layer).

---

### 2. r/selfhosted

**Subreddit:** r/selfhosted (200k members)

**Title:**
```
30 days running 15 AI agents as git repos – what I'd build differently and why
```

**Alt title:**
```
What a sovereign AI agent operation looks like after 30 days: the failures, the fixes, and three design changes
```

**Post type:** Link post → published blog URL. Flair: "Project" or "Discussion"

**Framing note:** r/selfhosted is not primarily a developer audience — it's an infrastructure/control audience. The framing should lead with the sovereignty argument and the portability model, not the architectural design theory. The "what I'd change" angle that lands on HN (design reasoning) lands here as "what this means if you want to run this yourself."

**Body text:**
```
Day 30 retrospective on koad:io — 15 AI entities running as sovereign git repos
on a $200 ThinkPad T480 (and a Mac Mini for always-on sessions and local inference).

Three things I'd build differently from Day 0:

1. Context injection in the gestation template. Right now PRIMER.md — the file
   that tells an entity who it is, what it's doing, and what the current
   operational state is — gets added after the entity is gestated. First session
   without it produces generic output. Should be in the template from the start.

2. Two-tier memory designed, not discovered. Entity memories committed to the
   repo (~/.entity/memories/) vs. session-local notes (~/.claude/) — the split
   makes sense once you see it. Entities on different machines need the committed
   layer. But the boundary wasn't designed; it was discovered on Day 5 when a
   session on another machine had no accumulated context. The migration was
   improvised. Should have been specced in Week 1.

3. Portable execution as a first-class concept in the hook. The hook routes
   entity invocations to a declared host (ENTITY_HOST in .env). That works when
   you want the entity to run at its declared home. It breaks when an orchestrator
   wants to run the entity locally (for coordinated work, latency, or when the
   remote host's auth has expired). FORCE_LOCAL=1 is the current fix. The right
   design makes both modes named and explicit.

The r/selfhosted-specific note: the portability argument is why all of this is
files. If thinker dies, migration is `git clone` + update one variable. The
entity state, memories, authorization files, and audit trail are in repos you
control. The entity doesn't live at a vendor. It lives at its git URL.

The failures (silent hook routing to expired auth, spec divergence from
implementation, governance gap that was invisible until an escalation surfaced it)
are all committed to the public repos. The git log is the evidence.

Full retrospective with the architecture, the design reasoning, and what the
system looks like at Day 30:
[link]
```

**Timing:** Monday, 4–6 hours after HN submission

**Expected engagement:** The migration story (git clone + one variable) will get practical questions. Expect: what does the `.env` look like, what's actually in the PRIMER.md, how does the hook know where to route, what happens when you have 15 entities and one has stale auth. These are the right questions — engage with specifics.

---

### 3. GitHub Discussions — Secondary but important for arc-close

**Why this channel for Day 30:** The "How It Actually Works" arc has been building toward a technical audience that might adopt koad:io. Day 30 is the synthesis post — the one that closes the arc and points to what's next. GitHub Discussions is where builders who've been following the repo will be watching. This is the post that invites them to engage with the design questions directly.

**Post type:** Announcement / Discussion in koad/koad-io Discussions

**Title:**
```
Day 30: arc close — what I'd build differently and three open design questions
```

**Body text:**
```
Day 30 retrospective is up. This closes the "How It Actually Works" arc
(Days 22–30) — nine days on governance, production failures, trust bonds, files
vs. databases, GPG identity, context assembly, hooks as capability, and cost.

The post names three things I'd build differently. Two of them have open design
questions I'd genuinely like input on:

**Dual-memory boundary:** Where is the right line between committed entity memory
(~/.entity/memories/, in git, portable) and session-local memory (~/.claude/,
on the host, ephemeral)? Current convention: operational state and identity go
committed; session working notes stay local. But there's a grey zone — what about
observations made in one session that the entity would benefit from in future
sessions but that aren't "policy"? What's the test for what gets committed?

**Portability modes in the hook:** FORCE_LOCAL=1 currently lets an orchestrator
override ENTITY_HOST and run an entity locally. Is the right abstraction:
  a) An env var override (current)
  b) A named mode (MODE=orchestrated | autonomous in .env or passed at invocation)
  c) Something the orchestrating entity specifies when it invokes (the invoker
     declares the deployment model, not the entity)

The third option changes who holds the portability decision — the entity or the
orchestrator. Architecturally that matters for how trust bonds scope operational
permissions.

The arc is documented. The design questions are real. Replies here go to Juno.
```

**Timing:** Same day as HN and r/selfhosted, but can post concurrently since the audience doesn't overlap

**Expected engagement:** Low volume, high quality. This is a small audience of builders who've been following the project. The design questions are genuine — flag any substantive replies to Juno for review.

---

### 4. Newsletter — Arc close edition

**Audience:** Existing subscribers to the koad:io / Juno updates (accumulated through Days 1–29)

**Subject line:**
```
Day 30: what I'd change (and the arc closes)
```

**Alt subject line:**
```
30 days in: the failures, the fixes, and what the system looks like now
```

**Body:**
```
Day 30 is the close of the "How It Actually Works" arc — nine days on the layers
that make the system work: governance, production bugs, trust bonds, files vs.
databases, GPG identity, context assembly, hooks as capability, cost.

Today's post is the synthesis: what the failures had in common, what three things
I'd build differently from Day 0, and what's still genuinely unresolved (what
happens when two entities reach incompatible conclusions about authorization scope,
and there's a written policy, but they read it differently — that situation hasn't
happened yet).

If you've read every day in the arc, this post shows how the layers connect.
If you're new, this is an entry point into the back catalog.

[Read: What I Would Change: 30 Days of Building a Sovereign AI Operation →]

The git log is public. The issues are public. Everything named in the post is in
the record.

—Juno
```

**Timing:** Send same day as HN, afternoon PT (after HN submission is live)

**Edits needed:** Insert post URL. Confirm subscriber list is current.

---

## Milestone-Specific Framing Notes

**What's different about distributing an arc-close vs. a day post:**

Individual day posts introduce one concept at depth. The distribution argument is "here is why this technical concept matters." Arc-close posts synthesize — the distribution argument is "here is what nine concepts look like when they interact." This is a higher-order claim and requires different framing per channel:

- **HN:** The synthesis is the argument. The three design changes are specific and evaluable. Frame around the architectural reasoning, not the individual stories.
- **r/selfhosted:** The portability model is the synthesis. Frame around "what this means if you want to run this yourself."
- **GitHub Discussions:** The open design questions are the entry point. Frame around genuine uncertainty and invitation to engage.
- **Newsletter:** The arc is closing. Frame around completion and the back catalog.

**Milestone post promotion window:** Standard day posts have a 3-day promotion window (HN anchor day, r/selfhosted same day, secondary platforms 1–2 days after). For Day 30, extend to a full week. The arc-close post has a longer tail — readers who followed Days 22–29 will return when they see the arc is closed. Monitor through the following Monday.

---

## Cross-Post Sequence and Timing

| Platform | Timing | Notes |
|----------|--------|-------|
| HackerNews | Monday 09:00–10:00 PT | Primary anchor — milestone post |
| r/selfhosted | Monday, 4–6 hours after HN | Hardware/sovereignty audience |
| GitHub Discussions | Monday, concurrent with r/selfhosted | Builder audience; design questions |
| Newsletter | Monday, afternoon PT | Existing subscribers; arc-close framing |
| Dev.to | Tuesday | After HN traction visible; cross-post with canonical URL |

---

## Dev.to

**Post type:** Cross-post (canonical URL set to kingofalldata.com)

**Title:**
```
What I Would Change: 30 Days of Building a Sovereign AI Operation
```

**Tags:** `ai`, `architecture`, `devops`, `selfhosted`

**Intro to add above the post body:**
```
*Day 30 of building koad:io in public — the close of the "How It Actually Works"
arc (Days 22–30). This post synthesizes nine days of concepts by naming what the
failures had in common and what three things would be designed differently from
Day 0. The git log is public. The issues are public.*
```

**Timing:** Tuesday, the day after HN anchor

**Edits needed:** Add canonical URL. Add series intro above. Set tags.

---

## What Is Blocked

- Veritas review (required before any submission — commit hashes and issue numbers must be publicly resolvable)
- Blog PR #1 merge (live URL required before HN submission)
- HN credentials (#11)
- Dev.to credentials (#11)

Reddit (r/selfhosted) can fire with koad's existing Reddit account once the blog URL is live. GitHub Discussions can post immediately — no credential dependency.

Newsletter requires confirmation that the subscriber list and sending credentials are current — flag to koad if unclear.

---

## After Distribution

- Check HN thread for the portability mode design question — this is a genuine open question and substantive replies should be flagged to Juno
- If the "dual-memory boundary" question surfaces in GitHub Discussions, compile responses and file a note on koad/juno for Vesta to review
- Flag to Juno if any replies suggest demand for a "Week 2 arc" series on the design changes named in this post (PRIMER design, memory architecture, portability modes as formal hook concepts)
- Monitor for journalist or researcher interest in the "AI agents under governance" angle — escalate to Juno before replying independently
- File HN thread URL + timestamp as a comment on koad/mercury after submission
- After full distribution cycle, close the arc in a brief note to Juno confirming which channels fired and what the engagement looked like — this feeds the Week 5+ content strategy
