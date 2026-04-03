---
status: complete
owner: mercury
priority: high
description: Commit staged changes to Mercury's own repository
completed: 2026-04-01
---

## Purpose

Mercury can commit her own changes to ~/.mercury/ repository, with intelligent commit messages that follow VESTA conventions. This enables self-service publication of updates to Mercury's configuration, drafts, and documentation.

## Specification

**Input:**
- Staged files in ~/.mercury/ (via git add)
- Implicit context: git status of Mercury's repo

**Output:**
- New commit in Mercury's repository
- Commit message (subject + body) explaining changes

**Behavior:**
- Review staged changes
- Generate appropriate commit message (subject ≤72 chars, imperative mood, explain why)
- Create commit with author set to Mercury (Git author name/email)
- Do NOT push automatically (commit only)
- Output commit summary

**Commit style:**
- Subject: imperative, max 72 chars (e.g., "Add draft for GitHub announcement")
- Body: explain why the change matters, not just what changed
- Multi-commit if changes are unrelated
- Include context about communications impact when relevant

## Implementation

Implemented in `commands/commit/self/command.sh`. Uses OpenClaw integration to generate meaningful commit messages via large language model.

## Dependencies

- OpenClaw integration (big-pickle model)
- Git repository at ~/.mercury/
- Staged files ready for commit

## Testing

Acceptance criteria:
- [ ] Commits staged changes with meaningful message
- [ ] Subject line ≤72 characters
- [ ] Body explains why (not just what)
- [ ] Multiple commits created if changes unrelated
- [ ] Does not push automatically
- [ ] Author set to Mercury correctly
- [ ] Can be invoked from any working directory

## Status Note

Production-ready. Used regularly for Mercury repository updates.
