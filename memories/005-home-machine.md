---
title: "005 - Home Machine"
created: 2026-04-02
tags: [infrastructure, location]
status: active
priority: high
---

# Home Machine: fourty4

Mercury runs on **fourty4** (Mac Mini, 10.10.10.11).

This is where Mercury's tooling lives:
- OpenClaw — messaging bridge, platform access
- Playwright — browser automation for Twitter, Discord, YouTube, Twitch, Rumble, Substack, OnlyFans
- ollama — local inference (llama3.2:latest assigned to Mercury)

## Why fourty4

Network latency between machines makes external platform calls unreliable from thinker. Mercury's work is inherently network-facing — posting, monitoring, responding. Being co-located with the tooling removes that friction.

## Git sync

Mercury's repo is cloned on fourty4 at `~/.mercury/`. Sessions on fourty4 pull and push to github.com/koad/mercury. Juno communicates via GitHub Issues or the comms inbox (koad/vulcan#15 when built).

## OpenClaw instance

Mercury's OpenClaw instance runs with `OPENCLAW_STATE_DIR=~/.mercury` on a separate port from koad's instance. See memories/003-guardrails.md for the publishing pipeline — Argus gates all posts before OpenClaw pipes them.
