---
post: "Not Your Keys, Not Your Authorization"
source: ~/.faber/posts/2026-04-26-not-your-keys.md
date: 2026-04-26
status: PENDING — post in progress (GPG vs. API tokens)
prepared_by: Mercury
pillar: Reality
series: "Reality Pillar"
day: 26
---

# Distribution Plan: "Not Your Keys, Not Your Authorization"

**Hold until post is finalized.** The post exists in `~/.faber/posts/2026-04-26-not-your-keys.md` with a complete draft. Distribution plan is staged here so it is ready to fire immediately upon completion.

**Why this piece distributes well:** The GitGuardian number (28.65 million new hardcoded secrets in public GitHub repos in 2025, 34% YoY increase) is the kind of stat that gets cited in comment threads for years. The Okta 2023 breach post-mortem section names a specific, well-documented event and follows the trust chain precisely to its failure point. The "GPG setup is a one-time cost; responsible token hygiene is a recurring weekly overhead forever" comparison has never been made this directly in public — it will be quoted. The post is honest about GPG limitations (clearsign deprecation, Layer 2 gap) while making the sovereignty argument correctly.

---

## Pre-Distribution Checklist

- [ ] Post finalized by Faber
- [ ] Veritas review (once post is complete)
- [ ] koad approves distribution
- [ ] Confirm GitGuardian figures are from the most recent available report (State of Secrets Sprawl 2026)
- [ ] Confirm Okta breach facts match SEC filing and Cloudflare post-mortem (sec.okta.com + Cloudflare blog)
- [ ] Confirm Biscuit project URL (biscuitsec.org) resolves
- [ ] Confirm blog URL resolves before HN submission
- [ ] Confirm Day 25 post is live (post footer references it)

---

## Platform Plans

### 1. HackerNews

**Primary channel.** The token sprawl angle (28.65M new hardcoded secrets, 34% YoY), the Okta breach post-mortem, and the GPG overhead comparison will all generate substantive HN discussion. The security segment will engage with the Okta analysis. The developer tools segment will engage with the "GPG overhead vs token hygiene overhead" comparison.

**Submit as:** Link post

**Title:**
```
28.65M hardcoded secrets added to GitHub in 2025 — and why the token model is structurally responsible
```

**Alt title:**
```
GPG vs. API tokens for agent authorization: the overhead comparison nobody makes
```

**Why this title:** The GitGuardian stat is the hook. It's a large, specific, sourced number that positions the post as having done the research. The secondary title works better if the primary reads as sensationalist.

**Submission URL:** link to published blog post on kingofalldata.com

**Submission comment (paste in the HN text field):**
```
Day 26 of building koad:io in public.

The prompt: why does our agent authorization infrastructure use GPG when
you've been perfectly happy with JWTs and API keys for your whole career?

The framing most posts don't use: compare the actual overhead.

GPG initial setup: 1–3 hours, one-time. With a YubiKey, daily friction is
minimal (touch to sign).

Responsible token hygiene for a moderately integrated developer: 20–50+
distinct secrets, each with its own rotation cadence (OWASP recommends
weekly–daily for high-privilege keys), storage location, and revocation
procedure. Indefinitely.

At a one-year time horizon, GPG is very likely lower total overhead. That
comparison almost never gets made.

The Okta 2023 breach section traces the trust chain failure precisely:
Cloudflare did nothing wrong. Their tokens were valid. Their issuer was
the failure point. That's the structural property of OAuth, not an Okta
failure specifically.

The post also names GPG's honest limitations (clearsign deprecation, Layer 2
delegation gap) and where Biscuit tokens fit in the evolution path.

Happy to discuss the threat model comparison, the Okta post-mortem details,
or the Biscuit/UCAN Layer 2 question.
```

**Timing:** Monday, 09:00–10:00 PT, the week of publication (once post is finalized)

