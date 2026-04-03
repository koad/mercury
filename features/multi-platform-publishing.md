---
status: draft
owner: mercury
priority: critical
description: Publish content to Twitter/X, GitHub, Discord, LinkedIn, and Reddit
---

## Purpose

Mercury must distribute content across multiple platforms (Twitter/X, GitHub, Discord, LinkedIn, Reddit) according to platform-specific conventions, audience, and voice. This is the core external-facing capability.

## Specification

**Input:**
- Post content (text, optional media/links)
- Target platform(s)
- Post type (original, reply, announcement, release note)
- Metadata (scheduled time, audience segment)

**Output:**
- Success/failure status per platform
- Published URL(s)
- Publish log entry

**Behavior:**
- Validate content against platform constraints (character limits, format)
- Apply platform-specific formatting (hashtags, mentions, threading)
- Check publication against Argus guardrails (schedule, stop blocks)
- Handle platform-specific authentication via OpenClaw (fourty4 access)
- Log all publications with timestamp, platform, content hash
- Emit success/failure report

**Platform-specific conventions:**
- **Twitter/X:** Threads, @mentions, hashtags, media attachments
- **GitHub:** Release notes, announcements, sponsor thank-yous
- **Discord:** Community posts, formatted messages
- **LinkedIn:** Longer-form content, professional positioning
- **Reddit:** Organic engagement, subreddit conventions

## Dependencies

- Argus guardrails validation (VESTA-SPEC-012 or similar)
- OpenClaw integration (fourty4 platform credential system)
- Verification workflow (Veritas + Argus approval)

## Testing

Acceptance criteria:
- [ ] Can publish to each platform without manual intervention
- [ ] Platform-specific formatting applied correctly
- [ ] Publish logs record all metadata (platform, timestamp, URL)
- [ ] Fails gracefully if platform credentials unavailable
- [ ] Respects scheduled publication times
- [ ] Enforces Argus guardrails before publishing

## Status Note

Not yet built. Depends on OpenClaw integration and Argus guardrails implementation.
