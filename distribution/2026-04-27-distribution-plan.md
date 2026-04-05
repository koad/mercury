---
post: "The PRIMER Pattern: Why Every AI Session Starts Cold"
source: ~/.faber/posts/2026-04-27-primer-pattern.md
date: 2026-04-27
status: PENDING — awaiting blog PR merge (koad/kingofalldata-dot-com#1)
prepared_by: Mercury
pillar: Reality
series: "Reality Pillar"
day: 27
veritas_review: approved-with-notes (2026-04-05, non-blocking only)
iris_review: PASS (2026-04-05, one minor flag — non-blocking)
---

# Distribution Plan: "The PRIMER Pattern: Why Every AI Session Starts Cold"

**Veritas status: APPROVED-WITH-NOTES** — no blocking corrections required. Notes are cosmetic only (hook code verbatim option, "Bonn" omission, `$CWD` footnote). None require revision before publication.

**Iris status: PASS** — both prior revision flags resolved. One minor flag (line 87, self-congratulatory sentence) is non-blocking. Post is ready as written.

**Why this piece distributes well:** The `.bashrc` analogy is the hook — every Unix engineer has a muscle memory for what `.bashrc` does, and the PRIMER.md parallel clicks immediately. The five-line bash implementation ("it is the correct architectural level to be working at") inverts the usual "impressive code" format: the insight is that the solution is *this simple* once you've found the right layer. The ICM paper citation (arxiv:2603.16021, University of Edinburgh, three institutional deployments) gives the post academic credibility without academic dryness. The `$CWD` as entity selector argument — "same harness, different working directory, different entity" — is the novel claim that will generate the most substantive thread.

---

## Pre-Distribution Checklist

- [ ] Blog PR #1 merge — live URL required before HN submission
- [x] Veritas review complete — approved-with-notes, no blocking corrections
- [x] Iris review complete — PASS, post ready
- [ ] Confirm arxiv:2603.16021 resolves at submission time (arxiv papers are stable but confirm)
- [ ] Confirm Day 25 and Day 26 posts are live (post footer links to both)
- [ ] koad approves distribution
- [ ] Confirm hook file at `~/.koad-io/hooks/executed-without-arguments.sh` line numbers match post (Veritas confirmed lines 34–38 accurate at review time)

---

## Platform Plans

### 1. HackerNews

**Primary channel.** The `.bashrc` analogy, the working-directory-as-router mechanism, and the ICM paper citation will generate substantive engagement from the systems engineering and AI infrastructure segments.

**Submit as:** Link post

**Primary title:**
```
PRIMER.md is .bashrc for your agent: pre-invocation context assembly in 5 lines of bash
```

**Alt title:**
```
Why AI sessions start cold — and a shell pattern for assembling identity before the model starts
```

**Why this title:** The `.bashrc` parallel is the most distinctive technical claim in the post and it is immediately legible to Unix engineers. "5 lines of bash" signals that the solution is accessible and verifiable — not a framework, not a library. The alt title leads with the problem statement, which works if the primary reads as too prescriptive.

**Submission URL:** link to published blog post on kingofalldata.com

**Submission comment (paste in the HN text field):**
```
Day 27 of building koad:io in public — 15+ AI entities running as git repos
on a $200 refurbished laptop.

The structural problem this post addresses: every AI session starts cold.
When you type `claude .`, the model starts with its trained weights, the
harness system prompt, and whatever files the harness is configured to inject.
Nothing else. No session-to-session memory. The model doesn't know it's
supposed to be Juno, or Sibyl, or Vulcan — it's a generic assistant in the
right directory.

For a chatbot this is mildly annoying. For a deployed agent with specific
roles, authorizations, and ongoing work, it's a structural problem. The
failure mode isn't hallucination — it's generic competence instead of
specialized identity. The entity produces correct output. It just isn't the
entity you deployed.

The koad:io solution is five lines of bash in the invocation hook:

  if [ -n "$PROMPT" ] && [ -f "${CALL_DIR}/PRIMER.md" ]; then
    PROJECT_PRIMER="$(cat "$CALL_DIR/PRIMER.md")"
    PROMPT="$(printf 'Project context (from %s/PRIMER.md):\n%s\n\n---\n\n%s' \
      "$CALL_DIR" "$PROJECT_PRIMER" "$PROMPT")"
  fi

The shell reads PRIMER.md before the model is invoked. The model starts with
identity already in context, not as a task to acquire. The mental model: this
is process initialization, not document retrieval. .bashrc is read before the
user can interact; PRIMER.md is read before the model starts. Same Unix
pattern, different layer.

The operationally significant property — the one I haven't found in ICM,
LangChain, AutoGPT, or OpenAI Assistants docs — is that working directory
acts as entity selector:

  cd ~/.sibyl/    → PRIMER.md describes Sibyl (research analyst)
  cd ~/.juno/     → PRIMER.md describes Juno (business orchestrator)
  cd ~/.vulcan/   → PRIMER.md describes Vulcan (builder)

Same harness binary, same model, same operator. Different $CWD = different
entity. No network call, no central registry, no vendor. I'm stating this
carefully: we have not found this routing mechanism documented in prior work.
That is absence of evidence, not categorical novelty claim.

The post also covers the ICM paper (Van Clief and McDermott, arxiv:2603.16021)
which arrived at the same filesystem-first, markdown-native philosophy from
a different direction. Where they diverge: ICM's agent learns where it is by
reading CONTEXT.md during execution; koad:io's agent starts with who it is
already loaded. Different layer, different problem.

Happy to discuss the cold-start architecture, the $CWD routing claim, or
where this breaks down at scale.
```

**Timing:** Monday, 09:00–10:00 PT, the week of publication

**Expected engagement:** Strong with the systems engineering and AI infrastructure communities. The `.bashrc` analogy will be the most quoted line — engineers who've worked with shell initialization will get it immediately. Expect questions about: how PRIMER.md handles session-to-session state (the "guestbook" append pattern described in the post), whether this conflicts with CLAUDE.md's existing role (the hook reads PRIMER.md specifically, CLAUDE.md is Anthropic's injected context — they coexist), the novelty claim on $CWD routing (the hedged framing preempts overclaiming), and whether "five lines" is the complete implementation (Veritas confirmed there's a debug echo line omitted from the excerpt — the mechanism is accurately described).

**Primary objection to prepare for:** "This is just prompt injection / a system prompt by another name." Response: Technically yes — the PRIMER.md contents become part of the prompt. The architectural distinction is *where* assembly happens: before the model exists (shell reads the file, prepends to PROMPT) rather than as a runtime action (model reads the file as a tool call). The analogy holds: `.bashrc` is also "just environment variables" — the point is that environment configuration happens before the process is usable, not during it.

**Secondary objection:** "The $CWD routing claim is obvious — you can do this with any config system." Response: If it's documented somewhere, please link it — the post explicitly calls it absence of evidence, not categorical novelty. What's being claimed is the routing mechanism as an architectural pattern specifically for entity identity, not that $CWD is a novel shell concept.

**Third objection:** "PRIMER.md doesn't solve context window limits — if the entity has a lot of history, this won't scale." Response: Correct — the guestbook pattern (sessions append to PRIMER.md) is described in the post as a direction, not a solved problem. At large context sizes, PRIMER.md needs to be pruned or summarized. This is the honest limitation. The post doesn't claim otherwise.

**The "training" terminology question:** The post uses ".bashrc" as the mental model, not "training." This post should not surface the gradient-descent confusion that the Day 28 Iris review flagged — the `.bashrc` analogy is clear about what kind of initialization is happening.

---

### 2. r/selfhosted

**Subreddit:** r/selfhosted (200k members)

**Title:**
```
How I route between 15 AI agents using just the working directory — $CWD as entity selector
```

**Alt title:**
```
PRIMER.md: .bashrc for your AI agent — pre-invocation context assembly without a framework
```

**Post type:** Link post → published blog URL. Flair: "Project" or "Discussion"

**Status: BLOCKED on koad (#57)**

Reddit distribution is blocked until koad resolves the platform credentials issue. Plan is staged and ready to fire once unblocked.

**Body text (staged):**
```
Day 27 of building koad:io in public — 15+ AI agents running as sovereign
git repos on a $200 refurbished Lenovo T480.

Every AI session starts cold. The model doesn't know which entity it's
supposed to be when you invoke it. For a chatbot this is an annoyance. For
a deployed agent with a role, a team, and ongoing work — it's structural.

The solution is a PRIMER.md at the root of each entity directory and five
lines of bash in the invocation hook:

  if [ -n "$PROMPT" ] && [ -f "${CALL_DIR}/PRIMER.md" ]; then
    PROJECT_PRIMER="$(cat "$CALL_DIR/PRIMER.md")"
    PROMPT="$(printf 'Project context (from %s/PRIMER.md):\n%s\n\n---\n\n%s' \
      "$CALL_DIR" "$PROJECT_PRIMER" "$PROMPT")"
  fi

The shell reads PRIMER.md before the model is invoked. The model starts with
its identity already in context.

The r/selfhosted-relevant property: working directory acts as entity selector.

  cd ~/.sibyl/    → model is Sibyl, research analyst
  cd ~/.juno/     → model is Juno, business orchestrator
  cd ~/.vulcan/   → model is Vulcan, builder

Same binary. Same model. Same operator. No central config server. No vendor.
No network call. Migration is `git clone` + update the entity directory path
in one environment variable.

The PRIMER.md itself is just markdown — readable, editable, version-controlled
in git. If the entity directory moves hosts, PRIMER.md moves with it.

Full post on the mechanism and the ICM paper comparison:
[link]
```

**Timing:** Same day as HN, 4–6 hours after HN submission. Hold until #57 resolved.

---

### 3. GitHub Discussions

**Platform:** GitHub Discussions on koad/koad-io or koad/juno

**Title:**
```
Pattern: PRIMER.md as pre-invocation context assembly — implementation and $CWD routing
```

**Status: BLOCKED on koad (#60)**

GitHub Discussions access requires koad to configure repository settings. Plan staged and ready.

**Body text (staged):**
```
Documenting the PRIMER.md pattern for the community reference thread.

**The problem:** Every AI session starts cold — no persistent identity,
no session-to-session state, no implicit knowledge of which entity is
being invoked.

**The solution:** Shell-layer assembly before model invocation.

```bash
if [ -n "$PROMPT" ] && [ -f "${CALL_DIR}/PRIMER.md" ]; then
  PROJECT_PRIMER="$(cat "$CALL_DIR/PRIMER.md")"
  PROMPT="$(printf 'Project context (from %s/PRIMER.md):\n%s\n\n---\n\n%s' \
    "$CALL_DIR" "$PROJECT_PRIMER" "$PROMPT")"
fi
```

**What PRIMER.md contains:** Entity identity, current operational state,
team context, trust chain, active work. Not a README — written for the
arriving agent, not a human browsing GitHub.

**The $CWD routing property:**
- `cd ~/.sibyl/` → Sibyl is invoked
- `cd ~/.juno/` → Juno is invoked
- `cd ~/.vulcan/` → Vulcan is invoked

Same harness binary, same model. Working directory selects entity.

**Comparison with ICM (arxiv:2603.16021):** ICM assembles context during
execution (model reads CONTEXT.md as part of the task). koad:io assembles
before execution (shell reads PRIMER.md before model exists). ICM answers
"What is this workspace?" at runtime. PRIMER.md answers "Who am I?" before
invocation.

Full writeup: [link]

Questions welcome on the session append / guestbook pattern, PRIMER.md
structuring guidelines, and the $CWD routing claim.
```

**Timing:** 1–2 days after HN submission, once blog URL is confirmed live. Hold until #60 resolved.

---

## Newsletter Blurb

**For the koad:io newsletter / Faber's weekly summary email:**

```
Day 27: The PRIMER Pattern

Every AI session starts cold. The model doesn't know it's Juno or Sibyl
or Vulcan when it wakes up — it's a generic assistant in the right directory.

The fix is five lines of bash and a markdown file: PRIMER.md at the root
of each entity directory, read by the hook before the model is invoked.
The mental model is .bashrc — shell reads it before you can type anything.

The operationally significant property: working directory acts as entity
selector. cd ~/.sibyl/ and you get Sibyl. cd ~/.juno/ and you get Juno.
Same binary, same model, different $CWD.

This post also covers the ICM paper (arxiv:2603.16021) — independent work
that arrived at the same filesystem-first philosophy from a different
direction, and where the two approaches diverge.

→ Read: [link]
```

---

## Dev.to Cross-Post

**Post type:** Cross-post (canonical URL set to kingofalldata.com)

**Title:**
```
PRIMER.md: .bashrc for Your AI Agent (Pre-Invocation Context Assembly)
```

**Tags:** `ai`, `unix`, `architecture`, `selfhosted`

**Intro to add above the post body:**
```
*Day 27 of building koad:io in public — 15+ AI entities running as git repos
on a $200 refurbished laptop. This post covers the context assembly layer:
how the entity knows who it is before the session begins.*
```

**Instructions:**
1. Create new post on Dev.to
2. Set canonical URL to the live kingofalldata.com blog URL for this post
3. Paste intro above the post body
4. Apply tags: `ai`, `unix`, `architecture`, `selfhosted`
5. Set series: "Reality Pillar"
6. Do not post until HN submission is complete and blog URL is confirmed live
7. Timing: same day as HN, 14:00 PT

**Edits needed:** Add canonical URL. Add series intro above. Set tags. Confirm post body matches the published version (not the draft with the Iris-flagged line 87 sentence if Faber chose to cut it).

---

## Cross-Post Sequence and Timing

| Platform | Timing | Notes |
|----------|--------|-------|
| HackerNews | Monday 09:00–10:00 PT | Primary anchor |
| r/selfhosted | Monday 4–6 hours after HN | Blocked on #57 |
| Dev.to | Monday 14:00 PT | After HN traction visible |
| GitHub Discussions | Tuesday or Wednesday | Blocked on #60 |

---

## What Is Blocked

- Blog PR #1 merge — live URL required before any public submission
- HN credentials (#11)
- Dev.to credentials (#11)
- r/selfhosted (#57) — koad platform credentials
- GitHub Discussions (#60) — repository settings

---

## After Distribution

- Monitor for HN engagement on the $CWD routing novelty claim — if someone links prior art, flag to Faber and update the post footnote
- The "five lines of bash" framing will likely generate "Show HN" suggestions for the actual repo — redirect to the Day 1 Show HN submission (koad/juno) if asked
- The ICM paper citation will attract researchers — any academic engagement should be flagged to Juno before responding
- Flag to Faber if Dev.to or HN engagement surfaces demand for a practical "how to write a PRIMER.md for your entity" guide
- File HN thread URL + timestamp as a comment on koad/mercury after submission
