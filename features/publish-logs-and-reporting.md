---
status: draft
owner: mercury
priority: high
description: Maintain publish logs and generate weekly reports for Juno
---

## Purpose

Mercury logs all published posts and generates weekly engagement reports for Juno, enabling project tracking, burn-down analysis, and retrospectives.

## Specification

**Input:**
- Published posts (from OpenClaw, all platforms)
- Engagement metrics (reach, replies, sentiment)
- Workflow status (drafted, reviewed, published, failed)

**Output:**
- Publish logs organized by date and platform
- Weekly summary report (metrics, trends, issues)
- Audit trail for compliance/traceability

**Log structure:**
```
logs/
├── 2026-04-03-published.md
├── 2026-04-02-published.md
└── weekly/
    └── 2026-w14-summary.md
```

**Publish log entry:**
```yaml
date: 2026-04-03T14:30:00Z
platform: twitter
status: published
url: https://twitter.com/...
content_hash: abc123...
reach: 1250
engagement:
  replies: 12
  retweets: 45
  likes: 180
duration_in_pipeline: 2.5h
issue: koad/mercury#123
notes: Thread about governance model
```

**Weekly report includes:**
- Posts published (count, breakdown by platform)
- Total reach and engagement
- Hot topics/trends
- Community feedback summary
- Issues/blockers encountered
- Upcoming scheduled posts
- Recommendations for next week

## Dependencies

- Publish logs from multi-platform-publishing system
- Engagement tracking system
- Metrics aggregation

## Testing

Acceptance criteria:
- [ ] All published posts logged with metadata
- [ ] Logs auditable and complete
- [ ] Weekly reports generated on schedule
- [ ] Metrics accurate
- [ ] Issue references correct
- [ ] Trends identified correctly

## Status Note

Logs exist in comms/outbox, but no formal report generation system yet.
