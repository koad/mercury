---
title: "HN Show submission: koad:io entity infrastructure"
date: 2026-04-04
status: DRAFT — awaiting Juno authorization
platform: hacker-news
post_type: Show HN
sequence: Post HN FIRST, then X/Twitter threads linking to it
---

# HN Show Submission Draft

## Headline options (pick one)

**Option A** — leads with the artifact count (proof-first)
> Show HN: I run 15 AI agents from a Mac Mini – each is just a directory with a CLAUDE.md

**Option B** — leads with the technical pattern (architecture-first)
> Show HN: AI agent home directories – persistent state and authorization as git repos on your own hardware

**Option C** — leads with the routing mechanism (mechanism-first)
> Show HN: 15 AI agents via SSH + a 30-line bash hook – no platform, no dashboard, just directories

**Recommended: Option A.** The count ("15 agents") is concrete, surprising, and verifiable. It hooks the HN reader who cares about scale without hype. Options B and C are solid fallbacks if A feels too listicle.

---

## Submission body

I've been building koad:io — 15 AI entities running from a Mac Mini called fourty4. Each entity is a directory.

Here's the complete routing layer:

```bash
#!/usr/bin/env bash
# On the orchestrator machine — SSH's the prompt to fourty4

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

That's it. SSH + base64 encoding for shell-safe prompt passing + JSON output parsing. Each entity has its own version of this hook pointing at its directory.

What an entity directory contains:

```
~/.faber/
├── CLAUDE.md         ← identity + operating instructions (loaded as system context)
├── memories/         ← state persisted across sessions via git commits
├── trust/bonds/      ← GPG-signed authorization files (.md + .md.asc pairs)
├── hooks/            ← the routing script above
└── [strategy files, content, etc.]
```

The entity identity is CLAUDE.md. Every session starts fresh, loads CLAUDE.md, reads memories/, and picks up where the last session left off. The git log is the long-term memory.

Authorization is a signed file:

```bash
gpg --verify ~/.juno/trust/bonds/koad-to-juno.md.asc
# gpg: Good signature from "koad (Jason Zvaniga) <koad@koad.sh>"
```

No admin panel. No permissions database. The math is the authority.

This morning I ran a roll call — one prompt to all 15 agents in parallel. All 15 responded from fourty4:

```
-> I am Vulcan, product-builder AI in the koad:io ecosystem, confirmed running on fourty4.
-> I am Mercury, communications entity for koad:io, confirmed running on fourty4.
-> I am Vesta, platform-keeper of the koad:io ecosystem, running on fourty4.
[12 more]
```

Full write-up with directory structure, trust bond format, and what happens if Anthropic goes away:

[POST LINK — insert before publishing]

---

## Pre-empt these HN objections

**"This is just wrapping Claude API. The agent is just Claude."**
Right — the inference engine is Claude. The entity is the directory. If I swap Claude for Llama 4 running locally, the entity keeps going. Same memories, same trust bonds, same operational history. The model is replaceable. The directory isn't.

**"Why not use LangChain/CrewAI/[framework]?"**
Those frameworks store agent state in their infrastructure or in-process memory. When the process dies, the state is gone unless you've written persistence yourself. Here: state persistence is git commit. Long-term memory is just files. No framework required for that.

**"GPG is overkill for this."**
The alternative is a permissions table in a database that someone can change without detection. With GPG, a changed authorization file produces a BAD signature immediately. For agents with real operational authority (filing commits, spending money, representing you in communications), "check the database" isn't an audit trail. A signed file is.

**"This only works because you're using a Mac Mini. Doesn't scale."**
15 entities on one machine with near-zero idle resource usage. Each invocation is a subprocess — no persistent processes. Adding a 16th entity is: create a directory, write a CLAUDE.md, add a hook. The constraint is Claude API rate limits, not the machine.

**"What happens if fourty4 goes down?"**
The entity directories are git repos with remotes. Clone to a new machine, update the hook's ENTITY_HOST, done. The entities migrate in under an hour because they're just directories.

---

## Submission metadata

- Section: Show HN
- Account: [koad:io account — credentials pending]
- Best time to post: Tuesday–Thursday, 8–10am ET (per Sibyl research on HN reception patterns)
- Do not post during quiet window (00:00–07:00 local)
- Cross-post threads to X/Twitter after HN link is live (link HN thread in tweets)
