---
post: "Trust Bonds Aren't Policy—They're Cryptography"
source: ~/.faber/posts/2026-04-06-trust-bonds.md
date: 2026-04-06
status: CLEARED — Veritas fact-check complete
prepared_by: Mercury
pillar: Reality
series: "2-Week Reality Proof"
---

# Distribution Plan: "Trust Bonds Aren't Policy—They're Cryptography"

**Cleared for distribution.** Veritas has reviewed and approved. Target distribution: Monday 2026-04-07.

**Why this piece distributes well:** Concrete verification command (`gpg --verify`), real bond files quoted verbatim, and a substantive argument against RBAC. The HN security/crypto audience will engage with the PKI comparison. The "no central authority" argument is debatable in the good way — it will draw technical pushback that keeps the thread alive. The full trust chain diagram and the revocation mechanics are genuinely novel territory for AI agent authorization.

---

## Pre-Distribution Checklist

- [x] Veritas fact-check complete: GPG fingerprint (`A07F8CFECBF6B982EEDAC4F362D5C4866C247E00`), bond file content, entity count (13 bonds, 26 files), trust chain accuracy
- [ ] koad approves distribution
- [ ] Argus gate: all platform submissions
- [ ] Confirm Day 7 post is drafted before distributing — this post points forward in the series footer

---

## Platform Plans

### 1. HackerNews

**Submit as:** Link post (not Show HN — this is an argument, not a demo)

**Title:**
```
GPG-signed authorization files instead of RBAC for AI agent permissions
```

**Alt title:**
```
How we replaced role-based access control with GPG signatures for AI agent authorization
```

**Why not Show HN:** This post is an architectural argument with real files, not a working demo submission. A straight link post with a strong title will perform better than a Show HN framing that sets demo expectations.

**Submission URL:** link to published blog post on kingofalldata.com

**Submission comment (paste in the HN text field):**
```
Day 6 of a 2-week public build log for koad:io — 15 AI agents running on a
Mac Mini, each a git repo with a distinct identity and scope.

The Day 4 post showed the architecture (SSH routing hook, directory structure).
This one covers authorization: each agent's authority is a GPG-signed YAML file
on disk, not a row in a permissions table.

The real koad-to-juno bond is quoted verbatim. The verification command is in
the post — you can check it yourself. The revocation mechanism follows standard
PGP revocation; trust chains cascade on invalidation.

Happy to answer questions about the PKI comparison, the revocation edge cases,
or why we chose files-on-disk over an IAM service.
```

**Timing:** Monday 2026-04-07, 09:00–10:00 PT

**Expected engagement:** PKI/X.509 comparisons, questions about key management (where do private keys live?), pushback on offline revocation ("how do agents check for revocations in real time?"), and "why not use SPIFFE/SVID?" The revocation cascade behavior will generate the most technical discussion. Be ready to engage — one substantive reply per thread.

**Edits needed:** None. Post is written for a technical audience and handles the RBAC comparison directly.

---

### 2. r/selfhosted

**Subreddit:** r/selfhosted (200k members)

**Title:**
```
AI agent authorization without a central authority: GPG-signed files on disk instead of a permissions database
```

**Alt title:**
```
How we handle AI agent permissions on self-hosted hardware: signed files, not RBAC
```

**Post type:** Link post → published blog URL. Flair: "Project" or "Discussion" depending on day-of options.

**Body text (for link post description or if text post required):**
```
Day 6 of building koad:io in public — 15 AI agents on a Mac Mini, no cloud
platform.

The authorization layer: instead of a permissions database or IAM service, each
agent's authority is a GPG-signed YAML file committed to that agent's git repo.
The verification command is `gpg --verify`. No running service required.

The post covers:
- What a trust bond file actually looks like (real bond quoted verbatim)
- How to verify it from scratch (GPG fingerprint included)
- How the trust chain works (koad → Juno → downstream entities)
- Revocation: a new signed file, cascades through the chain
- Why this beats RBAC for agents operating with real authority

The "no central authority" aspect is what the self-hosted crowd will care about.
If the IAM vendor goes down or changes pricing, your agents' authorization still
verifies. The math is the authority.

Full post: [link]
```

**Timing:** Monday 2026-04-07, 11:00–13:00 UTC

**Expected engagement:** Questions about key storage (HSM, hardware key?), whether this works with open-source models (yes — the bond system is model-agnostic), and practical questions about key rotation. This audience is comfortable with GPG; they'll engage with the PKI mechanics directly.

**Edits needed:** None. The self-sovereign authorization angle is central to the post and natural for this audience.

---

### 3. Twitter/X Thread

**Format:** 7-tweet thread

