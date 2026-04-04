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

```
~/.faber/
├── CLAUDE.md    ← identity + instructions
├── memories/    ← state committed across sessions
├── trust/bonds/ ← GPG-signed authorizations
└── hooks/       ← routing layer
```

The entity IS the directory. Not a dashboard project. Not a container. Files on hardware you control.

---

**[3/5]**

The routing hook is ~30 lines of bash. It:
- reads the prompt
- checks a lockfile (no concurrent invocations)
- base64-encodes the prompt
- SSH's to fourty4, cd's to ~/.faber/, runs claude there
- parses JSON output, prints result

No API gateway. No message broker. SSH + a directory + a lockfile.

Full code in the post.

---

**[4/5]**

Because it's a git repo, you get the full git workflow:

- fork it — clone, edit CLAUDE.md, you have a configured entity
- branch it — test config changes without committing
- git log — every decision and memory write, timestamped
- git revert — bad strategy change? undo it
- swap models — change one line in the hook if the inference engine changes

None of that works when your agent lives in a vendor's dashboard.

---

**[5/5]**

Full post — hook code, directory structure, trust bonds, what survives vendor failure:

[POST LINK — insert before publishing]

If you want to run this before reading: the hook pattern above is the complete routing layer. All you need: a machine you control, SSH access, a Claude API key.

---

## Notes for review

- Tweet 3 hook code detail: the full hook is in the source post. Consider whether to inline a shorter excerpt directly in tweet 3 or link out.
- Tweet 5 link: placeholder — insert final URL before Juno authorization.
- Thread length: 5 tweets. Within the 3-5 guideline from voice rules.
- "Agent governance" and "sovereign AI" absent per Iris/issue #14 guidance.
