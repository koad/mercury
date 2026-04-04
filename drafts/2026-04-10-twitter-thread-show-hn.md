---
title: "X/Twitter thread: Show HN — agent home directory category post (Apr 10)"
date: 2026-04-10
source: ~/.faber/posts/2026-04-10-show-hn-agent-home-directory.md
issue: koad/mercury#17
platform: twitter
status: STAGED — awaiting Juno authorization and HN URL
audience: HN/LocalLLaMA/selfhosted
---

# Thread Draft: Show HN — Agent Home Directory

**Publish order:** HN first, then this thread after HN is live (link to HN thread in tweet 5).
**Voice:** Practitioner to practitioner. Artifact before category. No "sovereign AI," no "agent governance."

---

**[1/5]**

We just posted on HN: Show HN — giving local AI agents a home directory.

What that means in practice: ~/.juno/ exists. It has cryptographic keys, persistent memory, and signed authorizations. The agent knows who it is when you restart it.

[HN LINK]

---

**[2/5]**

The gap this solves:

Your Ollama agent has no home directory. Every restart, it forgets who it is. No persistent memory. No authorization record. No identity between sessions.

That's not a prompt problem. It's a file system problem.

---

**[3/5]**

The solution is a directory:

~/.juno/
├── CLAUDE.md    ← identity
├── memories/    ← persistent state
├── trust/bonds/ ← signed authorizations
└── id/          ← cryptographic keys

Fork the template. Edit CLAUDE.md. Your agent now has a home.

---

**[4/5]**

Why this matters for local inference:

- Ollama/LM Studio give you the model. They don't give the model an identity.
- koad:io gives the model a home directory — keys, memory, auth scope that survive restarts.
- The inference engine is swappable. The entity persists.

---

**[5/5]**

The gitagent/SOUL.md pattern solved portability. This solves sovereignty.

Same agent, different runtime = gitagent's job.
Same agent, auditable identity, hardware you control = this.

Full post + repo:
[HN LINK]

---

## Notes for review

- Tweet 3: tree uses Unicode chars — displays fine in Twitter without code fences.
- Tweet 5: "sovereignty" used in architectural sense (hardware + keys), not ideological. Acceptable per Iris brief.
- All tweets verified ≤280 chars (checked 2026-04-04).
- HN link placeholder in tweets 1 and 5 — insert after HN submission is live.
- Do not schedule this thread until HN link is available.
- Verify gitagent star count before Apr 10 — "2,500+" may need update per issue #17 notes.

## Character counts (verified 2026-04-04)

- Tweet 1: ~230 chars (with placeholder URL counted as ~25)
- Tweet 2: ~220 chars
- Tweet 3: ~175 chars
- Tweet 4: ~238 chars
- Tweet 5: ~195 chars (with placeholder URL counted as ~25)
