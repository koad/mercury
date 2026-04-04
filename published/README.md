# Publish Log and Post Archive

This directory is the authoritative record of every post Mercury has published.

## Directory Structure

```
published/
  README.md              ← this file
  YYYY/
    MM/
      PLATFORM-SLUG.yaml ← one file per published post
```

Example: `published/2026/04/twitter-entities-on-disk.yaml`

## Post Record Format

Each published post is a YAML file with the following fields:

```yaml
# Required fields
id: mercury-YYYYMMDD-platform-slug      # unique post ID
platform: twitter                        # twitter | github | discord | linkedin | reddit
published_at: 2026-04-04T14:00:00-07:00  # ISO 8601 with timezone
url: https://x.com/...                   # canonical URL of the published post
status: published                        # published | deleted | corrected

# Source chain — every post must have all four
juno_issue: koad/mercury#5               # assignment issue
draft_file: drafts/2026-04-04-twitter-entities.md
veritas_issue: koad/veritas#12           # fact-check approval (or "not_required: no factual claims")
argus_gate: passed                       # passed | blocked (blocked posts never reach published/)

# Content snapshot
title: ""                                # optional: thread title or subject line
body_preview: |                          # first 280 chars of post body
  Entities are running on disk. No vendor...

# Post metadata
thread_count: 1                          # number of posts in thread (1 = single post)
platform_post_id: "1234567890"          # platform's native post ID (for API lookups)
in_reply_to: ""                          # native post ID if this is a reply

# Engagement (update after 24h, 7d, 30d)
metrics:
  snapshot_24h:
    impressions: 0
    engagements: 0
    replies: 0
    reposts: 0
    likes: 0
    updated_at: ""
  snapshot_7d:
    impressions: 0
    engagements: 0
    replies: 0
    reposts: 0
    likes: 0
    updated_at: ""

# Incident record (omit if clean)
# corrections: []
# incident_ref: ""
```

## Process

1. Draft is written → saved to `drafts/`
2. Veritas approves (if factual claims) → cross-ref issue recorded
3. Argus gate passes → gate confirmed in record
4. OpenClaw publishes → platform URL and post ID captured
5. Record written to `published/YYYY/MM/PLATFORM-SLUG.yaml` immediately
6. `git add published/... && git commit && git push` — no delay
7. Comment on originating Juno issue with publish confirmation + URL

## Audit Queries

```bash
# All posts this month
ls published/2026/04/

# All twitter posts
ls published/**/**/twitter-*.yaml

# Posts pending metrics update
grep -r "updated_at: \"\"" published/
```

## Corrections and Deletions

If a post is corrected or deleted after publishing:
- Update `status:` field to `corrected` or `deleted`
- Add `corrections:` list with timestamp, reason, and new URL if applicable
- Add `incident_ref:` pointing to the incident playbook entry
- Never delete the record file — the audit trail is permanent
