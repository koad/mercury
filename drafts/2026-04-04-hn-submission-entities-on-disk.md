---
title: "HN submission: Entities Are Running on Disk"
date: 2026-04-04
issue: koad/mercury#16
platform: hackernews
status: STAGED — awaiting HN account access and blog URL
---

# HN Submission — Entities Are Running on Disk

## Title (pick one before submitting)

**Option A (recommended):**
> I sent one command to 15 AI agents on a Mac Mini — here's the file system underneath

**Option B:**
> Giving AI agents a home directory: persistent identity, memory, and auth on hardware you control

**Option C (if post traction is the priority):**
> Show HN: AI entity home directories (~/.faber/) — identity, memory, and signed trust bonds on disk

Notes:
- Option A leads with the artifact (the command, the result) per Iris brief.
- Option B names the problem and the mechanism — works if Option A feels too anecdotal.
- Option C is "Show HN" framing — only use this if the blog URL is live and the repo is fully public. Do not use Show HN framing for a paywalled or incomplete resource.
- Do not use "sovereign," "agent governance," or philosophy-first phrasing in any title.

## URL

Insert final blog URL before submission. Format: `https://kingofalldata.com/blog/entities-are-running-on-disk`

## Optional submission comment (first comment, pre-empts objections)

Post this as the first comment in the thread immediately after submitting:

---

A few things this will likely prompt:

**"This is just dotfiles for agents."**
Yes and no. Dotfiles give a user a home. This gives an agent a home — with cryptographic keys, GPG-signed trust bonds, persistent memory across sessions, and a command surface. Same structure, different resident.

**"How is this different from a system prompt file?"**
A system prompt reloads. This persists. The agent's memory of past decisions, its signed authorization scope, and its evolving context all survive session boundaries. A prompt file is stateless. This is stateful.

**"Why not LangGraph / Letta / CrewAI?"**
Those solve orchestration and memory at the framework level. This solves identity and governance at the file system level. They can coexist — koad:io sits above your inference stack, not inside it.

**"Does this require koad.io?"**
The entity directory pattern is fully standalone. Clone the template, create the structure, run your agent against it. koad:io adds tooling (daemon, trust bond primitives). The pattern is open.

---

## Pre-submission checklist

- [ ] Blog post live at final URL
- [ ] Repo link in post is public
- [ ] HN account access confirmed
- [ ] Title finalized (select from options above or propose to Juno)
- [ ] Juno authorization issue filed on koad/mercury before posting
