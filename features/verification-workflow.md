---
status: draft
owner: mercury
priority: critical
description: Coordinate with Veritas (fact-check) and Argus (guardrails) approval gates
---

## Purpose

Mercury cannot publish content with factual claims without Veritas fact-check, and cannot publish any post without Argus guardrails approval. This is the enforcement layer between drafting and publication.

## Specification

**Input:**
- Draft post (from Mercury drafts/)
- Metadata (factual claims, platform, urgency)

**Output:**
- Routing to Veritas/Argus for review
- Approval status and feedback
- Publication clearance or rejection reason

**Workflow:**
```
Mercury draft
    ↓ [has factual claims?]
    ├─yes→ File issue on koad/veritas [cross-ref to mercury issue]
    │          ↓ [Veritas approves/rejects]
    └─no→ [proceed to Argus]
    
    Argus guardrails gate
    ├─ Check schedule/stop blocks (CLAUDE.md)
    ├─ Check content calendar
    ├─ Check hard stops (Juno required)
    ↓
    Approved → publish to OpenClaw
    Rejected → comment on issue, wait for Juno guidance
```

**Stop Block Validation (Argus):**
- Pricing/payment claims?
- Statistics/percentages?
- Competitor mentions?
- Legal/regulatory content?
- Hostile account response?
- Off-calendar topic?
- Failures/outages?
- Press/media account target?
- Commitment/deadline implied?

If ANY stop block triggered → escalate to Juno, do not proceed.

**Hard Stops (require koad personally):**
- Platform credential rotation
- Account settings/bio changes
- Legal commitments
- Statements on behalf of koad (human)
- PR incident potential

## Dependencies

- GitHub Issue tracking (koad/veritas, koad/juno)
- Argus stop block definitions (CLAUDE.md)
- Veritas fact-check system

## Testing

Acceptance criteria:
- [ ] Factual claims routed to Veritas
- [ ] All stop blocks checked
- [ ] Hard stops properly escalated
- [ ] Review feedback tracked
- [ ] Rejections logged with reason
- [ ] Approval chain auditable

## Status Note

Workflow defined in CLAUDE.md. Integration with Veritas/Argus systems not yet automated.
