---
post: "The Hook Is the Training"
source: ~/.faber/posts/2026-04-28-hook-is-training.md
date: 2026-04-28
status: PENDING — awaiting Iris revision + blog PR merge (koad/kingofalldata-dot-com#1)
prepared_by: Mercury
pillar: Reality
series: "Reality Pillar"
day: 28
veritas_review: approved-with-notes (2026-04-05, non-blocking only)
iris_review: NEEDS_REVISION (2026-04-05, one required fix at line 98)
---

# Distribution Plan: "The Hook Is the Training"

**Veritas status: APPROVED-WITH-NOTES** — no blocking corrections required. Notes: passenger.json "partially deployed" wording could be tightened to "not yet deployed," GPG signature truncation not declared explicitly, "The hook IS the training" ML-sense qualification noted (adequate). None require revision before publication.

**Iris status: NEEDS_REVISION** — one required fix before publication. At line 98, add one sentence explicitly excluding gradient-descent meaning at the point of claim: "The hook IS the training — not in the gradient descent sense, but in the operational sense: it is the accumulated behavioral specification that makes each invocation consistent." Without this fix, the title claim is defensible but requires two paragraphs to earn. With it, the title is airtight. Two additional minor flags (line 175, line 195) are non-blocking. Faber must apply the required fix before this post distributes.

**Do not submit to any platform until Iris's required fix is applied and confirmed.**

**Why this piece distributes well:** The commands/hooks direction distinction — "commands/ is for the operator to reach in; hooks/ is for the operation to call out" — is a clean architectural concept with no equivalent in documented multi-agent frameworks. The GPG-verified governance-in-bash-comment is a show-your-work moment: you can copy-paste the verification command and confirm the policy is cryptographically signed. The Week 4 synthesis in the closing section (trust bond → GPG key → PRIMER → hook) gives the whole series structure that readers who have followed all four days will find satisfying.

---

## Pre-Distribution Checklist

- [ ] **Iris required fix applied by Faber** — add gradient-descent exclusion sentence at line 98 before any distribution
- [ ] Blog PR #1 merge — live URL required before HN submission
- [x] Veritas review complete — approved-with-notes, no blocking corrections
- [ ] Confirm Day 27 post is live (post footer links to it)
- [ ] Confirm Juno's hook file at `~/.juno/hooks/executed-without-arguments.sh` has not changed since Veritas review (lines 70–74 for rejection path, lines 13–30 for GPG policy block)
- [ ] Verify GPG verification command at lines 9–11 of hook file still produces a valid signature
- [ ] koad approves distribution

---

## Platform Plans

### 1. HackerNews

**Primary channel.** The governance-encoded-in-bash-comment angle is the most distinctive claim: a copy-pasteable GPG verification command for an AI entity's capability policy. This is concrete, unusual, and directly demonstrable. The commands/hooks direction distinction provides a clean conceptual frame that engineers can evaluate on first principles.

**Submit as:** Link post

**Primary title:**
```
The hook file is the entity: how AI agent capability lives on the filesystem, not in platform config
```

**Alt title:**
```
AI agent governance in a bash comment: GPG-signed capability policies, verifiable without running the script
```

**Why this title:** The primary title makes the architectural claim in terms engineers can immediately evaluate — "capability on filesystem vs. platform config" is a concrete distinction with practical implications. The alt title leads with the most unusual implementation detail (governance in a bash comment, GPG-verifiable) which will generate curiosity from the security and systems engineering segments. Use the primary if the alt reads as gimmicky; use the alt if the primary reads as too abstract on a given week.

**Note on "The Hook Is the Training" as HN title:** The post's own title is accurate but risks the ML-training conflation that Iris's required fix is specifically addressing. Do not use it as the HN submission title until Iris confirms the fix cleanly resolves the conflation for the HN audience. The distribution title above avoids the ambiguity entirely.

**Submission URL:** link to published blog post on kingofalldata.com

**Submission comment (paste in the HN text field):**
```
Day 28 of building koad:io in public — 15+ AI entities running as sovereign
git repos, each with its own commands/, hooks/, PRIMER.md, and GPG-signed
identity.

The architectural claim this post makes: if you want to understand a koad:io
entity, don't read its README. Read its hooks. The hooks directory is the
entity's identity said in verbs.

The distinction that makes this concrete:

  commands/  ← operator reaches in (shortcut invocation, user-facing)
  hooks/     ← system calls out (event dispatch, daemon-triggered)

commands/ is what the entity can be asked to do. hooks/ is what the entity
IS — the capabilities the operation fires when the condition is met, each
encoded with the analytical framework, output format, source quality criteria,
and scope constraints that make each invocation produce entity-specific rather
than generic output.

In LangChain, OpenAI function calling, and AutoGen: tool definitions live in
application code, passed at runtime, not committed as part of the entity's
identity. There's no equivalent to enumerating the hooks directory and thereby
enumerating the entity. That's absence of evidence, not categorical novelty
claim — but it's a real absence.

The governance section is the most concrete part. Juno's hook explicitly
rejects non-interactive invocation with exit 1 — "Juno cannot be remote-
triggered via PROMPT. File a GitHub issue." This is a governance decision
made executable. The policy is GPG-signed in a bash comment:

  # -----BEGIN PGP SIGNED MESSAGE-----
  # ...
  # policy:
  #   non-interactive: rejected
  #   notification: GitHub Issues only
  # rationale:
  #   No entity may drive Juno via prompt injection.
  # -----BEGIN PGP SIGNATURE-----

Verifiable without running the script:

  sed -n '/^# -----BEGIN/,/^# -----END PGP SIGNATURE-----/p' \
    ~/.juno/hooks/executed-without-arguments.sh \
    | sed 's/^# \{0,1\}//' | gpg --verify

The hook is the governance document. The trust bond specifies the
authorization. The signature makes the attribution cryptographic. Changing
the policy requires the entity's key.

This is the final post in the Week 4 architecture arc: trust bond (Day 24),
GPG key (Day 26), PRIMER for context assembly (Day 27), hook for capability
enforcement (Day 28).

Happy to discuss the commands/hooks distinction, the governance-in-bash-
comment pattern, or where the hooks-as-identity model breaks down.
```

**Timing:** Monday, 09:00–10:00 PT, the week of publication. Day 28 should post the Monday after Day 27 runs, so the Week 4 arc reads coherently for HN readers who follow the series.

**Expected engagement:** Moderate-to-high. The GPG-in-bash-comment detail will generate the most thread activity — it's unusual and immediately testable. Expect: "just use environment variables / a config file for this" (the hook encodes *behavioral specification*, not just configuration — the distinction is between what the agent *does* consistently versus what parameters it starts with), "this is just a system prompt by another name" (addressed in Day 27 as well — the architectural point is where and by whom the specification is authored and versioned), "GPG adds operational overhead for no real gain" (the Day 26 post addresses this; point readers there), and "AutoGen does have identity persistence" (engage constructively — the specific claim is about hooks-as-entity-identity committed to disk, not persona configuration generally).

**Primary objection to prepare for:** "The hook IS the training — this is just prompt engineering." Response: The post explicitly qualifies the use of "training": not in the gradient-descent sense, but in the operational sense — accumulated behavioral specification. The hook file contains the analytical framework, quality criteria, output format, and scope constraints developed through the entity's operational history. That it's expressed as a bash script and markdown rather than fine-tuning data is the point, not the limitation. The entity's "training" is on your filesystem, under your keys, version-controlled in git.

**Secondary objection:** "The GPG-signed policy block in a bash comment is security theater — any developer can modify the file." Response: Correct — the GPG signature is not a runtime enforcement mechanism, it's an attribution mechanism. Changing the policy block invalidates the signature, making unauthorized changes detectable. The enforcement happens at the invocation layer (the hook rejects the call at runtime). The signature provides cryptographic attribution to the entity's key, not access control to the file itself.

**Third objection:** "passengers.json skills array isn't deployed — you're describing a design, not a system." Response: The post says this explicitly: "this pattern is the architectural direction, not yet universally deployed." The commands/hooks distinction, the governance-in-hook, and the GPG verification command are all from live production files verified by Veritas. The skills array in passenger.json is design direction, stated as such.

---

### 2. r/selfhosted

**Subreddit:** r/selfhosted (200k members)

**Title:**
```
AI agent governance as a GPG-signed bash comment: verifiable capability policy without running the script
```

**Alt title:**
```
How commands/ and hooks/ structure an AI entity: the direction of invocation is the meaningful distinction
```

**Post type:** Link post → published blog URL. Flair: "Project" or "Discussion"

**Status: BLOCKED on koad (#57)**

Reddit distribution is blocked until koad resolves the platform credentials issue. Plan staged and ready to fire once unblocked.

**Body text (staged):**
```
Day 28 of building koad:io in public — 15+ AI entities as sovereign git repos.

Every koad:io entity directory has two subdirectories that matter for this post:

  commands/  ← operator reaches in (you invoke these)
  hooks/     ← system calls out (event dispatch fires these)

The direction of invocation is the architectural distinction. commands/ is
what you can ask the entity to do. hooks/ is what the entity IS — the
capabilities the operation fires when the condition is met.

The r/selfhosted angle: hooks encode governance decisions at runtime.

Juno's hook rejects non-interactive invocation entirely:

  echo "juno: remote prompt rejected. File a GitHub issue to notify Juno." >&2
  exit 1

This isn't a technical limitation. It's a governance decision: Juno cannot
be driven by peer entities via PROMPT injection. The policy is GPG-signed
in a bash comment at the top of the hook file, verifiable without running
the script:

  sed -n '/^# -----BEGIN/,/^# -----END PGP SIGNATURE-----/p' \
    ~/.juno/hooks/executed-without-arguments.sh \
    | sed 's/^# \{0,1\}//' | gpg --verify

If you change the policy block, the signature fails. Changing the governance
constraint requires the entity's key.

Every hook in the hooks/ directory is version-controlled in git. The entity's
capability set is enumerable by reading the directory. The policy is on your
disk. The signature is verifiable. No vendor holds the definition of what
your entity can do.

Full post with the commands/hooks architecture and the Week 4 arc synthesis:
[link]
```

**Timing:** Same day as HN, 4–6 hours after HN submission. Hold until #57 resolved.

---

### 3. GitHub Discussions

**Platform:** GitHub Discussions on koad/koad-io or koad/juno

**Title:**
```
Pattern: hooks/ as entity identity — capability specification committed to disk, GPG-signed policy
```

**Status: BLOCKED on koad (#60)**

GitHub Discussions access requires koad to configure repository settings. Plan staged and ready.

**Body text (staged):**
```
Documenting the commands/hooks architecture pattern for the community reference.

**The distinction:**

- `commands/` — operator reaches in. Discovery surface. User invokes.
- `hooks/` — system calls out. Event surface. Daemon dispatches.

**Why hooks/ enumerates the entity:**

The hooks directory is the entity's behavioral specification committed to
disk. Each hook contains: the analytical framework for that capability,
quality criteria, output format that downstream entities expect, scope
constraints, and learned failure modes. Enumerate the hooks, enumerate
what the entity IS.

**Governance in hooks — production example:**

Juno's `hooks/executed-without-arguments.sh` rejects non-interactive
invocation at the entry point:

```bash
echo "juno: remote prompt rejected. File a GitHub issue to notify Juno." >&2
exit 1
```

The policy governing this behavior is GPG-signed in a bash comment at the
top of the file. Verify with:

```bash
sed -n '/^# -----BEGIN/,/^# -----END PGP SIGNATURE-----/p' \
  ~/.juno/hooks/executed-without-arguments.sh \
  | sed 's/^# \{0,1\}//' | gpg --verify
```

**The shape is recursive:**

| Layer | Operator-facing | System-triggered |
|-------|----------------|------------------|
| Entity | `commands/` | `hooks/` |
| Daemon | Worker UI / manual triggers | Worker event handlers |
| Stream PWA | Buttons, filter controls | Entity event subscriptions |

Same architectural distinction at every layer.

Full post: [link]

Questions welcome on hook file structure, GPG policy signing workflow, and
the passenger.json skills array design direction.
```

**Timing:** 1–2 days after HN submission, once blog URL is confirmed live. Hold until #60 resolved.

---

## Newsletter Blurb

**For the koad:io newsletter / Faber's weekly summary email:**

```
Day 28: The Hook Is the Training

Two directories at the root of every koad:io entity: commands/ and hooks/.
The direction of invocation is everything. commands/ is for the operator
to reach in. hooks/ is for the system to call out.

The production example: Juno's hook rejects non-interactive invocation
entirely — exit 1, file a GitHub issue. The policy governing that behavior
is GPG-signed in a bash comment, verifiable without running the script.
Changing it requires Juno's key.

The architectural claim: enumerate the hooks and you've enumerated the
entity. The hooks directory is the entity's identity said in verbs.

This closes the Week 4 arc: trust bond (Day 24), GPG key (Day 26), PRIMER
for identity assembly (Day 27), hook for capability enforcement (Day 28).

→ Read: [link]
```

---

## Dev.to Cross-Post

**Post type:** Cross-post (canonical URL set to kingofalldata.com)

**Title:**
```
The Hook Is the Entity: AI Agent Capability on the Filesystem
```

**Tags:** `ai`, `unix`, `architecture`, `security`

**Intro to add above the post body:**
```
*Day 28 of building koad:io in public — 15+ AI entities running as git repos
on a $200 refurbished laptop. This is the capability architecture post: how
the hooks/ directory encodes what an AI entity IS, with a production example
of governance enforced in a GPG-signed bash comment.*
```

**Instructions:**
1. Create new post on Dev.to
2. Set canonical URL to the live kingofalldata.com blog URL for this post
3. Paste intro above the post body
4. Apply tags: `ai`, `unix`, `architecture`, `security`
5. Set series: "Reality Pillar"
6. Do not post until Iris's required fix is confirmed applied and blog URL is live
7. Timing: same day as HN, 14:00 PT
8. Use the Dev.to title above, not the post's original title — the "hook is the training" framing requires the gradient-descent exclusion sentence to land cleanly in a skimming context

**Edits needed:** Add canonical URL. Add series intro above. Set tags. Confirm Iris's required fix is in the published version.

---

## Cross-Post Sequence and Timing

| Platform | Timing | Notes |
|----------|--------|-------|
| HackerNews | Monday 09:00–10:00 PT | Primary anchor — the day after Day 27 distributes |
| r/selfhosted | Monday 4–6 hours after HN | Blocked on #57 |
| Dev.to | Monday 14:00 PT | After HN traction visible |
| GitHub Discussions | Tuesday or Wednesday | Blocked on #60 |

---

## What Is Blocked

- **Iris required fix (one sentence at line 98)** — distribution blocked until Faber applies and confirms
- Blog PR #1 merge — live URL required before any public submission
- HN credentials (#11)
- Dev.to credentials (#11)
- r/selfhosted (#57) — koad platform credentials
- GitHub Discussions (#60) — repository settings

---

## Coordination Note: Days 27 and 28 as a Pair

These two posts form the concluding pair of the Week 4 architecture arc. They should distribute on consecutive Mondays, not the same day. Day 27 (PRIMER pattern) establishes what happens before the model starts. Day 28 (hook is the training) establishes what happens once it begins. HN readers who engage with Day 27 are the primary audience for Day 28 — submit Day 28 the following Monday so the Week 4 arc reads as a deliberate sequence rather than a content flood.

If Day 27 generates a strong HN thread, reference the thread URL in the Day 28 submission comment ("Following up on the Day 27 PRIMER discussion from last Monday"). The Week 4 synthesis in Day 28's closing section — "trust bond → GPG key → PRIMER → hook" — gives returning readers a satisfying resolution.

---

## After Distribution

- The GPG-in-bash-comment detail is the most unusual implementation in the Week 4 series — monitor for pickup in security and developer tooling communities beyond the primary submission channels
- The "commands/ vs hooks/" distinction may generate architecture discussion — flag to Juno if enterprise teams are asking about adapting the pattern for their own agent deployments
- The Week 4 synthesis closing ("four pieces of a sovereign entity") is a quotable summary of the entire arc — monitor for citation in adjacent discussions and flag pickup to Faber for the Week 5 recap post
- File HN thread URL + timestamp as a comment on koad/mercury after submission
