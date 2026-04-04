---
title: "Content Calendar — Q2 2026"
created: 2026-04-03
updated: 2026-04-03
owner: mercury
---

# Mercury Content Calendar — Q2 2026

Planned campaigns, topics, and posting themes for April–June 2026.

---

## Active Campaigns

### 1. Alice Launch (Primary — April 2026)
**Status:** In-progress  
**Owner:** Mercury + Faber  
**Description:** Introduce Alice (sovereign AI guide) to builders and developers as top-of-funnel teaching tool  

**Topics:**
- Alice's curriculum (12 levels, free, personal teaching)
- How to graduate into sovereign operations
- Sponsor announcements (funding Alice's reach)

**Posting rhythm:** Mon, Wed, Fri (Twitter/X threads, LinkedIn longer-form, Reddit organic engagement)  
**Completed:** v1 sponsor messaging (2026-04-03), Alice social posts drafted  

**Next:** Argus gate on sponsor outreach, then begin distribution  

---

### 2. Journalist Outreach (NEW — April 2026)
**Status:** Draft → Verification → Argus gate → Distribution  
**Owner:** Mercury + Sibyl (identified journalists)  
**Description:** Introduce context bubbles to independent journalists as reporting tool for verification and reader trust  

**Topic:** Context bubbles (VESTA-SPEC-016) enable verifiable narratives — journalists' reasoning is the record  

**Core message:** "Your stories, your reasoning, sovereign and verifiable" (not "run your own AI")

**Proof case:** The $200 laptop story (koad:io's 7-day gestation rendered as context bubble)

**Distribution channels:**
- Mastodon (journalism communities, #investigativejournalism)
- Ghost network (independent newsletters)
- Substack (direct engagement with investigative Substack writers)
- NiemanLab (editorial, comments on journalism tools articles)
- Press Gazette (tip to editorial)
- The Fix / Poynter (comments on verification/ethics pieces)

**Posting rhythm:** 3–5 personalized outreaches per week (staggered, not broadcast)  
**Timeline:**
- Week 1 (Apr 3–9): 3–5 high-relevance personal outreaches
- Week 2 (Apr 10–16): Community engagement (Mastodon)
- Week 3 (Apr 17–23): Newsletter outreach
- Week 4+ (Apr 24+): Adapt based on feedback

**Variants:** Investigative reporter, data journalist, political reporter, freelancer angles

**Success metrics:** Conversations started, test context bubbles created, adoption  

**Draft:** `~/drafts/2026-04-03-journalist-outreach.md`  
**Status:** Awaiting Veritas (fact-check) and Argus (scope/tone) before distribution

---

### 3. Sponsor Recognition (April–June)
**Status:** Ongoing  
**Owner:** Mercury  
**Description:** Thank sponsors by name, monthly. Quarterly deep-dive updates on what their funding enabled.

**Posting:** Monthly on first Friday (brief), quarterly on milestone date (longer-form)  
**Tone:** Specific, grateful, grounded in what they funded  

**Examples:** [GitHub Sponsors](https://github.com/sponsors/koad)

---

### 4. Technical Deep-Dives (May–June)
**Status:** Pending (concept, not yet scheduled)  
**Owner:** Mercury + Vulcan  
**Description:** Explain koad:io architecture and design decisions to builders  

**Topics (pending Faber review):**
- Trust bonds and cryptographic authorization
- Entity inheritance and git-based versioning
- Memory system (persistent, cross-session)
- Framework + entity two-layer architecture

**Format:** LinkedIn (technical, 5 paragraphs), GitHub (release notes), Reddit (detailed comments in r/LocalLLaMA, r/OpenAI)  
**Timing:** Stagger one per week, May onwards

---

## Posting Rules (Per CLAUDE.md)

| Rule | Limit |
|------|-------|
| Max original posts/day (all platforms) | 3 |
| Max original posts/day (per platform) | 1 |
| Minimum gap between same platform | 2 hours |
| Quiet window (no posting) | 00:00–07:00 local |
| Primary posting days | Mon / Wed / Fri |
| Engagement-only days (replies, no originals) | Tue / Thu |
| Weekend | No originals unless Juno assigns |

---

## Out of Scope (Stop Blocks)

These require explicit Juno approval before proceeding:
- Pricing, payment tiers, revenue claims
- Statistics, percentages, data points (even Veritas-verified)
- Competitor mentions
- Legal, regulatory, compliance content
- Hostile account responses
- Topics not on this calendar
- Failures, outages, incidents
- Press/media/journalist *replies* (outreach is different — Journalist Outreach campaign is in-scope)
- Anything implying commitment, deadline, or guarantee

---

## Publishing Pipeline

```
Mercury drafts
    ↓
Veritas (fact-check — required for factual claims)
    ↓
Argus (schedule, stop blocks, scope, tone)
    ↓
OpenClaw → platform
    ↓
Argus logs, weekly report → Juno
```

Do not bypass any step.

---

## Weekly Reporting

Every Friday (or as assigned):
- Posts published (count, platforms, engagement)
- Drafts pending review (count, ETA)
- Scheduled posts (next week)
- Campaign progress (which are on track?)
- Blockers or escalations for Juno

---

## Amendments

To add topics or change posting cadence, file an issue on `koad/juno` with:
- Topic/campaign name
- Description
- Date range
- Rationale (why this, why now)
- Which campaign it supports (if any)

Changes require Juno approval before posting.
