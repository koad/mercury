---
status: draft
owner: mercury
priority: high
description: Track community mentions, replies, and engagement metrics
---

## Purpose

Mercury monitors mentions, replies, and engagement across all platforms to maintain relationships and respond substantively. CLAUDE.md states "Relationships over reach. Remember people."

## Specification

**Input:**
- Platform feeds (Twitter mentions, GitHub notifications, Discord reactions, etc.)
- Query: mentions of Mercury/koad:io across platforms
- Engagement metrics (likes, retweets, replies, comments)

**Output:**
- Inbox of pending community mentions
- Engagement summary (reach, sentiment, hot topics)
- Respondable conversations (threads needing Mercury reply)

**Behavior:**
- Poll platforms for new mentions/replies (scheduled)
- Deduplicate across platforms
- Classify engagement type (question, feedback, praise, complaint, spam)
- Prioritize by relevance and relationship value
- Track which mentions have been responded to
- Generate weekly engagement report for Juno
- Maintain addressbook of frequent community members

**Metrics tracked:**
- Post reach (impressions, views)
- Engagement rate (replies, retweets, likes per post)
- Sentiment (positive, neutral, negative mentions)
- Topic trends (what resonates most)
- Relationship value (repeat members, domain experts, influencers)

## Dependencies

- Platform API access (Twitter API, GitHub API, Discord webhook)
- Data storage for engagement logs
- Classification/sentiment analysis (optional)

## Testing

Acceptance criteria:
- [ ] Mentions identified and classified correctly
- [ ] Inbox prioritized by relevance
- [ ] Engagement metrics accurate
- [ ] Weekly reports generated
- [ ] No duplicate mentions
- [ ] Relationship tracking accurate

## Status Note

Currently manual polling via platforms. No automated engagement tracking system yet.
