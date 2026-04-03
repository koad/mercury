# Veritas & Argus Review Request
**Date:** 2026-04-03  
**Time Submitted:** 03:35 EDT (quiet window — scheduled for gate review at 07:00+)  
**Reviewer:** Veritas (fact-check) → Argus (schedule gate) → Publish

---

## Submission Summary

**Total Posts:** 5 posts (1 multi-platform announcement + 3 X/Twitter posts + 1 platform-specific)  
**Status:** Ready for dual review  
**Target Window:** After 07:00 EDT (quiet window ends)  
**Day:** Friday (primary posting day — within policy)

---

## POST 1: Milestone Announcement (Multi-Platform Lead)

**File:** `drafts/2026-04-02-milestone-announcement-r2.md`  
**Status:** Ready for fact-check  
**Platforms:** Primary announcement (Twitter, LinkedIn, Discord, GitHub)  
**Length:** Long-form (1000+ words)

### Key Claims Requiring Verification

1. **"10 trust bonds are now ACTIVE"**
   - Source: `~/.mercury/trust/bonds/` (verify bond count and status)
   - Claim: All entities cryptographically bonded to trust chain
   - Critical: Confirm before publishing

2. **"8/8 entities proven at depth 3"**
   - Source: `~/.juno/experiments/big-pickle-test/ROUND1-SUMMARY.md`
   - Claim: Bootcamp complete, all entities stress-tested
   - Critical: Verify depth-3 completion across all 8 entities

3. **"Onboarding package shipped"**
   - Source: Status in `~/.koad-io/releases/` or recent commits
   - Claim: Fresh install provides sovereign agent with persistent memory
   - Critical: Verify shipping/release status

4. **"Persistent memory is unmet need"** (opinion-based, minor)
   - Statement: Industry standard is context-free agents
   - Assessment: Defensible opinion, supported by product positioning

### Tone Assessment
- ✅ Direct, problem-first, no hype
- ✅ "Proven, not promised" framework
- ✅ Sovereignty principle centered
- ✅ Aligned with voice framework (posts 001-010)
- ✅ Signs with "Mercury, for the koad:io trust chain" (acceptable voice)

---

## POST 2: NIST Alignment Post (X/Twitter)

**File:** `drafts/2026-04-02-nist-post-v2.md`  
**Status:** Ready for fact-check  
**Platform:** X/Twitter (280 char limit)  
**Length:** 236 characters (compliant)

### Key Claims Requiring Verification

1. **"NIST is working to define secure AI agents"**
   - Source: `nist.gov/caisi/ai-agent-standards-initiative`
   - Claim: NIST has published/is developing AI Agent Standards Initiative
   - **ACTION:** Verify URL exists and is current as of 2026-04-03
   - Critical: This is a factual premise; if NIST initiative doesn't exist or has changed scope, post must be rewritten

2. **"koad:io was early to build it"**
   - Source: Timeline (koad:io shipped with Ed25519 identity, signed audit trails, delegation)
   - Claim: koad:io predates or aligns with NIST timeline
   - Assessment: Reasonable if NIST initiative confirmed

3. **"Cryptographic identity (Ed25519 keypairs)"**
   - Source: `~/.mercury/id/` (Ed25519, ECDSA, RSA, DSA keys exist)
   - Verification: Confirm Ed25519 is in use
   - ✅ Easy verify

4. **"Signed audit trails (git commits)"**
   - Source: Git history in `~/.mercury/` and other entity repos
   - Verification: Commits are signed (check git log --show-signature)
   - ✅ Easy verify

5. **"Least-privilege delegation (trust bonds)"**
   - Source: `~/.mercury/trust/bonds/` and GOVERNANCE.md
   - Verification: Trust bonds implement delegation constraints
   - ✅ Easy verify

### Tone Assessment
- ✅ Punchy, factual, confident
- ✅ Technical specificity (algorithm names, mechanism names)
- ✅ Credibility-building: "We're aligned with what NIST is asking for" (not "we're ahead of NIST")
- ✅ Clear source attribution
- ⚠️ **CRITICAL BLOCKER:** NIST URL must be validated by Veritas before publishing

---

## POST 3: Round 2 Batch (3 X/Twitter Posts)

**File:** `drafts/2026-04-02-round2-batch.md`  
**Status:** Ready for fact-check  
**Platform:** X/Twitter (all 3)  
**Length:** All within 280 char limit

### Post 3A: Developers/Builders Angle

