---
title: "GitHub Discussions — Pre-Invocation Context Assembly (First Post)"
date: 2026-04-05
platform: github-discussions
repo: koad/koad-io
status: READY — copy-paste, no edits required
pillar: Architecture
series: "Naming What We Built"
source_post: ~/.faber/posts/2026-04-05-pre-invocation-context-assembly.md
arxiv_ref: arxiv:2603.16021
---

# GitHub Discussions — First Post

## Suggested title

```
Naming the pattern: pre-invocation context assembly ($CWD as entity selector)
```

**Why this title:** GitHub Discussions readers are already contributors or evaluators of the repo. They can immediately see the hook files in the codebase. Naming the pattern — rather than teasing it — is the right entry point. This audience rewards precision over curiosity bait.

---

## Category

**Show and Tell**

Reasoning: this is a working thing being demonstrated, not a question or a proposal. "Show and Tell" signals "here is something that exists and runs" — which is accurate. If `koad/koad-io` doesn't have Show and Tell, use **General**. Avoid Announcements unless koad wants this to feel like a formal release note (it shouldn't — it should feel like a developer sharing an observation).

---

## Post body (copy-paste ready)

---

There's a pattern running in production inside koad:io that I haven't seen named anywhere else, and the closest published work — Van Clief and McDermott's [Interpretable Context Methodology](https://arxiv.org/abs/2603.16021) (arxiv:2603.16021, March 2026) — makes the distinction clear enough that it's worth writing down.

**The short version:** when you run `sibyl` or `juno` or any entity command, the hook reads `PRIMER.md` from the calling directory and injects it as orientation context *before* the model's first token. The shell is the reader. The model starts with identity already assembled.

ICM's agents read their identity files *after* the model loads. That's a different timing, and the timing has consequences.

### What the hook does

```bash
sibyl  # entity command invoked
# → hook fires: ~/.koad-io/hooks/executed-without-arguments.sh
# → hook reads $CWD/PRIMER.md
# → injects via -p flag, prepended to prompt
# → model invoked with identity already in context
```

The model never performs a "read my identity" action. It doesn't load a file to find out who it is. It arrives already knowing — because the hook ran first.

Compare this to ICM's Layer 0: `CLAUDE.md` at the workspace root tells the model what project it's been dropped into. That's an important file, but the model reads it. The question it answers is *what is this workspace?* koad:io's PRIMER.md answers a different question: *who am I?* And the shell answers it before inference begins.

### $CWD as entity selector

The routing follows from the hook. When you invoke `juno`, the hook loads `~/.juno/PRIMER.md`. When you invoke `sibyl`, it loads `~/.sibyl/PRIMER.md`. Same binary. Same harness. The entity command plus calling directory determines which identity gets injected.

```
entity command + $CWD → which PRIMER.md → which identity
```

This is the Unix process environment inheritance model applied to AI invocation. `$CWD/PRIMER.md` is to the agent what `$HOME/.bashrc` is to a shell process — configuration that runs before the process does meaningful work, not during it.

### Why timing matters for identity durability

If an entity reads its own identity file during execution, that identity is a retrieval result. It competes with whatever else is in context. It can drift if the file changes mid-session. It can be crowded out. It can fail silently.

When the shell assembles identity before the model loads, identity is a precondition. The model's first token is already post-orientation. There's no window in which something can interrupt the identity load, because the load happened in the shell before inference started.

For persistent agent identity across sessions, harnesses, and machines — this timing is the difference between identity that holds and identity that occasionally forgets who it is.

### What I'm calling this

**Pre-invocation context assembly** — the three properties that define it:

1. Context assembly happens before model invocation (shell reads, model doesn't)
2. Shell is the assembler (no tokens spent on orientation, no tool calls)
3. $CWD is the entity selector (working directory routes to a specific PRIMER.md)

koad:io has been running this across 15+ entities on three machines. Every entity with a PRIMER.md in its root is reachable this way. ICM is the first published work I've seen that gets close enough to the same architectural territory that the distinction becomes legible.

---

## Opening question to the community

End the post with:

> Has anyone else arrived at this pattern independently — or something structurally similar? I'm specifically curious whether anyone's tried the inverse: letting the model assemble its own identity during execution and tracking whether identity drift actually shows up in long-running sessions.

**Why this question:** It's genuinely open (there's no planted answer), it invites people with production AI agent experience to respond, and the "identity drift" angle is concrete enough that someone with relevant data can respond specifically rather than just saying "interesting."

---

## Secondary suggestion (shorter first post option)

If koad wants a simpler opener before the full technical post, here's the 2-sentence version for the same Discussion thread, as a standalone post or the opening paragraph:

> We named a pattern today: **pre-invocation context assembly** — the hook reads `PRIMER.md` before the model's first token, so the agent starts with identity rather than acquiring it. It's to AI agent identity what `.bashrc` is to a shell process, and the closest published comparison point is Van Clief & McDermott's ICM paper (arxiv:2603.16021), which takes the opposite approach and makes the difference visible.

This works as a short "here's the concept, read the thread" opener if koad wants to gauge interest before posting the full version.

---

## Pre-post checklist

- [ ] Faber's full post confirmed at live URL (Gist or blog)
- [ ] `koad/koad-io` Discussions enabled on the repo
- [ ] Select "Show and Tell" category (or "General" if unavailable)
- [ ] Paste full post body above
- [ ] Paste closing question verbatim
- [ ] No edits needed — ready to fire today
