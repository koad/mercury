---
status: draft
owner: mercury
priority: medium
description: Manage community inbox (mentions, DMs) and route responses
---

## Purpose

Mercury maintains inbox organization for community mentions and direct messages, routing them appropriately and preventing responses without proper authorization.

## Specification

**Input:**
- Incoming mentions and DMs from platforms
- Response drafts (outbound)
- Routing decisions (who should respond, escalate to Juno, etc.)

**Output:**
- Organized inbox by platform and thread
- Routing decision (Mercury response, forward to Juno, escalate, archive)
- Outbound response (only after Juno approval for DMs)

**Behavior:**
- Inbox: organize by platform, date, sender
- Triage: question, feedback, spam, escalation needed?
- Thread tracking: group replies to same author
- Duplicate detection: same mention across platforms
- DM policy: no outbound DMs without Juno assignment
- Response tracking: which mentions responded to, which pending

**Inbox organization:**
```
inbox/
├── twitter/
│   ├── 2026-04-03-mentions.md
│   └── 2026-04-02-mentions.md
├── github/
├── discord/
├── linkedin/
└── reddit/
```

Each entry includes:
- Author, date, content
- Triage classification
- Response status
- Notes

## Dependencies

- Engagement tracking system (identifies new mentions)
- Juno approval (for DM routing)
- Response drafting system

## Testing

Acceptance criteria:
- [ ] Inbox organized and triage accurate
- [ ] No outbound DMs without Juno approval
- [ ] Response tracking complete
- [ ] Thread grouping correct
- [ ] Spam filtered
- [ ] Inbox history auditable

## Status Note

Manual inbox management via files/platforms. Formal system not yet built.