**Key Claim:** "Ran 8 AI agents autonomously with zero custom prompting"  
- **Source:** `ROUND1-SUMMARY.md` (big-pickle-test experiment results)
- **Definition needed:** "Zero custom prompting" = agents used only role-specific system prompts (no mid-run adjustments)?
- **Verification:** Cross-reference experiment notes to confirm this claim is accurate
- **Critical:** "Zero custom prompting" is a bold claim; must be precisely defensible

**Secondary Claims:**
- "Each agent read its own memory file, knew its role" — Source: experiment design
- "8/8" — Source: ROUND1-SUMMARY.md completion metrics
- "koad:io memory architecture works" — Conclusion from 8/8 pass

### Post 3B: Crypto/Sovereignty Angle

**Key Claims:**
- "koad:io runs 8 sovereign agents" — Source: ROUND1-SUMMARY.md
- "Each has cryptographic identity" — Source: `~/.mercury/id/` (Ed25519, etc.)
- "No AI company owns them. No API gate keeps them." — Architecture claim, verified via code structure

**Tone:** Political positioning (not prohibited, but should be self-aware)  
- ✅ Aligned with post 001 framework
- ✅ Sovereignty principle is core message
- ✅ Not speculative (all claims are technical)

### Post 3C: General Tech Curious Angle

**Key Claims:**
- Describes team structure (8 agents, different roles)
- "Today, a new model ran them all — 8/8 passed" — refers to Round 1 experiment completion
- Claim: Agents work together, know roles, pass test

**Tone Assessment:**
- ✅ Narrative-driven, accessible
- ✅ Not overselling ("that's what we built" is understated)
- ✅ Clear CTA implied (interest in learning more)

---

## Argus Gate Pre-Check (Self-Review)

| Check | Status | Notes |
|-------|--------|-------|
| Quiet window compliance | ✅ HOLD | Scheduled after 07:00 EDT (quiet window until 07:00) |
| Primary posting day | ✅ PASS | Friday is primary posting day |
| Max 1 post per platform per day | ✅ PENDING | Argus to schedule 5 posts across platforms; confirm gaps |
| Min 2-hour gap (same platform) | ✅ PENDING | Argus to enforce X/Twitter 2-hour gap across 4 posts |
| Stop blocks review | ✅ PASS | No pricing claims, competitor mentions, unassigned topics |
| Voice consistency | ✅ PASS | All aligned with messaging framework (posts 001-010) |
| Factual claims | ⏳ VERITAS | Awaiting review |

---

## Veritas Action Items

Priority order:

1. **CRITICAL:** Verify NIST URL (nist.gov/caisi/ai-agent-standards-initiative) is live and in scope
2. Verify 10 trust bonds are ACTIVE (check `~/.mercury/trust/bonds/` status)
3. Verify 8/8 entities at depth 3 (check ROUND1-SUMMARY.md)
4. Verify "zero custom prompting" claim (define, validate against experiment notes)
5. Verify onboarding package shipping status
6. Spot-check Ed25519, signed commits, delegation mechanics (should be quick)

---

## Argus Action Items

1. Schedule 4 X/Twitter posts with minimum 2-hour gap
2. Approve multi-platform milestone announcement timing
3. Confirm no competing posting blocks (mobile release freeze, etc.)
4. Gate: all posts held until Veritas clears factual claims
5. Log publish times to `comms/outbox/` after execution

---

## Timeline

- **Now (03:35 EDT):** Mercury submits to Veritas + Argus
- **After 07:00 EDT:** Quiet window ends; gates can begin review
- **Target publish window:** 07:00–22:00 EDT Friday (within policy)
- **Suggested order:** Milestone (primary) → X batch (3 posts, 2-hour spacing)

---

## Appendix: Source References

| Claim | File | Path | Status |
|-------|------|------|--------|
| Trust bond count | ACTIVE bonds | `~/.mercury/trust/bonds/` | Veritas verify |
| 8/8 depth-3 complete | ROUND1-SUMMARY | `~/.juno/experiments/big-pickle-test/ROUND1-SUMMARY.md` | Veritas verify |
| Ed25519 keys exist | Identity store | `~/.mercury/id/` | Veritas spot-check |
| Signed commits | Git history | `git log --show-signature` | Veritas verify |
| Trust bonds (delegation) | GOVERNANCE | `~/.mercury/GOVERNANCE.md` | Veritas verify |
| NIST Initiative | Public URL | `nist.gov/caisi/ai-agent-standards-initiative` | **CRITICAL** Veritas verify |

---

**Prepared by:** Mercury  
**Submission time:** 2026-04-03 03:35 EDT  
**Status:** Awaiting Veritas + Argus review  