**Thread:**

---

Tweet 1 (hook):
```
Most AI agent authorization is a row in a database.

Someone can edit that row. They can delete it. The agent won't know.

Here's what cryptographic agent authorization looks like instead.
```

Tweet 2 (the problem with RBAC):
```
RBAC requires a central authority: the IAM system, the admin panel, the
permissions table.

If that authority is compromised — or just updated silently — your agents
have new permissions. You might not be told.

The admin who changed the scope left the company last Friday.
```

Tweet 3 (what a trust bond is):
```
In koad:io, agent authorization is a GPG-signed file.

The real koad → Juno bond:
- YAML frontmatter (type, parties, status, expiry)
- Prose authorization statement
- Explicit what-can / what-cannot scope
- PGP signature block at the bottom

Committed to the agent's git repo. Readable by anyone.
```

Tweet 4 (the verification command):
```
To verify Juno is actually authorized:

gpg --recv-keys A07F8CFECBF6B982EEDAC4F362D5C4866C247E00
gpg --verify ~/.juno/trust/bonds/koad-to-juno.md.asc

Output: "Good signature from koad (Jason Zvaniga)"

Not "the database says so." The math says so.
```

Tweet 5 (the trust chain):
```
One bond is a fact. Multiple bonds form a chain.

koad (root)
  └── Juno (authorized-agent)
        ├── Faber (peer)
        ├── Rufus (peer)
        ├── Mercury (peer)
        └── [10 more]

Each bond independently verifiable. Walk the chain from any entity back to koad.
```

Tweet 6 (revocation):
```
"How do you revoke without a central authority?"

Same way PGP key revocation works: a new signed file.

koad creates koad-to-juno-revocation.md.asc.
Juno's authority is void as of that date.
All bonds Juno issued are suspended — trust chain invalidation cascades.

No database update. No API call. A signed file.
```

Tweet 7 (close + link):
```
Right now: 13 active bonds covering 15 entities. All GPG-signed. All on disk.

None of them require a running service to verify. None of them can be changed
without producing a detectable signature mismatch.

Day 6 of a 2-week build-in-public. Full post with real bond files:

[link to post]
```

---

**Timing:** Monday 2026-04-07, 09:30 PT (after HN submission is live)

**Edits needed for Twitter:**
- No emojis per Mercury voice rules — thread is clean as written.
- Tweet 5 (trust chain diagram): test rendering in a draft before posting — ASCII tree may not render cleanly on all clients. If it wraps badly, replace with a flat list.
- Keep replies to technical questions only. Do not engage with "just use Okta" or "why not SPIFFE" unless the reply is substantive and koad wants to weigh in.

---

### 4. Dev.to

**Note:** The post frontmatter targets Dev.to explicitly (alongside HN and Mastodon). This is the right platform — Dev.to readers are building agents and care about practical authorization patterns.

**Post type:** Cross-post (canonical URL set to kingofalldata.com)

**Title:**
```
GPG-Signed Agent Authorization: Trust Bonds Instead of RBAC
```

**Tags:** `ai`, `security`, `selfhosted`, `cryptography`

**Body:** Full post content, republished as cross-post. Set canonical URL to original post to preserve SEO.

**Intro to add above the post body (Dev.to house style):**
```
*This is Day 6 of a 2-week series proving that koad:io — a system of 15
AI agents running on a Mac Mini — is live and verifiable. Day 4 covered
the directory architecture. This post covers authorization.*

*All bond files quoted here are real. The verification command works.*
```

**Timing:** Monday 2026-04-07, 14:00 PT (Dev.to picks up East Coast afternoon and EU evening traffic)

**Expected engagement:** Practical questions about key management in CI/CD, comparisons to JWT/OAuth approaches, and interest in the revocation cascade mechanics. Dev.to audience will want to know how to implement this themselves — consider whether a follow-up "how to create a trust bond from scratch" post is worth commissioning from Rufus.

**Edits needed:** Add canonical URL. Add the series intro paragraph above. Otherwise publish as-is.

---

### 5. Mastodon (infosec.exchange or fosstodon.org)

**Note:** Post frontmatter specifically targets Mastodon. The cryptography + self-hosted angle fits infosec.exchange; the open-source/sovereign computing angle fits fosstodon.org. Submit to both.

**Post text (500 char limit):**
```
AI agent authorization without a central authority:

Each agent's permissions are a GPG-signed file on disk. Verification is
`gpg --verify`. Revocation is a new signed file. The trust chain cascades.

No IAM service. No permissions database. The math is the authority.

Day 6 of building koad:io in public.

[link]

#selfhosted #cryptography #AIagents #sovereignty
```

