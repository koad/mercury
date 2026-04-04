# Fact-Check Process and SLA: Mercury ↔ Veritas

**Owner:** Mercury  
**Last updated:** 2026-04-04  
**Status:** Active

---

## What Requires a Fact-Check

**Always requires Veritas:**
- Statistics, percentages, benchmark numbers (e.g., "2–4× faster")
- Claims about external projects, frameworks, or tools (features, status, adoption)
- Claims about koad:io metrics, user counts, performance, or adoption
- Historical events or dates
- Attributions — quoting or paraphrasing what someone said
- Any "X is the only / first / largest" claim

**Does NOT require Veritas:**
- Opinions, framing, and value judgments ("vLLM is foundational to modern inference" = opinion)
- Descriptions of koad:io's own architecture (Mercury can speak to what we built)
- Announcements of koad:io releases or milestones (confirmed internally before drafting)
- Engagement replies that contain no factual claims

**Judgment call — when in doubt, request Veritas:**
If removing the claim would make the post weaker, it probably needs checking.

---

## SLA

| Request type | Veritas target response | Mercury action if missed |
|---|---|---|
| Standard | 24 hours | Ping once; if no response in 48h, hold post and file issue on `koad/juno` |
| Urgent (time-sensitive post) | 4 hours | Flag `urgent` in request title; if missed, escalate to koad directly |
| Blocking (post already queued) | 2 hours | Immediately escalate to koad |

Urgent requests require a stated reason (e.g., "Scheduled for tomorrow AM — Juno issue #X"). Urgency is not default.

---

## Request Format

File an issue on `koad/veritas` with this template:

```
Title: Fact-check: [brief description] — [draft date] [platform]

## Claims to check

1. "[Exact quote of claim from draft]"
   - Source provided: [yes: link | no]
   - Context: [why we're asserting this]

2. "[Next claim]"
   ...

## Draft reference
File: mercury/drafts/YYYY-MM-DD-platform-slug.md
Mercury issue: koad/mercury#XX

## Timeline
[ ] Standard (24h)
[ ] Urgent (4h) — reason: ___
```

Mercury adds a comment to the originating draft issue with the Veritas cross-reference: `Fact-check requested: koad/veritas#XX`.

---

## Receiving Approval

Veritas closes the issue or comments `APPROVED` / `APPROVED WITH EDITS`.

Mercury:
1. If `APPROVED WITH EDITS`: applies edits to draft, confirms in Veritas issue comment
2. Records Veritas issue number in the draft's front matter: `veritas_issue: koad/veritas#XX`
3. Proceeds to Argus gate

If Veritas responds `BLOCKED`:
- Mercury does not proceed
- Mercury comments on originating Mercury issue: `Veritas BLOCKED — koad/veritas#XX`
- Files issue on `koad/juno` for resolution
- Correction/revision handled as a new draft cycle

---

## Correction Loop

If a factual error is found **after** Veritas approval but **before** publishing:
- Return to Veritas with corrected claim
- Do not republish until re-approved

If found **after** publishing:
- Follow the incident response playbook (`ops/incident-response-playbook.md`)
- File a new Veritas issue for the correction post

---

## Tracking

Every published post's YAML record (`published/YYYY/MM/`) includes:
```yaml
veritas_issue: koad/veritas#XX
# or:
veritas_issue: not_required  # reason: no factual claims
```

This creates an auditable chain: Juno assignment → Mercury draft → Veritas approval → Argus gate → publish record.
