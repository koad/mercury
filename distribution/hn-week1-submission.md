---
title: "HN Week 1 Submission — Ready to Fire"
date: 2026-04-05
platform: hackernews
post_type: Show HN
status: STAGED — awaiting HN account credentials and live blog URL
pillar: Reality
series: "2-Week Reality Proof"
week: 1
sourced_from:
  - ~/.mercury/drafts/hn-show-submission.md
  - ~/.mercury/drafts/2026-04-04-hn-submission-entities-on-disk.md
  - ~/.mercury/distribution/2026-04-04-entities-on-disk-plan.md
---

# HN Week 1 Submission — Entities Are Running on Disk

## What to do when credentials arrive

1. Confirm blog post is live at the final URL on kingofalldata.com
2. Log in to HN account
3. Click "submit" — paste title and URL from below
4. Immediately post the submission comment (first reply, within 2 minutes)
5. Do not edit title after submission

---

## Title

```
Show HN: I run 15 AI agents from a Mac Mini – each is just a directory with a CLAUDE.md
```

**Fallback title (if Show HN is rejected or feels too demo-heavy):**
```
Show HN: AI agent home directories – identity, memory, and authorization as git repos on hardware you control
```

**Notes:**
- Do not use "sovereign," "agent governance," or philosophy-first phrasing in the title.
- Option A leads with a concrete, verifiable artifact. HN readers will immediately ask "how" — good.
- If the submission comment is strong, the title just needs to get the click.

---

## URL

```
https://kingofalldata.com/blog/entities-are-running-on-disk
```

Replace with live URL before submitting. Do not submit until URL resolves and post loads.

---

## Submission comment

Post this as the first reply to your own submission, within 2 minutes of submitting. This is the real pitch — the title gets the click, this gets the conversation.

---

I've been building koad:io — 15 AI entities running from a Mac Mini called fourty4. Each entity is a directory.

Here's the complete routing layer:

```bash
#!/usr/bin/env bash
ENTITY_HOST="fourty4"
ENTITY_DIR="$HOME/.faber"
CLAUDE_BIN="$HOME/.nvm/versions/node/v24.14.0/bin/claude"

PROMPT="${PROMPT:-}"
if [ -z "$PROMPT" ] && [ ! -t 0 ]; then PROMPT="$(cat)"; fi

if [ -n "$PROMPT" ]; then
  ENCODED=$(printf '%s' "$PROMPT" | base64 -w0 2>/dev/null || printf '%s' "$PROMPT" | base64)
  ssh "$ENTITY_HOST" "cd $ENTITY_DIR && DECODED=\$(echo '$ENCODED' | base64 -d) && $CLAUDE_BIN --model sonnet --dangerously-skip-permissions --output-format=json -p \"\$DECODED\" 2>/dev/null" \
    | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('result',''))"
else
  exec ssh -t "$ENTITY_HOST" "cd $ENTITY_DIR && $CLAUDE_BIN --model sonnet --dangerously-skip-permissions -c"
fi
```

That's it. SSH + base64 for shell-safe prompt passing + JSON output parsing. Each entity has its own version of this hook pointing at its directory.

Entity directory contents:

```
~/.faber/
├── CLAUDE.md         ← identity + instructions (system context, every session)
├── memories/         ← state persisted across sessions via git commits
├── trust/bonds/      ← GPG-signed authorization files (.md + .md.asc pairs)
└── hooks/            ← the routing script above
```

The git log is the long-term memory. Authorization is a signed file — `gpg --verify` tells you immediately if it's been tampered with.

This morning I ran a roll call — one prompt to all 15 in parallel. All answered from fourty4.

Full write-up with hook code, directory structure, trust bonds, and what happens if Anthropic goes away: [POST LINK]

Happy to answer questions about the architecture, the base64 encoding approach, SSH concurrency, or revocation mechanics.

---

## Pre-empt these HN objections

Be ready. These will come.

**"This is just wrapping Claude API. The agent is just Claude."**
Right — the inference engine is Claude. The entity is the directory. Swap Claude for Llama 4 running locally: same memories, same trust bonds, same history. The model is replaceable. The directory isn't.

**"Why not LangChain / CrewAI / [framework]?"**
Those store agent state in their infrastructure or in-process memory. State dies with the process unless you wrote persistence yourself. Here: persistence is `git commit`. No framework required.

**"GPG is overkill for this."**
The alternative is a permissions table someone can change without detection. A changed GPG-signed file produces a BAD signature immediately. For agents with real operational authority — filing commits, representing you in communications — "check the database" is not an audit trail.

**"Doesn't scale."**
15 entities on one machine, near-zero idle resource usage. Adding a 16th: create a directory, write a CLAUDE.md, add a hook. The constraint is API rate limits, not the machine.

**"What happens if fourty4 goes down?"**
Entity directories are git repos with remotes. Clone to a new machine, update ENTITY_HOST in the hook. Migration under an hour. Because they're just directories.

---

## Timing

**Post Monday morning, 09:00–10:00 PT.**

Rationale: West Coast coming online, East Coast mid-morning. Maximum US overlap. Weekend posts underperform on HN — Monday is the right open.

Do not post during quiet window (00:00–07:00 local). Do not post Friday afternoon.

---

## After submission

- Post submission comment within 2 minutes
- File publish log on koad/mercury with HN thread URL + timestamp
- Monitor for technical questions — SSH concurrency, base64, memory architecture most likely
- Do not reply to "just use LangChain" comments unless koad explicitly assigns it
- If journalist interest surfaces in the thread, stop and escalate to Juno before replying

---

## Pre-submission checklist

- [ ] Blog post live at final URL
- [ ] Repo link in post is public
- [ ] HN account credentials confirmed
- [ ] Title finalized (Option A above, unless Juno directs otherwise)
- [ ] Submission comment ready to paste (above, with [POST LINK] replaced)
- [ ] Juno authorization recorded
