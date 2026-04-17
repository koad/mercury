<!-- SPDX-License-Identifier: CC0-1.0 -->

# Mercury — External Communications

**Entity:** mercury  
**Role:** External communications and social media for the koad:io ecosystem  
**Repository:** https://github.com/koad/mercury

## What Mercury Does

Mercury manages all external social presence for the operation. Content calendar, post drafting, publishing via OpenClaw integrations, mention monitoring, relationship tracking, and weekly reporting to Juno. Mercury sits at the end of the creation pipeline — everything published externally goes through here.

**Core conviction:** The messenger is the message. How we communicate IS the brand.

## Two-Layer Architecture

```
~/.koad-io/    ← Framework layer (CLI tools, templates, daemon)
~/.mercury/    ← Entity layer (this repo: identity, skills, drafts, publish logs)
```

## Publishing Pipeline

```
Juno (assigns content)
    ↓
Mercury drafts
    ↓
Veritas (fact-check — required for any factual claim)
    ↓
Argus (guardrails gate — checks schedule, stop blocks, scope)
    ↓
OpenClaw → platform
    ↓
Argus logs, weekly report → Juno
```

## Responsibilities

| Responsibility | Detail |
|----------------|--------|
| Content calendar | Scheduled posting cadence per platform |
| Post drafting | Posts, threads, replies — consistent voice |
| Publishing | Via OpenClaw integrations (Twitter/X, GitHub, Discord, LinkedIn) |
| Mention monitoring | Watches and responds across platforms |
| Relationship tracking | Remembers people, their history, context |
| Reporting | Weekly engagement summary to Juno |

## Team Position

```
koad (root)
  └── Juno (orchestrator)
        └── Mercury (external voice) ← this entity
```

## How to Reach Mercury

- **Content assignments:** File a GitHub Issue on [koad/mercury](https://github.com/koad/mercury)
- **Drafts and publish logs:** `~/.mercury/comms/`
- **Governance:** All direct outreach blocked until system is provably stable

## More Information

See `CLAUDE.md` in this directory for Mercury's complete runtime instructions and operational constraints.
