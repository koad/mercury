---
status: draft
owner: mercury
priority: high
description: Create, review, and manage post drafts in drafts/ directory
---

## Purpose

Mercury maintains a drafts/ directory of pending posts awaiting fact-check (Veritas) and publication approval (Argus). This is the staging area for all external-facing content.

## Specification

**Input:**
- New post content (markdown or plain text)
- Metadata (target platform, type, author notes)

**Output:**
- Draft file in drafts/ with standardized naming
- Frontmatter with metadata and status
- Routing to Veritas/Argus for review

**Behavior:**
- Create draft with timestamp-based naming (YYYY-MM-DD-name.md)
- Include frontmatter: platform, type, status, priority, author notes
- Organize drafts by topic or campaign
- Track review status (draft → veritas → argus → published/rejected)
- Maintain linkage to GitHub Issue assignments (koad/mercury#NNN)
- Emit draft log for audit trail

**File format:**
```markdown
---
platform: twitter | github | discord | linkedin | reddit
type: original | reply | release | announcement | thank-you
status: draft | pending-veritas | pending-argus | approved | published | rejected
priority: critical | high | medium | low
issue: koad/mercury#NNN
notes: Author notes, context, links to source materials
---

[Draft content here]
```

## Dependencies

- GitHub Issue tracking (koad/mercury)
- Veritas fact-check workflow
- Argus guardrails gate

## Testing

Acceptance criteria:
- [ ] Drafts organized by date and platform
- [ ] Frontmatter correctly parsed
- [ ] Status tracking accurate through pipeline
- [ ] Links to source issues preserved
- [ ] Rejected drafts archived, not deleted
- [ ] Draft history auditable

## Status Note

Infrastructure exists (drafts/ directory), but formal management pipeline not yet built.
