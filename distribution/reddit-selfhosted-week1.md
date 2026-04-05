---
title: "Reddit r/selfhosted — Week 1 Post"
date: 2026-04-05
platform: reddit
subreddit: r/selfhosted
post_type: link-post
status: STAGED — can post from koad's Reddit account, no new credentials needed
pillar: Reality
series: "2-Week Reality Proof"
week: 1
sourced_from:
  - ~/.mercury/drafts/2026-04-04-reddit-selfhosted-crosspost.md
  - ~/.mercury/distribution/2026-04-04-entities-on-disk-plan.md
---

# Reddit r/selfhosted — Week 1 Post

**Note:** This platform does not require new credentials. koad can post from their existing Reddit account. This is the first distribution that can fire independently of the credential handoff.

---

## Title

```
I built an AI entity framework where agents live as git repos on your disk — 15 running on one Mac Mini
```

**Alt title (if primary is flagged as marketing):**
```
Self-hosted AI agents: each one is a git repo + SSH hook on hardware you control. 15 running on a Mac Mini.
```

**Notes:**
- r/selfhosted responds to concrete infrastructure framing. Lead with the hardware, not the idea.
- Do not use "sovereign" as an opener — it reads political in this community.
- The hardware spec (Mac Mini + $200 laptop) is a relevant detail here. This sub cares about what box and how much.
- Flair: "Project" if available.

---

## Post body

**URL:** `https://kingofalldata.com/blog/entities-are-running-on-disk`
*(Replace with live URL before posting)*

**Body text:**

---

I've been building koad:io — a system where each AI agent is a git repo on a machine you control. 15 are running right now on a Mac Mini called fourty4, orchestrated from a $200 laptop.

**What an entity directory looks like:**

```
~/.faber/
├── CLAUDE.md         <- identity and operating instructions
├── memories/         <- state committed to git between sessions
├── trust/bonds/      <- GPG-signed authorization files
└── hooks/            <- routing script (the actual invocation layer)
```

**The routing layer is ~30 lines of bash:**

- reads the prompt
- checks a lockfile (one call at a time per entity)
- base64-encodes the prompt for shell-safe passing
- SSHes to fourty4, cd's to the entity directory, runs Claude
- parses JSON output, returns result

No broker. No API gateway. No managed service. SSH + a directory + a lockfile.

**Full hook code is in the post.**

**Why this matters for the self-hosted crowd:**

- The entity is the directory. If the AI vendor goes away tomorrow: the directory still exists, every memory and config is on disk, swap `claude` for a local model in the hook, same entity, different engine.
- Because it's git: `git log` audits every decision made, `git revert` undoes a bad config, fork the repo to spawn a variant agent.
- No persistent processes. Each invocation is a subprocess. 15 entities idle at near-zero resource usage.

**Hardware:** Mac Mini (fourty4) + cheap laptop (thinker) for orchestration. Total under $1,000. No vendor subscriptions beyond API usage.

**Running this yourself:** If you want to try before reading — you need a machine you control, SSH access, and a Claude API key. The hook pattern in the post is the complete routing layer.

Full write-up covers: hook code, directory structure, GPG trust bonds, migration (moving an entity to a different host = update one variable, commit), and what survives vendor failure.

---

## Timing

**Post 4–6 hours after HN submission is live.**

Do not post before HN or simultaneously. Cross-posting within hours can get flagged on Reddit. If HN gets traction, the r/selfhosted post can reference the HN thread in a comment ("also being discussed on HN: [link]") — adds legitimacy and cross-traffic.

**Suggested post time:** Monday 2026-04-06, 11:00–13:00 UTC (~03:00–05:00 PT)

This catches EU audience first (r/selfhosted has strong EU self-hoster base), then wakes up with US readers mid-morning.

---

## Anticipated questions — have answers ready

**"Which local model can replace Claude here?"**
Any model with a CLI interface that accepts a prompt and returns JSON. Ollama works — swap `$CLAUDE_BIN` in the hook. The entity directory doesn't care what model answers, only that CLAUDE.md gets loaded as context.

**"How do you handle rate limits with 15 agents?"**
Lockfile per entity prevents concurrent calls to the same entity. Cross-entity parallelism is just parallel SSH calls. Rate limits are the real constraint — 15 entities at low volume is fine on Claude Sonnet tier.

**"What's the cost?"**
API usage only. Hardware is one-time. A typical day of light orchestration (a few calls per entity) costs under a dollar. Full cost breakdown may follow in a later post — not committing to a number here.

**"Does it work with open-source models?"**
Yes. The hook is just a shell script. Replace the Claude invocation with an ollama call. Trust bonds are model-agnostic — they're just signed files.

---

## Platform-specific risks

- **Rule check:** Confirm r/selfhosted allows blog link posts before submitting. Rules change — check the sidebar day-of.
- **Hardware cost claim:** "under $1,000" must be accurate. Veritas has reviewed this claim against actual hardware. Do not inflate specs.
- **No new credentials needed:** koad can post from their existing Reddit account. This is the easiest first publish in the package.

---

## After posting

- Comment on koad/mercury with post URL + timestamp
- If HN thread is active, add a comment on the Reddit post linking to it
- Monitor for questions about local model compatibility and cost — these are warm threads worth a reply
- Report engagement to Juno in weekly summary

---

## Pre-posting checklist

- [ ] Blog post live at final URL
- [ ] HN submission live (include HN link in a first comment if possible)
- [ ] r/selfhosted rules confirmed (link posts allowed, flair required?)
- [ ] Body text [POST LINK] replaced with real URL
- [ ] koad Reddit account session active
- [ ] Veritas: "under $1,000" hardware claim confirmed
