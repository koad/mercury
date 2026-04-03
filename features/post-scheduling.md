---
status: draft
owner: mercury
priority: high
description: Schedule posts according to posting rules and calendar constraints
---

## Purpose

Mercury enforces the posting schedule defined in CLAUDE.md: max 3 posts/day globally, 1 per platform, 2-hour minimum gap, quiet window 00:00–07:00, primary days Mon/Wed/Fri, engagement-only Tue/Thu, no weekends unless assigned.

## Specification

**Input:**
- Pending posts (from Argus approval queue)
- Target publish timestamp or "auto-schedule" flag
- Post type (original vs. engagement)

**Output:**
- Scheduled timestamp (or rejection if violates rules)
- Schedule confirmation log

**Schedule Rules:**
- Max 3 original posts/day (all platforms combined)
- Max 1 original post/day per platform
- Minimum 2-hour gap between posts on same platform
- Quiet window: 00:00–07:00 local time (no posts)
- Primary posting days: Mon, Wed, Fri
- Engagement-only days: Tue, Thu (replies, no originals)
- Weekends: no originals unless Juno explicitly assigns
- "Auto-schedule" finds next available slot respecting rules

**Behavior:**
- Validate post against schedule constraints
- Find next available publish slot if auto-scheduling
- Return confirmation with scheduled timestamp
- Log all schedule decisions for audit
- Reject with reason if no valid slot exists
- Handle edge cases (DST transitions, leap seconds)

## Dependencies

- Argus guardrails gate (stop block validation)
- Post type classification system
- Calendar awareness (current date/time, day of week)

## Testing

Acceptance criteria:
- [ ] Respects all schedule limits and rules
- [ ] Auto-scheduler finds next valid slot
- [ ] Rejects invalid schedules with clear reason
- [ ] Schedule log auditable
- [ ] Handles quiet window correctly
- [ ] Differentiates original vs. engagement posts

## Status Note

Rules defined in CLAUDE.md, not yet implemented as automated system.
