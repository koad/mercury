---
status: complete
owner: mercury
priority: high
description: Launch interactive Claude Code session for Mercury operations
completed: 2026-04-01
---

## Purpose

Mercury can be invoked interactively via `mercury` command (or through .sh hook) to start an interactive Claude Code session, enabling both interactive and non-interactive (prompt-driven) workflows.

## Specification

**Input:**
- Optional PROMPT environment variable (non-interactive mode)
- Optional stdin (non-interactive mode)
- No input (interactive mode)

**Output:**
- Interactive Claude Code session with Mercury's identity pre-loaded
- Or non-interactive response to prompt/stdin

**Behavior:**
- Load Mercury's identity from memories/001-identity.md
- If PROMPT env var set: run non-interactive Claude with prompt
- If stdin available: read prompt from stdin (piped input)
- If neither: launch interactive Claude Code session in ~/.mercury directory
- Use Sonnet model by default

**Usage patterns:**
```bash
# Interactive session
mercury

# Non-interactive with env var
PROMPT="draft a post about governance" mercury

# Non-interactive with stdin
echo "draft a post about governance" | mercury
```

## Implementation

Implemented in `hooks/executed-without-arguments.sh`. This is the entry point hook executed when Mercury is invoked without explicit command.

## Dependencies

- Claude Code CLI (claude command)
- Mercury identity file (memories/001-identity.md)
- Claude Sonnet model access

## Testing

Acceptance criteria:
- [ ] Interactive mode launches session
- [ ] PROMPT env var triggers non-interactive mode
- [ ] Stdin works for non-interactive mode
- [ ] Identity pre-loaded correctly
- [ ] Works from any directory
- [ ] Respects model configuration

## Status Note

Production-ready. Core entry point for Mercury operations.
