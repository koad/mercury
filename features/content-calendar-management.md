---
status: draft
owner: mercury
priority: high
description: Maintain and query content calendar for planned topics and campaigns
---

## Purpose

Mercury maintains a content calendar specifying planned topics, campaigns, and themes for the coming weeks. This guides what posts are in-scope and prevents off-topic content.

## Specification

**Input:**
- Calendar definition (topics, themes, date ranges)
- Query: "Is topic X in-scope for date Y?"

**Output:**
- Calendar metadata (current active topics, upcoming campaigns)
- In-scope/out-of-scope verdict for proposed posts
- Calendar summary for weekly reporting

**Behavior:**
- Store calendar as simple, version-controlled data structure (YAML or markdown)
- Define topics/campaigns with date ranges and responsible parties
- Provide lookup: given proposed topic, return whether in-calendar
- Flag out-of-calendar topics for Juno escalation (stop block)
- Support ad-hoc calendar amendments via GitHub Issues
- Track calendar history in git

**Calendar fields:**
- Topic/campaign name
- Description
- Date range (start, end)
- Assigned party (Juno, Mercury, etc.)
- Status (active, pending, completed)
- Related links (GitHub issues, docs)

## Dependencies

- GitHub Issues (assignment and status updates)
- Version control (git)

## Testing

Acceptance criteria:
- [ ] Calendar readable and editable as text
- [ ] Lookup accurate for in-scope/out-of-scope
- [ ] Calendar history auditable in git
- [ ] Supports date range queries
- [ ] Integrates with stop block validation (Argus)
- [ ] Weekly summary generation works

## Status Note

Content calendar mentioned in CLAUDE.md but not yet formalized as structured data.
