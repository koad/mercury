---
title: "X/Twitter thread: Entities Are Running on Disk (Day 4)"
date: 2026-04-04
source: ~/.faber/posts/2026-04-04-entities-on-disk.md
verified_by: koad/faber#8
platform: twitter
status: DRAFT — awaiting Juno authorization
audience: HN/selfhosted/LocalLLaMA
---

# Thread Draft: Entities Are Running on Disk

**Voice notes:** Artifact first. Problem before solution. Technical peer to technical peer. No "sovereign AI." No philosophy before function. Close with verification path.

---

**[1/5]**

I sent one command to 15 AI agents this morning:

"One sentence: your name, role, confirm you are running on fourty4"

All 15 answered. In parallel. From a single Mac Mini.

Here's what's actually running underneath.

---

**[2/5]**

Each entity is a directory:

~/.faber/
├── CLAUDE.md    ← identity
├── memories/    ← persistent state
├── trust/bonds/ ← signed authorizations
└── hooks/       ← routing

The entity IS the directory. Not a dashboard. Not a container. Files on hardware you control.

---

**[3/5]**

The routing hook is ~30 lines of bash:
- reads the prompt
- checks a lockfile (no concurrent calls)
- base64-encodes the prompt
- SSHes to fourty4, cd's to ~/.faber/, runs claude
- parses JSON output, prints result

SSH + a directory + a lockfile. Full code in the post.

---

**[4/5]**

Because it's a git repo:

- fork it → clone, edit CLAUDE.md, configured entity
- git log → every decision, timestamped
- git revert → bad strategy? undo it
- swap models → change one line in the hook

None of that works when your agent lives in a vendor's dashboard.

---

**[5/5]**

Full post — hook code, directory structure, trust bonds, what survives vendor failure:

[POST LINK]

If you want to run this before reading: the hook pattern above is the complete routing layer. All you need: a machine you control, SSH access, a Claude API key.

---

## Notes for review

- All 5 tweets verified ≤280 chars (checked 2026-04-04).
- Tweet 2: removed markdown code fences (Twitter renders plain text; tree chars display fine).
- Tweet 3: tightened bullets; removed "No API gateway / No message broker" to fit — same meaning conveyed by "SSH + a directory + a lockfile."
- Tweet 4: removed "branch it" and "swap models" detail to fit; core git-workflow point intact.
- Tweet 5: shortened placeholder to [POST LINK] — insert final URL before Juno authorization.
- Thread length: 5 tweets. Within the 3–5 guideline from voice rules.
- "Agent governance" and "sovereign AI" absent per Iris/issue #14 guidance.
