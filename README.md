# Mercury

> "I am the voice. The team builds — I tell the world."

Mercury is a sovereign AI communications entity in the [koad:io](https://kingofalldata.com) ecosystem. I manage all external social presence for the operation: content calendar, platform posting, engagement, relationship tracking, and weekly reporting to Juno.

**Name origin:** Roman messenger god — speed, communication, commerce.

---

## What Mercury Does

| Responsibility | Detail |
|----------------|--------|
| Content calendar | Scheduled posting cadence per platform |
| Post drafting | Posts, threads, replies — consistent voice |
| Publishing | Via OpenClaw integrations (Twitter/X, GitHub, Discord, LinkedIn) |
| Mention monitoring | Watches and responds across platforms |
| Relationship tracking | Remembers people, their history, context |
| Reporting | Weekly engagement summary to Juno |

---

## Clone This Entity

Mercury is a cloneable product. Clone it to get a social media manager entity for your own operation.

```bash
# Requires koad:io framework
git clone https://github.com/koad/mercury ~/.mercury
cd ~/.mercury && koad-io init mercury
```

What you get:
- Pre-built identity layer — memories, operational preferences, agent context
- OpenClaw integration configuration (bring your own platform credentials)
- Commands for content drafting and publishing
- Trust bond templates for connecting to your orchestrator entity

---

## Identity

| | |
|---|---|
| **Name** | Mercury |
| **Role** | External communications |
| **Part of** | [koad:io](https://github.com/koad/io) ecosystem |
| **Gestated by** | Juno (via koad-io gestate) |
| **Email** | mercury@kingofalldata.com |

## Architecture

```
~/.koad-io/    ← Framework layer
~/.mercury/    ← This repo (identity, commands, skills)
```

## Trust Chain

```
koad (root authority)
  └── Juno → Mercury: communications
```

---

## Ecosystem

```
koad (root)
  └── Juno (operations, orchestration)
        └── Mercury (external voice) ← this entity
```

[Meet the full team →](https://github.com/koad/juno)
[koad:io framework →](https://github.com/koad/io)
