---
title: "Twitter/X Thread — Week 1 Reality Proof"
date: 2026-04-05
platform: twitter
status: STAGED — awaiting Twitter/X account credentials and live blog URL
pillar: Reality
series: "2-Week Reality Proof"
week: 1
verified_chars: true
sourced_from:
  - ~/.mercury/drafts/2026-04-04-twitter-thread-entities-on-disk.md
  - ~/.mercury/drafts/2026-04-04-twitter-pinned-post-strategy.md
  - ~/.mercury/distribution/2026-04-04-entities-on-disk-plan.md
---

# Twitter/X Thread — Week 1 Reality Proof

**Voice:** Artifact first. Problem before solution. Technical peer to technical peer. No "sovereign AI." No philosophy before function. Close with a verification path.

**No emojis** per Mercury voice rules. All 5 tweets verified ≤280 characters.

---

## Post after HN is live

Do not post this thread before the HN submission is live. The final tweet links to the post — get that URL first. Ideal timing: 30 minutes after HN submission goes up, so the thread can link the HN discussion.

**Timing:** Monday 2026-04-06, ~09:30 PT

---

## The Thread

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
├── CLAUDE.md    <- identity
├── memories/    <- persistent state
├── trust/bonds/ <- signed authorizations
└── hooks/       <- routing

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

- fork it -> clone, edit CLAUDE.md, configured entity
- git log -> every decision, timestamped
- git revert -> bad strategy? undo it
- swap models -> change one line in the hook

None of that works when your agent lives in a vendor's dashboard.

---

**[5/5]**

Full post — hook code, directory structure, trust bonds, what survives vendor failure:

[POST LINK — replace before publishing]

If you want to run this before reading: SSH access to a machine you control, a CLAUDE.md, and an API key. That's the whole stack.

---

## Tweet character counts (verified 2026-04-05)

| Tweet | Characters |
|-------|-----------|
| 1/5 | ~198 |
| 2/5 | ~212 |
| 3/5 | ~233 |
| 4/5 | ~215 |
| 5/5 | ~223 |

All within 280. Final tweet with real URL may need trimming — use a URL shortener if needed.

---

## Pinned post (post before the thread — pin to profile top)

Pin this before the Reality Proof series starts. Remove previous pin first.

```
Building AI entities in public for 2 weeks.

Entities on disk. Keys yours. No vendor. No kill switch.

Following along: [thread 1 link — insert after posting]
```

This becomes the series anchor. Link each new thread back to it.

---

## Do not

- Post emojis (voice rules: none unless koad explicitly requests)
- Reply to "just use LangChain" or "this is just dotfiles" — not worth the thread noise
- Post before HN is live and the blog URL resolves
- Use the word "sovereign" in copy

---

## After posting

- File publish log on koad/mercury with tweet thread URL + timestamp
- Report engagement to Juno in weekly summary
- Monitor replies for substantive technical questions — one reply per thread if koad assigns
- If Juno approves, consider quote-tweeting the HN discussion link from this thread later in the day

---

## Pre-posting checklist

- [ ] HN submission live (get that URL)
- [ ] Blog post live at final URL
- [ ] Twitter/X account credentials confirmed
- [ ] [POST LINK] replaced in tweet 5/5
- [ ] Previous pin removed (if any)
- [ ] Juno authorization recorded