**Expected engagement:** High. Security posts with specific breach post-mortems and sourced statistics perform consistently well on HN. Expect: "GPG UX is still terrible regardless of setup time" (acknowledged in post), "JWTs are fine if you do them right" (the post isn't arguing against JWTs for their designed use case), "the Okta breach was an exceptional event" (the Cloudflare disclosure is independently sourced), and interest in the Biscuit token section. The "30+ API tokens vs GPG key" comparison will be the most quoted line in the thread.

**Edits needed:** None pending post finalization. Verify Okta and GitGuardian figures one more time before submitting.

---

### 2. r/netsec

**Subreddit:** r/netsec (130k members)

**Title:**
```
The structural revocation problem in JWTs (and why GPG revocation works differently)
```

**Alt title:**
```
Not your keys, not your authorization: the OAuth trust chain and the Okta breach post-mortem
```

**Post type:** Link post → published blog URL. Flair: "Article" or "Discussion"

**Body text:**
```
Day 26 of building koad:io in public.

The post starts from a real number: 28.65 million new hardcoded secrets
added to public GitHub repos in 2025. That's 34% YoY — and 32.2% of
private repositories contain at least one hardcoded secret. This is not
careless developers. It's a structural property of managing 20–50+ distinct
secrets per developer at OWASP rotation cadences.

From there: the JWT revocation problem (not a JWT bug — the stateless design
means real revocation requires server state), the Okta 2023 breach as a
clean case study in trust chain failure (Cloudflare did nothing wrong; their
issuer was the failure point), and why the OAuth/OIDC vendor lock-in vector
is cryptographic, not just contractual.

The GPG tradeoffs are named honestly: clearsign deprecation, Layer 2
delegation gap, UX overhead. The post makes the case that the initial setup
cost is miscompared — it should be compared against the ongoing token hygiene
overhead, not against the zero-effort default of hardcoding secrets.

Biscuit tokens as the Layer 2 evolution path is covered in the last section.

[link]
```

**Timing:** Same day as HN, 4–6 hours after HN submission

**Edits needed:** None. Confirm r/netsec rules for link posts day-of.

---

### 3. Dev.to

**Post type:** Cross-post (canonical URL set to kingofalldata.com)

**Title:**
```
GPG vs. API Tokens: The Overhead Comparison Nobody Makes
```

**Tags:** `security`, `cryptography`, `ai`, `devops`

**Intro to add above the post body:**
```
*Day 26 of building koad:io in public — 15 AI agents running as git repos on
a Mac Mini. This is the security-focused post in the series: why the
authorization layer is built on GPG rather than JWTs, with honest accounting
of both.*
```

**Timing:** Same day as HN, 14:00 PT

**Edits needed:** Add canonical URL, series intro, and tags. Confirm finalized post content is used for cross-post.

---

### 4. Mastodon (infosec.exchange)

**Post text:**
```
28.65M new hardcoded secrets on GitHub in 2025. The cause isn't careless
developers — it's the structural overhead of managing 20–50 distinct secrets
per developer responsibly.

GPG initial setup: 2–3 hours, one time. That comparison almost never gets
made.

Day 26 of building koad:io in public.

[link]

#cryptography #security #selfhosted #AIagents
```

**Timing:** Monday, 10:00 PT

**Edits needed:** Confirm hashtag traction on infosec.exchange day-of.

---

## Cross-Post Sequence

| Platform | Timing | Notes |
|----------|--------|-------|
| HackerNews | Monday 09:00–10:00 PT | Primary channel |
| Mastodon (infosec.exchange) | Monday 10:00 PT | Infosec audience |
| r/netsec | Monday 4–6 hours after HN | Security-focused audience |
| Dev.to | Monday 14:00 PT | After HN traction visible |

---

## What Is Blocked

- Post not yet finalized — all distribution held
- Veritas review pending post completion
- Blog PR #1 merge (live URL required)
- HN credentials (#11)
- Dev.to credentials (#11)

Reddit (r/netsec) and Mastodon can fire with koad's existing accounts once blog URL is live.

**Note:** Distribution plan is staged and ready. When Faber confirms post is complete and Veritas approves, this plan fires with no further preparation needed.

---

## Platform-Specific Risks

**HackerNews:**
- GitGuardian stat sourcing: the number is from the State of Secrets Sprawl 2026 report. Confirm the exact figure from the primary source before submitting — a wrong number in a security post will surface in the thread.
- Okta breach details: the November 2023 expanded disclosure (all customers affected) is the key fact. Verify against sec.okta.com and the Cloudflare independent disclosure before submitting.
- "GPG UX is still terrible" is the most likely pushback — acknowledged in the post. Do not engage defensively. The comparison is overhead at a one-year time horizon, not ergonomics in isolation.

**r/netsec:**
- Rule check day-of. The Okta post-mortem section will be the hook for this audience — make sure it's in the submission body text.

**Dev.to:**
- Set canonical URL. This post will attract search traffic on GPG key management and agent authorization — losing that to Dev.to is a significant SEO cost.

---

## After Distribution

- The GitGuardian stat and the "GPG overhead vs token hygiene overhead" comparison are the two most quotable lines — monitor for these in comment threads and flag if they generate significant pickup
- Flag to Faber if Dev.to or HN engagement surfaces demand for a "step-by-step: set up your GPG key and YubiKey for agent authorization" practical guide — Rufus is the right author for that post
- The Biscuit/UCAN section may generate questions about adoption timeline — escalate to Juno before responding to anything that sounds like a partnership inquiry
