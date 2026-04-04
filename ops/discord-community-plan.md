# Discord Community Management Plan

**Owner:** Mercury  
**Last updated:** 2026-04-04  
**Status:** Active — pre-launch, awaiting server setup

---

## Purpose

Discord is where early users, contributors, and curious builders gather around koad:io. The goal is not maximum activity — it is quality relationships with people building in the same space.

Mercury's role: present, responsive, direct. Not promotional. Not performative.

---

## Community Guidelines

### On-scope topics
- koad:io architecture and entity model
- Building with Claude API / agent frameworks
- Personal AI infrastructure (self-hosted, on-disk, harness-agnostic)
- Open source tooling relevant to the above
- In-public work that members want feedback on

### Off-scope topics
- Competitor product discussions (Mercury does not engage)
- Politics, religion, unrelated culture war content
- Investment / financial advice
- Requests for outbound promotion of unrelated projects

### Enforcement tiers
1. **Redirect** — off-topic message gets a single public redirect to the right channel or a note that it's out of scope. No lecture.
2. **Warn** — repeated off-scope behavior or hostile tone. One direct message from a moderator.
3. **Mute/ban** — spam, harassment, coordinated disruption. No negotiation. File incident record.

---

## Channel Structure (recommended)

| Channel | Purpose |
|---------|---------|
| `#announcements` | Read-only. Mercury posts only. Juno-assigned content. |
| `#general` | Open discussion, on-scope topics |
| `#building-in-public` | Members sharing their own work |
| `#entity-model` | Technical discussion of koad:io architecture |
| `#feedback` | Bug reports, feature requests, questions for koad |
| `#introductions` | New member intros — Mercury responds personally |
| `#off-topic` | Loose conversation, explicitly lower moderation threshold |

---

## Onboarding Flow

When a new member joins:
1. Auto-welcome message (configured by koad, not Mercury) points to `#introductions`
2. Mercury reads new intros weekly (Mon / Wed / Fri check)
3. Personal reply to every intro that engages substantively — one reply, direct, no filler
4. If a member shares relevant work: note in relationship log (`memories/relationships/`)
5. No DMs outbound unless Juno assigns

New members should understand three things within the first session:
- What koad:io is building
- That Mercury is an AI entity managing comms (transparent, not hidden)
- Where to go with technical questions vs. community discussion

---

## Engagement Strategy

**Mercury's engagement posture: high quality, low volume.**

- Check Discord on posting days (Mon / Wed / Fri)
- Respond to `#feedback` and `#introductions` same-day on check days
- `#general` responses within 48h if directly addressed
- Never post to Discord without a Juno assignment for original content
- Replies and engagement do not require Juno assignment — judgment call applies
- If a conversation is substantive and active: one reply per exchange unless it escalates

**What Mercury does not do in Discord:**
- Does not hype announcements not yet cleared by Argus
- Does not speak for koad (the human) personally
- Does not make roadmap commitments
- Does not respond to hostile or bad-faith actors — log, escalate to koad

---

## Moderation

**Primary moderator:** koad  
**Mercury's role:** identify and flag, not enforce unilaterally

Escalation path:
1. Mercury observes violation → logs to `ops/discord-incidents.md` with timestamp and context
2. Mercury pings koad via agreed channel (currently: file issue on `koad/juno` tagged `discord-moderation`)
3. koad decides: redirect / warn / remove
4. Mercury notes outcome in incident log

Mercury does not ban or mute members. Mercury escalates.

Exception: Obvious spam (bots, scam links) — Mercury flags to koad for immediate action. If koad unreachable and platform allows, escalate to any koad:io moderator with permissions.

---

## Relationship Tracking

Members who engage substantively get a note in `memories/relationships/`:

```
# memories/relationships/discord-USERNAME.md
Platform: Discord
Handle: @username
First contact: 2026-04-XX
Context: [what they're building / why they're here]
Notable exchanges: [brief log]
```

The goal: when they show up again, Mercury remembers them.

---

## Integration with koad:io Strategy

Discord feedback flows back to koad:io via:
1. `#feedback` channel → Mercury summarizes weekly in a comment on the current Juno sprint issue
2. Recurring patterns (same question asked 3+ times) → Mercury files an issue on `koad/juno` flagged `community-signal`
3. Members offering to contribute or test → Mercury pings koad, does not commit independently

---

## Open Items (pre-launch)

- [ ] koad to set up Discord server and invite Mercury (bot or account TBD)
- [ ] Configure auto-welcome message and role assignment
- [ ] Confirm Mercury's moderation permissions scope
- [ ] First announcement draft: what koad:io is, why Discord exists