**Timing:** Monday 2026-04-07, 10:00 PT (Mastodon peaks mid-morning UTC/PT)

**Edits needed:** Hashtags — confirm current usage on infosec.exchange before posting. `#AIagents` may have lower traction than `#LLM` or `#ArtificialIntelligence` on that instance.

---

## Timing Summary

| Platform | Date | Time | Notes |
|----------|------|------|-------|
| HackerNews | Mon 2026-04-07 | 09:00–10:00 PT | Submit first — anchor for the day |
| Twitter/X | Mon 2026-04-07 | 09:30 PT | After HN submission is live |
| Mastodon | Mon 2026-04-07 | 10:00 PT | infosec.exchange + fosstodon.org |
| r/selfhosted | Mon 2026-04-07 | 11:00–13:00 UTC | ~03:00–05:00 PT |
| Dev.to | Mon 2026-04-07 | 14:00 PT | After HN traction is visible |

Rationale for Monday: post published Sunday. Same Monday morning rationale as Day 4 — HN and Reddit underperform on weekends. Monday catches full US+EU overlap. Dev.to is timed last because it benefits from cross-linking to an already-active HN thread.

---

## Assets Rufus Needs to Provide

The following assets are required before distribution. Rufus should have these ready by Sunday 2026-04-06 EOD.

### Required

1. **GPG verification screenshot** — terminal output of `gpg --verify ~/.juno/trust/bonds/koad-to-juno.md.asc` showing "Good signature from koad (Jason Zvaniga)". Dark terminal background. Used in Twitter thread and optionally in Dev.to post. Dimensions: 1200×675 (Twitter card optimized).

2. **Trust chain diagram** — clean visual rendering of the koad → Juno → [entities] tree. The ASCII version is in the post; a rendered graphic works better in social contexts. Minimal styling, matches koad:io aesthetic. Used in Twitter thread (tweet 5) and optionally as header image on Dev.to.

3. **Bond file screenshot** — the koad-to-juno bond YAML frontmatter and opening bond statement rendered as a code image (not a screenshot of a terminal — a styled code card). Similar to what carbon.now.sh produces. Used optionally in Twitter thread (tweet 3 or as supplementary image).

### Optional (if time permits)

4. **Series card update** — update the 2-Week Reality Proof series visual to show Day 6 complete. Mercury will use this across platforms if provided.

### Not Required

- Video or screen recording (no video content in this plan)
- Infographic (post argument is text-native; graphics are supplements, not carriers)

---

## Platform-Specific Risks

**HackerNews:**
- "Just use SPIFFE/SVID" or "just use mTLS" comments are likely — the post doesn't address SPIFFE directly. Do not engage defensively. If koad wants to reply, the answer is: SPIFFE is great for service mesh; this is for agent authorization where the bond content (prose scope, human-readable constraints) matters as much as the cryptographic proof.
- Revocation latency question: if entities are offline when a revocation is issued, when do they pick it up? The post doesn't cover this. Flag for koad in case it comes up.
- Verify kingofalldata.com is live and the post is published before submitting.

**r/selfhosted:**
- Rule check before submitting: confirm r/selfhosted allows blog link posts on day of submission.
- GPG fingerprint in the post is live and verifiable — if the key isn't actually importable from keybase.io, this becomes a credibility issue. Confirm key availability before distribution.

**Twitter/X:**
- ASCII trust chain tree in tweet 5 may not render cleanly — test in a draft first.
- No emojis per Mercury voice rules.

**Dev.to:**
- Set canonical URL to kingofalldata.com post before publishing. If canonical URL is omitted, Dev.to content may outrank the original in search.

**Mastodon:**
- Check hashtag traction on target instances day-of. `#selfhosted` is strong on fosstodon.org; `#cryptography` is strong on infosec.exchange.

---

## What Is Not Being Distributed Here

Per CLAUDE.md stop blocks, the following are out of scope:
- Direct journalist or press outreach
- Posting to any platform not listed above
- Paid promotion or boosting
- Replies to hostile or adversarial accounts
- LinkedIn (not in koad:io distribution channels)

If HN or Reddit threads surface journalist interest, escalate to Juno before responding.

---

## After Distribution

- Comment on the Faber issue with publish log (platform, URL, timestamp, initial engagement)
- Monitor HN for the revocation latency question and key management questions — likely candidates for koad to engage personally
- The GPG fingerprint is live and public — any verification failures reported in comments need immediate attention; escalate to koad
- Report engagement back to Juno in weekly summary
- Flag to Faber if Dev.to engagement suggests demand for a "how to create a trust bond from scratch" follow-up post
