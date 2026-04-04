# Incident Response Playbook: Publishing

**Owner:** Mercury  
**Last updated:** 2026-04-04  
**Status:** Active

---

## Severity Levels

| Level | Definition | Examples |
|---|---|---|
| **P3 — Low** | Cosmetic or minor quality issue; no reputational risk | Typo, formatting error, broken link |
| **P2 — Medium** | Factual error or misleading claim; may require correction | Wrong stat, misattributed quote, incorrect date |
| **P1 — High** | Misstatement about a partner, sponsor, or public figure; potentially damaging | Incorrect claims about a named person or org |
| **P0 — Crisis** | Hostile escalation, security incident, account compromise, or mass bad-faith amplification | Account hacked, post going viral with wrong info, coordinated harassment |

---

## P3 — Low Severity

**Trigger:** Typo, bad formatting, broken link, minor wording issue

**Response:**
1. If platform allows edits (e.g., LinkedIn, Reddit): edit in place. Log in post's YAML record under `corrections:`.
2. If platform does not allow edits (Twitter/X): judgment call — if the error is invisible to most readers, log and move on. If it affects clarity, proceed as P2.
3. No announcement required.
4. Update publish record: add `corrections:` entry with timestamp and description.

---

## P2 — Medium Severity

**Trigger:** Factual error, misleading framing, or wrong attribution caught after publishing

**Response:**
1. Mercury stops all other posting immediately.
2. Mercury files issue on `koad/juno` tagged `p2-correction` within 1 hour of discovery. Include: post URL, error description, what correct information is.
3. Mercury does NOT post a correction independently — Juno assigns the correction post.
4. If platform allows: edit original post. Note edit in the post (`[Edited: correction below]` or platform equivalent).
5. Correction post (if required by Juno): drafted by Mercury, goes through full Veritas + Argus pipeline — no shortcuts for corrections.
6. Publish record: update `status: corrected`, add `corrections:` entry, add `incident_ref:`.
7. Post-mortem: brief entry in `ops/incident-log.md` — what went wrong, why Veritas didn't catch it, what changes.

---

## P1 — High Severity

**Trigger:** Misstatement about a partner, sponsor, named individual, or koad:io itself that could cause reputational or legal risk

**Response:**
1. Mercury stops all posting across all platforms.
2. Immediately escalate to koad directly (comment on post issue, flag `p1-escalation`). Do not wait.
3. Do NOT post a correction or retraction without koad's direction.
4. If koad is reachable: koad decides whether to delete, correct, or issue a retraction statement.
5. Mercury drafts a correction or retraction per koad's instructions — goes through full pipeline.
6. Publish record: update status, full corrections log, incident ref.
7. Post-mortem required: `ops/incident-log.md` with detailed timeline, root cause, and process changes.

**Mercury does not:**
- Speak publicly about the incident without koad direction
- Contact the affected party without koad direction
- Delete posts without koad direction (deletion is sometimes worse than correction)

---

## P0 — Crisis

**Trigger:** Account compromise, hostile viral amplification, coordinated harassment, platform account action (suspension/ban)

**Response:**
1. Mercury stops all posting immediately.
2. Escalate to koad within minutes. This is a Hard Stop — koad must be present.
3. Do not engage with hostile actors. Do not acknowledge the incident publicly until koad approves a statement.
4. If account compromise suspected: koad handles credential rotation (Hard Stop per CLAUDE.md).
5. Mercury documents the timeline in real-time in `ops/incident-log.md`: what happened, when, what accounts/posts are affected.
6. Communication plan (if public response needed): koad drafts or approves; Mercury does not author crisis comms independently.
7. Platform contacts (if account action): koad or koad-designated person handles. Mercury does not contact platforms.

**Post-crisis:**
- Full post-mortem within 48h
- Process review: what failed, what to change
- Trust/relationship review if a specific person or org was involved

---

## Incident Log Format

File: `ops/incident-log.md`

Each incident gets an entry:

```markdown
## YYYY-MM-DD — [P3/P2/P1/P0] — [brief title]

**Detected:** YYYY-MM-DD HH:MM TZ  
**Detected by:** [Mercury / community member / koad / other]  
**Post:** [URL]  
**Platform:** [platform]  
**Juno issue:** koad/mercury#XX  

### What happened
[Description of the error or incident]

### Timeline
- HH:MM — [action]
- HH:MM — [action]

### Root cause
[Why this happened — process failure, oversight, bad source, etc.]

### Resolution
[What was done — edit, correction post, retraction, no action]

### Process changes
[What we're doing differently going forward]
```

---

## Quick Reference Card

```
Something went wrong with a post.

Is it a typo or broken link?
  → P3. Edit if possible. Log it. Move on.

Is there a factual error?
  → P2. Stop posting. File koad/juno issue. Wait for correction assignment.

Did we misstate something about a real person or org?
  → P1. Stop everything. Ping koad immediately. Do not post anything.

Is the account compromised or are we in a PR crisis?
  → P0. Hard stop. koad must be present. Say nothing publicly.
```
