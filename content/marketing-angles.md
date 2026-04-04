# Marketing Angles: Harness-Agnostic + Piping + No Vendor Required

**Source:** koad/mercury#12 (from Vulcan, ref koad/vulcan#7, koad/vulcan#14)  
**Date:** 2026-04-04  
**Status:** Active — angles approved for content development

---

## Overview

Four structural differentiators that no SaaS AI agent vendor can claim. These are not opinions — they are architectural facts about how koad:io works. Each angle maps to a specific audience pain point.

---

## Angle 1: Works with Any Harness

**Core claim:** Your entity is a directory and a CLAUDE.md. The harness is interchangeable — Claude Code, opencode, Ollama, local models, any future tool. No lock-in at the tooling layer.

**Hook:** "Your entity. Your harness. Your choice."

**Why it lands:**  
Every AI agent platform today locks you to their runtime. koad:io separates *identity* from *harness*. The entity persists. The harness is a detail.

**Audience:** Builders who've been burned by platform shutdowns or pricing changes. Developers who want to stay portable.

**Content formats:**
- Twitter/X thread: "Your agent shouldn't be married to a harness." [see draft: 2026-04-XX-twitter-harness-agnostic.md]
- LinkedIn post: "The harness is not the agent" — longer-form explanation for professional audience
- Reddit: r/selfhosted, r/LocalLLaMA — organic post, no product pitch, just the architecture

**Veritas note:** No stats. Architecture description. Standard review applies.

---

## Angle 2: Pipe Harnesses Together

**Core claim:** You can pipe multiple harnesses together to accomplish what no single-vendor tool allows. Compose. Stack. Route.

**Hook:** "Pipe harnesses together. Do things no single-vendor tool will ever let you do."

**Why it lands:**  
Unix philosophy for AI agents. This is a power-user capability that signals technical depth without requiring explanation — developers immediately understand the implication.

**Audience:** Senior engineers, AI tinkerers, open source contributors. People who write shell scripts. People who follow Karpathy.

**Content formats:**
- Twitter/X thread: concrete example of piping two harnesses — what you're doing, what it produces
- Show HN: "I built an agent that routes tasks between Claude Code and a local Ollama model based on cost/capability tradeoff" — not a product pitch, a technical story
- YouTube/Rumble: short screen recording — pipe in action

**Veritas note:** Needs a concrete working example before Veritas review. Do not claim this until we have a reproducible demo.

---

## Angle 3: No Credit Card. No Vendor. Free Models.

**Core claim:** `alice` opens opencode pre-configured with free models. Zero friction to first use. Clone, run, done.

**Hook:** "Clone it. Run it. No credit card. No account. No permission."

**Why it lands:**  
The "you need an API key" assumption is the highest barrier to entry for AI tooling. We eliminate it. This is the best onboarding story in the space.

**Audience:** Developers who are AI-curious but have never set up an agent. People who bounced off ChatGPT plugins or LangChain. Students.

**Content formats:**
- Twitter/X single post: "No credit card. No account. No permission. Clone it and run." + link
- Reddit: r/MachineLearning, r/LocalLLaMA — "I got tired of API keys. Here's what I built."
- LinkedIn: "The onboarding problem with AI agents" — frame the industry problem, then position koad:io

**Veritas note:** Confirm "free models out of the box" is factually accurate for current opencode + alice config before any post. File koad/veritas issue.

---

## Angle 4: The Sovereignty Stack is Complete

**Core claim:** Not just sovereign data — sovereign tooling, sovereign identity, sovereign history. The whole stack. Owns your keys, your memory, your decision log.

**Hook:** "Your agent owns its keys. Its memory. Its history. Not a vendor's copy of it — yours."

**Why it lands:**  
"Local AI" is talked about in terms of privacy (data doesn't leave). koad:io goes further: the entity has cryptographic identity, git-tracked evolution, and a trust chain. This is sovereignty, not just privacy.

**Audience:** Security engineers, privacy advocates, sovereignty/crypto-adjacent tech people, anyone who understands what "not your keys, not your coins" means.

**Content formats:**
- Twitter/X thread: walk through what sovereignty means layer by layer — data, keys, memory, history
- LinkedIn: "Why 'local AI' isn't the same as sovereign AI"
- HN comment: when sovereignty/privacy AI discussions appear, this is the angle to bring in

**Veritas note:** No statistics needed. Architecture claim — standard review.

---

## Execution Notes

- Each angle becomes at least one draft post before the next content calendar cycle
- Angles 1 and 4 can move first — no demo needed, architecture is the proof
- Angle 2 must wait for a working pipe demo (coordinate with Vulcan/koad)
- Angle 3 requires Veritas confirmation on free model availability
- Do not run multiple angles in the same week — one per posting cycle
- LinkedIn versions go longer; Twitter versions stay sharp

---

## Hooks Reference (for copy use)

| Angle | Primary hook | Secondary hook |
|---|---|---|
| Harness-agnostic | "Your entity. Your harness. Your choice." | "The harness is not the agent." |
| Piping | "Pipe harnesses together." | "Do things no single-vendor tool will ever let you do." |
| No vendor | "Clone it. Run it. No credit card. No account. No permission." | "We got tired of API keys." |
| Sovereignty stack | "Your agent owns its keys. Its memory. Its history." | "Not your keys, not your agent." |
