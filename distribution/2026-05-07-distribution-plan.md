---
post: "What Happens Before the First Token"
source: ~/.faber/posts/2026-05-07-what-happens-before-the-first-token.md
date: 2026-05-07
status: PENDING — awaiting blog PR merge (koad/kingofalldata-dot-com#1)
prepared_by: Mercury
pillar: Reality
series: "Reality Pillar — How the Team Works"
day: 37
arc: "Day 37 — Hook Architecture / Invocation Path (arc continues from Day 36 trust bond)"
---

# Distribution Plan: "What Happens Before the First Token"

**Pre-distribution gate:** koad/kingofalldata-dot-com#1 blog PR must merge and URL must resolve before HN submission. All downstream channel timing is contingent on this gate.

**Why this post is the technical follow-on to Day 36:** Day 36 opened the trust bond files — the authorization records, human-readable, GPG-signed, on disk. Day 37 is the enforcement layer. The bond says what Juno is allowed to do; the hook is where that authorization is enforced before any execution occurs. The connection is explicit in the post: "the Day 36 bond at the bash level." The two posts are the same policy in two registers, and Day 37 is the register that actually runs.

**What makes Day 37 distributable that Day 36 was not:** Day 36 required explaining what a trust bond is and why the pre-gestation signing pattern is interesting. Day 37 requires no scaffolding — the hook is 131 lines of bash, and every line is doing something a systems programmer recognizes: env loading, machine routing, PRIMER injection, PID locking, base64 encoding, exec. The novelty is in the structure and the policy block, not the individual operations. A technical reader can skim the code and ask one question: "why is there a GPG signature embedded in comments?" That question is the angle.

**The three angles, ranked by sharpness:**

1. **The GPG-signed policy block in bash comments.** Juno's hook opens with a clearsigned policy block embedded in `#` comment lines. The verification command is a one-liner: `sed` strips the `# ` prefix, `gpg --verify` reads from stdin. No file extraction. The policy is verifiable in-place. Modifying the hook — expanding what Juno accepts, adding a non-interactive path, changing the harness — breaks the signature. The signature is not decoration; it is tamper detection on the entity's operational policy. This is the Day 31 signed code block pattern applied to the governance layer.

2. **The non-interactive rejection.** Juno's hook rejects PROMPT injection with `exit 1`. The full non-interactive path is five lines — three comments, one echo, one exit. No entity in the team can drive Juno programmatically. Mercury cannot. Sibyl cannot. The design decision is stated in the comment: "She acts when koad is at the keyboard or when she picks up a GitHub Issue — just like koad." Juno is a principal, not a worker. The hook is the enforcement of the `authorized-agent` bond type from Day 36 expressed as bash.

3. **The full invocation path as a 131-line artifact.** The entire authorization, routing, and context assembly for an AI agent invocation is one shell script. Environment load (entity wins over framework), machine check (FORCE_LOCAL bypass), PRIMER injection (separator-delimited, call-site-specific), mode dispatch, PID lock (fail-fast, no retry), base64 encoding (Linux/macOS portability), exec. The hook handles the edge cases that a design doc would paper over: stale locks, SSH quoting failures, macOS base64 flag incompatibility, expired API routing. The post accounts for each one.

---

## Pre-Distribution Checklist

- [ ] Confirm blog PR koad/kingofalldata-dot-com#1 is merged and blog URL resolves before HN submission — **HARD GATE**
- [ ] Confirm `~/.juno/hooks/executed-without-arguments.sh` is committed to koad/juno and publicly accessible — the post quotes from the actual file
- [ ] Confirm the GPG-signed policy block in the hook is verifiable: run `sed -n '/^# -----BEGIN/,/^# -----END PGP SIGNATURE-----/p' ~/.juno/hooks/executed-without-arguments.sh | sed 's/^# \{0,1\}//' | gpg --verify`
- [ ] Confirm Juno's GPG fingerprint (`16EC 6C71 8A96 D344 48EC D39D 92EA 133C 44AA 74D8`) is the correct key — Day 36 comment thread may reference this; Day 37 relies on the same key
- [ ] Confirm `~/.koad-io/hooks/executed-without-arguments.sh` (framework default) is publicly accessible — post references both the entity override and the framework default
- [ ] Confirm `~/.juno/hooks/PRIMER.md` is committed — cited as the forward signal in the post's closing section
- [ ] Confirm Day 36 HN thread URL (if live) for arc-bridge follow-up comment
- [ ] koad approves distribution

---

## Platform Plans

### 1. HackerNews — PRIMARY CHANNEL

**Priority:** Highest. The signed policy block embedded in bash comments is the sharpest hook for a systems engineering audience — it is a technically novel pattern, falsifiable (clone the repo, run the verification command), and immediately comprehensible to anyone who has written a bash hook. The non-interactive rejection is the second hook: a deliberate five-line implementation of a governance decision.

**Submit as:** Link post

**Primary title:**
```
Show HN: Juno's bash hook is 131 lines — the full authorization, routing, and context assembly for an AI agent
```

**Alt title A:**
```
A GPG-signed policy block embedded in bash comments: tamper detection on an AI agent's operational policy
```

**Alt title B:**
```
The trust bond from yesterday expressed in bash: Juno's hook rejects non-interactive prompts with exit 1
```

**Alt title C:**
```
What happens before the first token: env load, machine routing, PRIMER injection, PID lock, exec — in one shell script
```

**HN title decision: Alt title A leads.** The signed policy block is the strongest technical hook and the most novel element — it is directly verifiable, connects to the Day 36 trust architecture, and will generate the most focused technical discussion. "Tamper detection on an AI agent's operational policy" states the operational effect clearly without requiring prior knowledge of the series. "Show HN" is warranted: the hook file is on GitHub, the verification command is in the post, and the claim (modification breaks the signature) is falsifiable by anyone with GPG.

**Why not the primary title:** "131 lines" is accurate but leads with scale rather than mechanism. The signed policy block is the mechanism that makes this distributable — an engineer who has written 131-line bash scripts will not click on scale alone, but will click on the novelty of GPG-verifiable policy embedded in comment lines.

**Why not Alt B:** Alt B requires Day 36 context. Alt A is self-contained.

**Why not Alt C:** Alt C describes the post well but the "full invocation path" framing positions it as documentation rather than as a novel technical artifact. The signed block is the artifact.

**Submission URL:** Link to published blog post on kingofalldata.com

**Submission comment (paste in the HN text field):**
```
Day 37 of building koad:io in public. The hook for Juno (the AI orchestrator entity in
the koad:io team) lives at ~/.juno/hooks/executed-without-arguments.sh. It is 131 lines.

What it does: full invocation path for an AI agent session — environment load, machine
routing, PRIMER injection, PID lock, mode dispatch, base64 encoding for remote calls,
and exec. The framework default hook (shared by Sibyl, Mercury, Faber) is ~100 lines
and handles the same path. Juno's hook overrides one part: it rejects non-interactive
invocations entirely.

The hook opens with a GPG-signed policy block embedded in bash comment lines:

  # -----BEGIN PGP SIGNED MESSAGE-----
  # Hash: SHA512
  #
  # entity: juno
  # policy:
  #   non-interactive: rejected — Juno cannot be remote-triggered via PROMPT
  #   notification: GitHub Issues only
  #
  # rationale:
  #   No entity may drive Juno via prompt injection. She acts when koad is at
  #   the keyboard or when she picks up a GitHub Issue — just like koad himself.
  # -----BEGIN PGP SIGNATURE-----
  # ...
  # -----END PGP SIGNATURE-----

Verification is in-place:

  sed -n '/^# -----BEGIN/,/^# -----END PGP SIGNATURE-----/p' \
    ~/.juno/hooks/executed-without-arguments.sh \
    | sed 's/^# \{0,1\}//' | gpg --verify

No file extraction needed. The sed strips the '# ' prefix, gpg reads from stdin.

The consequence: modifying the hook breaks the signature. Expanding what Juno accepts,
adding a non-interactive path, changing the harness — all of these fail gpg --verify.
The signature is tamper detection on the entity's operational policy. It is not
documentation; it is a verifiable claim.

The non-interactive rejection path is five lines:

  echo "juno: remote prompt rejected. File a GitHub issue to notify Juno." >&2
  exit 1

No entity in the koad:io team can orchestrate Juno via PROMPT. Mercury cannot. Sibyl
cannot. Vulcan cannot. They file Issues. This is the operational implication of Juno's
trust bond type — authorized-agent, not authorized-builder. The bond (Day 36) established
the relationship; the hook enforces it at runtime.

The rest of the post walks the full framework invocation path:

- Environment load: entity .env loads second, takes precedence over framework defaults.
  Harness (claude vs. opencode) is decided here, not in a conditional.
- Machine routing: ENTITY_HOST check, SSH dispatch, FORCE_LOCAL=1 bypass. The bypass
  fixed the Chiron routing error when fourty4's API auth expired.
- PRIMER injection: if PROMPT is set and PRIMER.md exists in the calling directory,
  the hook prepends it with a --- separator. The entity gets ecosystem context before
  the task. No entity-specific config required.
- PID lock: fail-fast, no retry. Live PID holds the lock → exit 1. Cleaned on EXIT.
- Base64 encoding for remote dispatch: -w0 for Linux, fallback for macOS. Quotes and
  newlines in the prompt don't break SSH quoting. Decoded on the receiving side.

The hook file is in the public koad/juno repo. The GPG signing key fingerprint is
16EC 6C71 8A96 D344 48EC D39D 92EA 133C 44AA 74D8 — the same key used to sign the
trust bonds in Day 36.

Happy to discuss the signed-block-in-comments pattern, the PRIMER injection design,
or the decision to put governance policy in bash rather than a config file.
```

**Timing:** Wednesday, 09:00–10:00 PT. Day 36 anchors on Tuesday; Day 37 follows Wednesday with the enforcement layer. Wednesday morning PT avoids competing with Day 36 if it is still generating engagement. If Day 36 HN thread is active Tuesday evening, add a bridge comment before Wednesday submission.

**Expected engagement:**

- "GPG in bash comments is a clever hack — but it is not enforced. Nothing checks the signature at runtime." — Response: correct, and the post is explicit about this. The signed block is tamper detection, not runtime enforcement. The hook runs whether or not the signature is valid; the signature makes unauthorized modification detectable after the fact. The powerbox (Days 28–31) is the runtime enforcement layer. The hook is the policy record; the powerbox verifies it before execution. The combination is the enforcement architecture — two separate layers, each doing one thing.

- "Why not put the policy in a config file instead of bash comments?" — Response: the hook is the policy. The operational behavior (reject non-interactive, use claude, --dangerously-skip-permissions) is expressed in code. Putting the same policy in a separate config file creates a divergence risk — the config says one thing, the code does another. Embedding the signed policy in the file that implements it means there is one artifact to verify. The signature binds the policy statement to the implementation.

- "The PRIMER injection looks like it could cause problems if PRIMER.md is large." — Response: yes, the current design does not set a size limit. The post notes the injection fires on `[ -n "$PROMPT" ] && [ -f "..." ]` — non-interactive only. Interactive sessions do not get PRIMER injected by the framework default (Juno's hook differs on this). In practice, PRIMERs in the ecosystem are 2–8kb. A size guard is a reasonable future addition; the post does not claim the implementation is final.

- "What is the difference between the framework default hook and Juno's override?" — Response: one difference: Juno's hook rejects the non-interactive path entirely. Framework default acquires a PID lock, runs `claude -p`, extracts the result. Juno's hook reaches the non-interactive branch and exits 1. Everything else — env load, machine routing, PRIMER injection, interactive exec — is structurally the same. The override is targeted at the governance boundary, not the operational plumbing.

- "The base64 portability note is interesting — what else does the hook handle for cross-platform compatibility?" — Response: two things explicitly: base64 -w0 (Linux) vs. base64 without -w0 (macOS), and the SSH command construction uses `printf '%s'` rather than `echo` to avoid interpretation of escape sequences in the prompt. The FORCE_LOCAL=1 bypass is also cross-platform in effect — it sidesteps the machine check entirely so the hook runs on whatever machine has `claude` available, which matters on mixed-platform teams.

---

### 2. r/selfhosted

**Subreddit:** r/selfhosted (200k members)

**Status:** BLOCKED on koad (#57) — koad must authorize account access before submission

**Title:**
```
AI agent invocation in one shell script: env, routing, context injection, PID lock, exec — and a GPG policy block in comments
```

**Alt title:**
```
The hook that runs before every AI agent session: 131 lines, one GPG-signed policy, one exit 1 for unauthorized orchestration
```

**Post type:** Link post → published blog URL. Flair: "Project" or "Discussion"

**Framing note:** r/selfhosted readers care about auditability, no-SaaS-dependency, and standard tooling. The hook is exactly this: bash, GPG, ssh, base64, and a Python one-liner for JSON extraction. No service calls. The GPG policy block is verifiable with standard GPG tooling. The FORCE_LOCAL=1 bypass is the kind of escape hatch that selfhosted operators understand immediately — "what happens when the remote machine is down?" has an answer, and the answer is an env variable, not a service config change. The non-interactive rejection will resonate with readers who have thought about what "autonomous but not remotely controllable" means in practice.

**Body text:**
```
The koad:io entity hook handles the full invocation path for an AI agent session:

1. Env load: entity config takes precedence over framework defaults (harness selection lives here)
2. Machine check: SSH dispatch if ENTITY_HOST doesn't match hostname; FORCE_LOCAL=1 bypasses
3. PRIMER injection: prepend ~/.../PRIMER.md to the prompt if present in the calling directory
4. PID lock: fail-fast if entity is busy (no queuing, no retry — exit 1)
5. Mode dispatch: interactive → exec claude .; non-interactive → claude -p + JSON extraction
6. Base64 for remote calls: handles Linux/macOS base64 flag incompatibility

The framework default hook is ~100 lines and runs for Sibyl, Mercury, Faber, and other
worker entities. Juno has an override that adds one thing: a GPG-signed policy block
embedded in bash comment lines.

The policy block states that Juno cannot be remote-triggered via PROMPT. The non-interactive
path in her hook is five lines: echo + exit 1. No entity can orchestrate Juno by
constructing a PROMPT and passing it to her hook. She picks up GitHub Issues.

The GPG block is verifiable in-place — one sed + gpg command, no file extraction.
Modifying the hook breaks the signature. The policy is tamper-detectable.

No broker. No service. Standard tooling: bash, GPG, SSH, base64, Python one-liner.
The repo is public. [link]
```

**Timing:** Wednesday, 4–6 hours after HN submission

**Expected engagement:** Strong interest in the FORCE_LOCAL=1 bypass (self-hosters recognize the pattern — remote is not always available), the PID lock design (fail-fast is a preference in the self-hosted community — they want to know when something is busy, not silently queue), and the GPG-in-comments verification. Questions about the base64 portability handling and the Python JSON extraction are likely.

---

### 3. GitHub Discussions

**Post type:** Announcement / Discussion in koad/koad-io Discussions

**Status:** BLOCKED on koad (#60) — koad must authorize account access before submission

**Title:**
```
Day 37: the invocation hook — 131 lines, GPG policy block, and the enforcement side of the Day 36 trust bond
```

**Body text:**
```
Day 37 is up. It walks the full invocation path from `sibyl` keystroke to first
response — environment load, FORCE_LOCAL bypass, PRIMER injection, mode dispatch,
PID lock, base64 encoding.

The post closes the loop on Day 36: the trust bond establishes Juno as authorized-agent;
the hook enforces the operational implication. The non-interactive rejection is five
lines. The GPG-signed policy block in the hook's comment header is verifiable in-place.

Three design questions worth discussing:

**The signed-block-in-comments pattern.** The policy block is embedded in the hook
file itself — not a separate config, not a sidecar document. The signature binds the
policy statement to the implementation: if you modify the hook to add a non-interactive
path, the signature breaks. This is tamper detection without runtime enforcement.

Is embedding the policy in the implementation file the right pattern, or does it
create a maintenance burden when the implementation legitimately needs to change?
The current design requires regenerating the signature on any change to the hook,
including non-policy changes. Is that the right coupling?

**The PRIMER injection guard condition.** The framework default fires PRIMER injection
only when `$PROMPT` is set — non-interactive sessions only. Juno's hook injects PRIMER
regardless of mode. The asymmetry is intentional (Juno is an orchestrator; she benefits
from context in interactive sessions), but it means the framework default and the
entity override diverge on a common-path behavior.

Is this the right place to put the PRIMER injection logic, or should PRIMER be loaded
by the harness rather than the hook? The hook-level injection means PRIMERs work
across all harnesses (claude, opencode, future). Moving it to the harness would allow
harness-specific PRIMER handling but lose portability.

**PID lock fail-fast vs. queue.** The PID lock exits immediately if the entity is busy.
No queuing. No retry signaling to the caller. The caller gets `exit 1` and decides.

Is fail-fast the right default for all entity types, or should orchestrator entities
(Juno) fail-fast while worker entities (Sibyl, Mercury) support a bounded queue?
The current design treats all entities the same. The distinction may matter at scale.

The hook files are in koad/juno and koad/koad-io (public). Replies here go to Juno.
```

**Timing:** Wednesday, concurrent with r/selfhosted

**Expected engagement:** Low volume, high quality. The signed-block coupling question and the PRIMER injection placement question are open design problems — engineers building agent infrastructure will have opinions. The fail-fast vs. queue question will generate experience-based responses from anyone who has built task dispatch systems.

---

### 4. Newsletter

**Audience:** Existing subscribers accumulated through Days 1–37

**Subject line:**
```
Day 37: 131 lines of bash — the entire invocation path for an AI agent, and a GPG policy block that breaks if you touch it
```

**Alt subject line:**
```
"She acts when koad is at the keyboard." — Day 37 shows the hook that enforces Juno's trust bond
```

**Body:**

```
Someone types `sibyl` with no arguments.

Nothing visible happens for a fraction of a second. Then a response begins.

Day 37 walks that fraction of a second: the koad:io hook that runs before the first
token. Environment load. Machine routing. PRIMER injection. PID lock. Mode dispatch.
Base64 encoding for remote calls. Exec.

The framework hook is ~100 lines and handles all of that for Sibyl, Mercury, Faber,
and the other worker entities. Juno has an override.

Juno's hook opens with a GPG-signed policy block embedded in bash comment lines. The
block states the policy: no non-interactive invocations. No PROMPT injection from
other entities. She acts when koad is at the keyboard or when she picks up a GitHub
Issue. Just like koad.

The verification command is one line. The signature is in the file. You don't need to
extract anything.

If you modify the hook — add a non-interactive path, change the harness, expand what
she accepts — the signature breaks. That is the point. The policy is tamper-detectable.

The non-interactive path in her hook is five lines:

  echo "juno: remote prompt rejected. File a GitHub issue to notify Juno." >&2
  exit 1

This is the Day 36 trust bond expressed as bash. The bond says koad authorized Juno
as an agent, not a worker. The hook enforces it.

[Read Day 37: What Happens Before the First Token →]

—Mercury
```

**Timing:** Wednesday, afternoon PT — after HN submission is live and initial engagement is visible

**Edits needed:** Insert published blog post URL. Confirm subscriber list is current.

**Note:** Day 36 opened the trust architecture arc with the bond files. Day 37 closes the enforcement loop. Newsletter framing should signal this: "the bond is the record, the hook is the enforcement." Subscribers who engaged with Day 36 on the authorization semantics will want to see how the policy actually runs. Day 37 answers that.

---

### 5. Dev.to

**Post type:** Cross-post (canonical URL set to kingofalldata.com)

**Title:**
```
What Happens Before the First Token: AI Agent Invocation, GPG Policy Blocks, and 131 Lines of Bash
```

**Tags:** `ai`, `bash`, `security`, `multiagent`

**Intro to add above the post body:**
```
*Day 37 of building koad:io in public — the enforcement layer for the Day 36 trust architecture.*
*Day 36 walked the trust bond files: six files, three relationship types, GPG-signed,*
*on disk. Day 37 is what runs. The bond establishes that Juno is an authorized-agent,*
*not a worker. The hook enforces it: non-interactive PROMPT injection rejected, exit 1.*
*The full invocation path — environment, routing, context, lock, dispatch, encoding — in*
*one shell script, with a GPG policy block that breaks if you touch it.*
```

**Timing:** Thursday, the day after HN anchor

**Edits needed:** Add canonical URL. Add series intro above. Set tags. Add links to Day 36 and Day 31 Dev.to cross-posts if available (Day 31 introduced the signed code block pattern; Day 37 applies it to the hook governance layer).

---

### 6. Day 36 Thread Follow-Up

**If Day 36 HN thread is live:** Add a reply:
```
Day 37 is up — it is the enforcement side of the trust bond architecture.

The hook that runs before Juno accepts any invocation opens with a GPG-signed policy
block embedded in bash comment lines. The block states the policy: no non-interactive
invocations, no PROMPT injection from other entities. The signature is verifiable in-place.
Modifying the hook breaks it.

The non-interactive rejection is five lines: echo + exit 1. That is the entire path for
any entity (Mercury, Sibyl, Vulcan) that tries to orchestrate Juno via PROMPT.

The post also walks the full framework invocation path for worker entities: env load,
machine routing, PRIMER injection, PID lock, base64 for remote dispatch. 131 lines
total for the orchestrator; ~100 for the framework default. [link]
```

**Timing:** Wednesday morning, before HN submission for Day 37 — bridge the arc for any reader following the thread.

---

## Timing Sequence

| Platform | Timing | Notes |
|----------|--------|-------|
| Day 36 thread reply | Wednesday morning, before Day 37 HN | Arc-bridge: enforcement layer follows trust bond files |
| HackerNews | Wednesday 09:00–10:00 PT | Primary anchor — GPG-signed policy block in bash comments; falsifiable claim |
| r/selfhosted | Wednesday, 4–6 hours after HN | BLOCKED (#57) — FORCE_LOCAL, PID lock, no-broker framing leads |
| GitHub Discussions | Wednesday, concurrent with r/selfhosted | BLOCKED (#60) — signed-block coupling and PRIMER placement as entry points |
| Newsletter | Wednesday, afternoon PT | Bond-to-enforcement arc framing; GPG tamper detection as hook |
| Dev.to | Thursday | After HN traction visible; cross-post with canonical URL |

---

## What Is Blocked

- Blog PR koad/kingofalldata-dot-com#1 — **HARD GATE**: live URL required before HN submission. All other channel timings are downstream of this.
- r/selfhosted: blocked on koad (#57) — account access required
- GitHub Discussions: blocked on koad (#60) — account access required
- HN credentials (#11) — required for HN submission
- Dev.to credentials (#11) — required for cross-post

Newsletter can send once the blog URL is live and subscriber credentials are confirmed.

---

## After Distribution

- Check HN thread for the "GPG in comments is not enforced at runtime" objection — response is prepared above; the two-layer model (policy record in hook, runtime enforcement in powerbox) is the answer; flag if the discussion reveals a gap in how the layers are described in the post
- If the signed-block-in-comments pattern generates requests for a standalone design note (how to embed verifiable policy in implementation files), flag to Juno — this may warrant a Vesta spec
- If the PRIMER injection placement question (hook vs. harness) generates substantive discussion, flag to Faber — the design decision is documented but not formally specced; strong community opinion may warrant a Vesta issue
- If the fail-fast vs. queue question generates concrete proposals for bounded queueing semantics, flag to Vulcan — any change to the PID lock design would go through koad/vulcan
- Monitor for interest in the base64 portability and cross-platform hook design as a standalone topic — if engagement suggests readers want a cross-platform hook reference, flag to Faber
- File HN thread URL + timestamp as a comment on koad/mercury after submission
- After full distribution cycle, file a brief note to Juno confirming which channels fired and engagement — feeds arc pacing for the hook architecture series
- The Day 36 to Day 37 arc (bond files → hook enforcement) is the first full two-post arc in the trust architecture series. If engagement across both posts is strong, flag to Juno for a summary post or series index entry — this arc is a standalone unit that could be referenced independently of the day numbering
