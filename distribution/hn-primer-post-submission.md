---
title: "HN Submission — Pre-Invocation Context Assembly (PRIMER Post)"
date: 2026-04-05
platform: hackernews
post_type: Ask HN / standalone link post
status: STAGED — awaiting Gist live confirmation and Juno authorization
pillar: Architecture
series: "Naming What We Built"
source_gist: https://gist.github.com/koad/7198a0f0fdeceeca72db2d5e959519dc
source_draft: ~/.faber/drafts/2026-04-05-pre-invocation-context-assembly.md
arxiv_ref: arxiv:2603.16021
---

# HN Submission — Pre-Invocation Context Assembly

## Title variants (ranked)

### Option A — mechanism angle (RECOMMENDED)
```
cd ~/.sibyl && claude — How koad:io Routes Between 15 AI Entities by Filesystem Path
```

### Option B — pattern name angle
```
Pre-Invocation Context Assembly: How $CWD Selects Which Agent to Wake
```

### Option C — literature angle
```
Naming the Pattern ICM (arxiv:2603.16021) Didn't: Shell-Based AI Entity Identity
```

---

## Title recommendation

**Use Option A.**

Reason: HN responds to concrete mechanisms before abstract pattern names. `cd ~/.sibyl && claude` is seven characters that immediately raise the question "wait, how does that work?" — which is exactly the click motive. The "15 AI entities by filesystem path" tail gives the scale that makes the mechanism surprising rather than trivial. Options B and C front-load abstraction; they require the reader to already care about the pattern before they learn what it does. Option A earns that caring in the title itself.

Option C is worth keeping as a follow-up angle if this submission generates enough discussion to merit a second thread aimed at the ML/arxiv-reading segment.

---

## URL

```
https://gist.github.com/koad/7198a0f0fdeceeca72db2d5e959519dc
```

Confirm the Gist is public and loads before submitting. If the piece moves to a blog post on kingofalldata.com, update this URL. Gist submissions are accepted on HN; they read as raw and technical, which is appropriate for this content.

---

## Submission comment

Post this as the first reply to your own submission, within 2 minutes of submitting.

---

The Gist claims that koad:io uses a pattern that has no name in the published literature — and that the closest published work (ICM, arxiv:2603.16021, March 2026) makes the gap visible rather than closing it.

The short version: ICM's agents read their identity files *after* the model loads. koad:io's shell hook injects identity *before* the model's first token. Same filesystem-first philosophy. Different layer. The distinction has consequences for how sovereign and drift-resistant agent identity actually is in production.

I've been running 15 entities this way across three machines. The routing mechanism is `$CWD` — working directory selects which entity's `PRIMER.md` the hook injects. One binary, fifteen identities, all selected before inference begins.

I'm calling the pattern **pre-invocation context assembly**. The Gist walks through what it is, how it compares to ICM, and why the timing difference matters for durability of agent identity.

Happy to answer questions about the hook architecture, the PRIMER.md format, or the ICM comparison specifically.

---

## Follow-up comment (post immediately after submission lands)

Post this as a second comment in the thread, or as a reply to the first substantive technical question. Written to pre-empt the three most likely objections.

---

Three objections I expect and want to address directly:

**"Why not just write a better SYSTEM prompt? This is prompt engineering."**

A SYSTEM prompt is set at inference time by the caller — it's not durable across callers or harnesses. Pre-invocation context assembly is shell-level: the hook runs before any harness, any API call, any model. If someone invokes the entity via a different client, the hook still ran. The identity isn't stored in a prompt template someone controls. It's a file on disk that the shell reads before anything else does.

**"What's wrong with runtime context reads? ICM validates that approach."**

Nothing is wrong with it — ICM's approach is well-designed for what it solves (workflow orchestration within a project). The question is what you're trying to make durable. If the agent reads its identity file during execution, that read competes with everything else in context. It can be crowded out. It can fail silently. It can drift if the file changes between reads. When the shell injects identity before inference begins, identity is a precondition, not a retrieval result. For persistent agent identity across sessions and harnesses, the timing matters.

**"Isn't this just .bashrc? Environment configuration before the process starts?"**

Yes, exactly — and that's the point. `$HOME/.bashrc` is a solved, stable, universally understood pattern for pre-process configuration. Pre-invocation context assembly applies the same principle to AI agent identity. The analogy is precise: `$PWD/PRIMER.md` is to the agent what `$HOME/.bashrc` is to a shell process. The fact that it maps cleanly onto a Unix primitive is evidence that the pattern is right, not that it's trivial.

The full ICM comparison is in the Gist.

---

## Timing

**Post Tuesday–Wednesday, 09:00–11:00 PT.**

Rationale: This is a technical/architectural piece aimed at people who read arxiv and care about agent infrastructure. That audience is active mid-week. Monday carries noise from weekend backlog. Thursday–Friday, the "did this land?" window closes before the weekend audience clears.

Do not post the same week as the Week 1 Show HN (entities-on-disk post) — separate the submissions by at least 5 days to avoid self-competition in the new queue.

---

## After submission

- Post submission comment within 2 minutes
- Post follow-up comment if first substantive technical reply surfaces within 30 minutes; otherwise post it proactively at the 30-minute mark to seed the thread
- File publish log on koad/mercury with HN thread URL, submission timestamp, and point/comment count at 1h / 6h / 24h
- Do not reply to "just use LangChain" variants — let the thread handle it
- If ICM authors or arxiv-adjacent researchers surface in comments, escalate to Juno before replying
- If the thread breaks 50 points in 2 hours, notify koad via keybase immediately

---

## Pre-submission checklist

- [ ] Gist public and loading at final URL
- [ ] ICM arxiv link confirmed live: https://arxiv.org/abs/2603.16021
- [ ] HN account credentials confirmed
- [ ] Title confirmed (Option A, unless Juno directs otherwise)
- [ ] Submission comment ready to paste (no placeholder links — Gist URL is the link)
- [ ] Follow-up comment ready to paste
- [ ] Week 1 Show HN submitted at least 5 days prior (no self-competition)
- [ ] Juno authorization recorded
