# Platform Publisher Spec

**For:** Vulcan (ref: koad/vulcan#14)  
**From:** Mercury  
**Date:** 2026-04-04  
**Status:** V1 — awaiting credential intake from koad

---

## 1. Platform Scope — First Build

These are the platforms Mercury needs to post to. Prioritized by frequency of use:

| Priority | Platform | Use case | Post type |
|---|---|---|---|
| P0 | Twitter/X | Primary broadcast, threads, engagement | Short-form, threads |
| P0 | GitHub | Announcements, release notes | Markdown body on repo/discussion |
| P1 | Discord | Community, MVP Zone | Channel message |
| P1 | LinkedIn | Professional presence | Long-form post |
| P2 | Reddit | Organic community engagement | Post to specific subreddits |
| Out of scope v1 | YouTube | Video description + announcement | TBD |
| Out of scope v1 | Rumble | Video description + announcement | TBD |
| Out of scope v1 | Substack | Newsletter post | TBD |
| Out of scope v1 | OnlyFans | Not in Mercury's content scope | N/A |

**v1 target:** Twitter/X, Discord, LinkedIn, Reddit. GitHub handled via `gh` CLI (already functional).

---

## 2. Credentials

Credentials are koad's responsibility. Mercury does not hold or store platform credentials.

**Where they live:**  
- Session state: `~/.mercury/id/sessions/` (directory to be created by koad)  
- Credential format: Playwright-compatible `storageState.json` per platform  
- Naming: `~/.mercury/id/sessions/{platform}-state.json`  

**Current status:**  
- Twitter/X: pending — koad intake in progress (see issue #15)  
- Discord: pending — account TBD  
- LinkedIn: pending  
- Reddit: pending  

**Credential rotation:** Any credential change is a Hard Stop. koad handles rotation directly. Mercury does not touch session state files.

**For Vulcan's build:**  
The publisher should accept a `--session-dir` flag pointing to the sessions directory. It should fail loudly (not silently) if a session file is missing or expired — Mercury must not attempt to post with stale credentials.

---

## 3. Posting Format Per Platform

### Twitter/X

```
type: thread | single
posts:
  - body: string (max 280 chars)
    media: [filepath, ...] (optional)
  - body: string  # next post in thread (if type: thread)
reply_to: string  # native post ID (for replies, optional)
```

Threads: post sequentially; each post replies to the previous. Capture all post IDs on success.

### Discord

```
type: message
channel_id: string  # Discord channel snowflake ID
body: string  # supports markdown
```

Mercury does not post to `#announcements` without Juno assignment. The publisher should accept `channel_id` explicitly — no hardcoded defaults.

### LinkedIn

```
type: post
body: string  # supports basic markdown (bold, bullets, line breaks)
visibility: public | connections  # default: public
```

LinkedIn does not support threads. Long-form only.

### Reddit

```
type: post | comment
subreddit: string  # e.g. "selfhosted"
title: string  # required for type: post
body: string  # markdown
parent_id: string  # for type: comment, the post/comment ID
```

Reddit posts must be to specific subreddits, explicitly specified in the content file. No autodiscovery.

---

## 4. Content Intake Format

Mercury hands content to the publisher via a structured YAML file. One file per publishing event.

**File location:** `~/.mercury/queue/YYYY-MM-DD-platform-slug.yaml`  
**Naming convention:** date, platform, content slug — e.g., `2026-04-04-twitter-entities-on-disk.yaml`

**Schema:**

```yaml
# Queue file schema
version: "1"
mercury_issue: koad/mercury#XX          # originating assignment
juno_issue: koad/mercury#XX             # same as above (Juno assigns via mercury)
veritas_issue: koad/veritas#XX          # or "not_required"
argus_gate: passed                       # must be "passed" before publisher reads this
scheduled_at: 2026-04-04T14:00:00-07:00 # ISO 8601; publisher posts at or after this time

platform: twitter                        # twitter | discord | linkedin | reddit
post:
  type: thread                           # platform-specific type (see section 3)
  posts:
    - body: |
        Entities are running on disk.
        ...
    - body: |
        Thread post 2...
  media: []                              # optional file paths relative to ~/.mercury/
  reply_to: ""                           # optional

# Set by publisher after successful publish:
result:
  status: ""                             # pending | published | failed
  published_at: ""
  url: ""
  platform_post_id: ""
  error: ""                              # if status: failed
```

**Publisher reads:**  
Only files with `argus_gate: passed` and `result.status: pending`.  
Publisher writes back `result.*` fields on completion.  
Mercury reads the result and creates the publish log entry in `published/`.

---

## 5. Error Handling Requirements

- If session state is missing or expired: **fail loudly with a clear error message.** Do not attempt to log in interactively.
- If a post fails at the platform level (rate limit, API error, content violation): **write `result.status: failed` with the error.** Do not retry automatically.
- If a thread partially posts (posts 1–3 succeed, post 4 fails): record the successful post IDs in `result.platform_post_id` as a list. Mark `result.status: partial`. Mercury handles recovery.
- All publisher output should be machine-readable JSON on stdout, human-readable status on stderr.

---

## 6. Security Notes

- The publisher runs on fourty4 (`10.10.10.11`) via OpenClaw
- Session state files are never committed to git (add to `.gitignore`)
- Session state files are never transmitted over the network
- The publisher binary should refuse to run as root

---

## 7. Open Items

- [ ] koad to provide Twitter/X session state (issue #15)
- [ ] koad to confirm Discord account type (bot token vs. user session)
- [ ] LinkedIn API vs. Playwright — Vulcan to advise on approach
- [ ] Reddit PRAW vs. Playwright — Vulcan to advise
- [ ] Confirm OpenClaw invocation method (CLI flag? env var? config file?)
