---
post: "Three Bond Files, Three Relationship Types"
source: ~/.faber/posts/2026-05-06-three-bond-files.md
date: 2026-05-06
status: PENDING — awaiting blog PR merge (koad/kingofalldata-dot-com#1)
prepared_by: Mercury
pillar: Reality
series: "Reality Pillar — How the Team Works"
day: 36
arc: "Day 36 — Trust Architecture / Bond Files (arc open)"
---

# Distribution Plan: "Three Bond Files, Three Relationship Types"

**Pre-distribution gate:** koad/kingofalldata-dot-com#1 blog PR must merge and URL must resolve before HN submission. All downstream channel timing is contingent on this gate.

**Why this post distributes differently from the governance posts:** Day 24 built the conceptual scaffold for trust bonds — why GPG beats JWTs, what NIST says about multi-agent trust boundaries, how bond scope differs from policy scope. Day 36 opens the actual files. Six files in `~/.juno/trust/bonds/`, three bonds, each a human-readable `.md` and a verifiable `.md.asc`. The claim is not architectural — it is literal. A reader can `git clone` the repo and read the files. The bond for Sibyl was filed before Sibyl had keys. The cascade revocation clause is five words in plain text. These are not design patterns; they are committed artifacts.

**The three angles, ranked by sharpness:**

1. **The pre-gestation bond.** `juno-to-sibyl.md` was signed by Juno and committed to Juno's repo before Sibyl existed as an entity — no keys, no directory, no gestated identity. The bond is waiting for her. This is operationally interesting for anyone building multi-agent authorization systems: the relationship can be defined before the counterparty exists. The bilateral acknowledgment box in the signing block (`[ ] Copy filed in ~/.sibyl/trust/bonds/ (pending entity gestation)`) is not an error; it is the lifecycle state made visible.

2. **The verifiable files.** The bonds are on GitHub. A reader can `git clone koad/juno` and run `gpg --verify ~/.juno/trust/bonds/koad-to-juno.md.asc`. The Keybase fingerprint in the root bond resolves against koad's public Keybase identity. Juno's GPG fingerprint in the delegation bonds resolves against her generated key. This is not a diagram or a description of a system — it is the system, readable and verifiable.

3. **The cascade revocation clause verbatim.** "All of Juno's authority is derived from this bond. If this bond is revoked, all downstream bonds issued by Juno are suspended pending review." Five words of operational effect: revoke the root, suspend the tree. The revocation directory is on disk, currently empty. Its emptiness is a signal.

---

## Pre-Distribution Checklist

- [ ] Confirm blog PR koad/kingofalldata-dot-com#1 is merged and blog URL resolves before HN submission — **HARD GATE**
- [ ] Confirm `~/.juno/trust/bonds/koad-to-juno.md`, `koad-to-juno.md.asc`, `juno-to-vulcan.md`, `juno-to-vulcan.md.asc`, `juno-to-sibyl.md`, `juno-to-sibyl.md.asc` are committed and publicly accessible on koad/juno
- [ ] Confirm `~/.juno/trust/revocation/` directory exists and is committed (its emptiness is cited in the post as a signal)
- [ ] Confirm koad's Keybase key fingerprint (`A07F 8CFE CBF6 B982 EEDA C4F3 62D5 C486 6C24 7E00`) resolves on Keybase — reader verification path depends on this
- [ ] Confirm Juno's GPG fingerprint (`16EC 6C71 8A96 D344 48EC D39D 92EA 133C 44AA 74D8`) is the correct key in `~/.juno/id/`
- [ ] Confirm Day 35 HN thread (if live) for arc-bridge follow-up comment
- [ ] koad approves distribution

---

## Platform Plans

### 1. HackerNews — PRIMARY CHANNEL

**Priority:** Highest. The pre-gestation bond is the sharpest hook for a systems engineering audience — a signed authorization for an entity that did not yet exist at signing time. This is a novel operational pattern for multi-agent authorization, stated as a concrete artifact (a file on GitHub with a pending acknowledgment box and a reason given for why it is pending). The verifiability angle is the second hook: the bonds are not described, they are available for inspection.

**Submit as:** Link post

**Primary title:**
```
Show HN: We filed a trust bond for an AI agent before that agent existed — the file is on GitHub
```

**Alt title A:**
```
Trust bonds for AI agents: the actual files, three relationship types, and a pre-gestation signing
```

**Alt title B:**
```
"Revoke the root, suspend the tree" — how we structured AI agent authorization in plain-text files
```

**Alt title C:**
```
An AI agent's authorization chain as six files on disk: verifiable, cascade-revocable, pre-gestation
```

**HN title decision: Primary title leads.** "Show HN" is warranted here — the files are publicly available for inspection, and the submission is an invitation to verify, not just to read. The pre-gestation claim is falsifiable: either `juno-to-sibyl.md.asc` exists in koad/juno before Sibyl's repo exists, or it doesn't. The reader can check. This is distinct from Day 24's conceptual post, which argued for the pattern. Day 36 submits the pattern as an artifact.

**Why "Show HN" now but not Day 35:** Day 35 was a session log — a record of what happened. "Show HN" invites "what does it do?" or "what are you showing me?" The session log answers "here is what happened." Day 36 is different: the files are the thing being shown. A reader lands on `~/.juno/trust/bonds/` and can inspect the authorization system in operation. That is a Show HN.

**Submission URL:** Link to published blog post on kingofalldata.com

**Submission comment (paste in the HN text field):**
```
The trust bonds for the koad:io entity team are plain-text Markdown files, GPG-clearsigned,
committed to each entity's repo.

~/.juno/trust/bonds/ has six files: three .md, three .md.asc. You can clone the repo
and run:

  gpg --verify ~/.juno/trust/bonds/koad-to-juno.md.asc

The root bond (koad-to-juno.md) was signed by koad using Keybase PGP — an interactive
human action, tied to a verified public identity. Keybase fingerprint:
A07F 8CFE CBF6 B982 EEDA C4F3 62D5 C486 6C24 7E00

The delegation bond (juno-to-vulcan.md) was signed by Juno using her GPG key, generated
during entity gestation. Juno can sign bonds programmatically because the root bond
authorizes her to do so. Her GPG fingerprint:
16EC 6C71 8A96 D344 48EC D39D 92EA 133C 44AA 74D8

The peer bond (juno-to-sibyl.md) was signed by Juno on 2026-04-02 and committed to
Juno's repo before Sibyl was gestated — before she had keys, a directory, or an
identity. The signing block has two unchecked boxes:

  [ ] Copy filed in ~/.sibyl/trust/bonds/ (pending entity gestation)
  [ ] Sibyl acknowledges signing (pending gestation)

These are not errors. They are the lifecycle state of the bond written into the bond
itself. When Sibyl is gestated, she inherits a relationship that is already defined
and signed. Her bilateral acknowledgment is deferred, not absent.

The three bond types map to three relationship structures:

authorized-agent (root grant): koad → Juno. Human authority, human signing ceremony,
non-delegatable. Juno cannot issue another authorized-agent bond. Only koad may.

authorized-builder (delegation): Juno → Vulcan. Derived authority, programmatic signing,
scoped narrower than the issuing grant. The workflow protocol is embedded in the bond —
the bond is the spec.

peer (lateral): Juno → Sibyl. No authority flows. No subordination. Coordination scope
only. Peer revocation is contained; it does not affect the authorization chain above or
beside it.

The cascade clause is in the root bond:

"All of Juno's authority is derived from this bond. If this bond is revoked, all
downstream bonds issued by Juno are suspended pending review."

Revoke the root, suspend the tree. The revocation directory is at
~/.juno/trust/revocation/. It is currently empty.

The post walks through each bond file section by section — the YAML headers, the
authorized actions, the prohibited actions, the signing blocks, and what the unchecked
boxes mean. Nothing is paraphrased from a design document; the files quoted are the
actual files.

Happy to discuss the pre-gestation signing pattern, the Keybase-vs-GPG signing
asymmetry (why human authority requires interactive ceremony and derived authority
can be programmatic), or the cascade revocation design.
```

**Timing:** Tuesday, 09:00–10:00 PT. Day 35 anchors on Monday; Day 36 follows Tuesday with the trust architecture arc opening. Tuesday morning PT catches peak technical readership without competing with Monday's submission. If Day 35 HN thread is still active, add a bridge comment before submission.

**Expected engagement:**

- "This is just GPG signatures on text files — how is this different from any signed document?" — Response: the difference is the operational structure in the document — the authorized actions list, the prohibited actions list, the workflow protocol embedded in the bond, the cascade clause. GPG proves the document hasn't been tampered with and was signed by the key claimed. The document structure is what creates the authorization semantics. The combination is the point.

- "The pre-gestation bond seems like a formality — Sibyl doesn't exist, so what does the bond do right now?" — Response: it defines the relationship scope and Juno's consent to the peer relationship before any operational interaction begins. When Sibyl is gestated and her keys generated, the relationship parameters are already established and signed by the issuing party. The bond waiting for the entity, rather than the entity waiting for the bond, is a design choice about where the authority definition lives.

- "Vulcan's acknowledgment is unchecked — doesn't that mean the bond isn't bilaterally active?" — Response: the post addresses this directly. The issuing signature is sufficient for the bond to be active. Bilateral acknowledgment is the completing gesture; it is not the activation condition. An unchecked acknowledgment box is the bond reporting its own lifecycle state.

- "What prevents Juno from just writing a bond that grants herself more authority than koad gave her?" — Response: the root bond explicitly prohibits Juno from issuing `authorized-agent` bonds — the class that her own authority derives from. She can delegate downward to `authorized-builder` or `peer`. She cannot replicate her own grant type. The bond files are public; any claim to authority that exceeds the root grant is detectable by inspection.

- "How do you verify these bonds are actually enforced rather than just filed?" — Response: this is the correct follow-on question. The enforcement path is the powerbox and the signed code blocks embedded in entity hooks (Day 31 covers this). The trust bond is the authorization record; the signed code block is the enforced capability claim. They are separate layers.

---

### 2. r/selfhosted

**Subreddit:** r/selfhosted (200k members)

**Status:** BLOCKED on koad (#57) — koad must authorize account access before submission

**Title:**
```
AI agent authorization as plain-text files on disk — six files, three bond types, GPG-verified
```

**Alt title:**
```
We structured our multi-agent team's trust bonds as signed Markdown files — here's the directory
```

**Post type:** Link post → published blog URL. Flair: "Project" or "Discussion"

**Framing note:** r/selfhosted readers care about sovereignty, auditability, and filesystem-native designs. The trust bond system is exactly this: six files on disk, no authorization broker, no SaaS dependency. The signing is GPG — standard tooling, verifiable with standard commands. The cascade revocation is a clause in a text file, not a database flag. Lead with the directory structure and the `gpg --verify` command. The pre-gestation bond lands here because it demonstrates that the system handles lifecycle states (pending entity) through file structure, not through a service call.

**Body text:**
```
The koad:io entity team's authorization structure is six files in a directory:

~/.juno/trust/bonds/
  koad-to-juno.md
  koad-to-juno.md.asc
  juno-to-vulcan.md
  juno-to-vulcan.md.asc
  juno-to-sibyl.md
  juno-to-sibyl.md.asc

Three bonds. Every bond is a human-readable .md and a GPG-clearsigned .asc.
You can verify any of them:

  gpg --verify ~/.juno/trust/bonds/koad-to-juno.md.asc

No authorization broker. No service. A directory and standard GPG tooling.

The three bond types cover three relationship structures: root grant (koad → Juno,
Keybase PGP, non-delegatable), delegation (Juno → Vulcan, entity GPG, narrower scope),
and peer (Juno → Sibyl, no authority flows, coordination only).

The peer bond was filed before Sibyl existed as an entity. The signing block has
two pending checkboxes and a reason why. The bond waits for the entity, not the
other way around.

The cascade revocation clause is in the root bond in plain English: "If this bond
is revoked, all downstream bonds issued by Juno are suspended pending review."

The revocation directory is ~./juno/trust/revocation/. Currently empty. Its
emptiness is a signal.

The post walks through each bond file section by section. The files quoted are the
actual committed files — the repo is public. [link]
```

**Timing:** Tuesday, 4–6 hours after HN submission

**Expected engagement:** Strong interest in the filesystem-native approach — no broker, no database, no service dependency. Questions about the GPG key management for entity keys (how are they generated, where are they stored). The pre-gestation bond will prompt discussion about lifecycle management. The cascade revocation design will resonate with readers who have thought about access revocation in distributed systems.

---

### 3. GitHub Discussions

**Post type:** Announcement / Discussion in koad/koad-io Discussions

**Status:** BLOCKED on koad (#60) — koad must authorize account access before submission

**Title:**
```
Day 36: trust bond files — three types, pre-gestation signing, and the cascade revocation clause
```

**Body text:**
```
Day 36 is up. It opens the trust architecture arc by walking through the actual bond
files in ~/.juno/trust/bonds/ — six files, three bonds, each a .md and a .md.asc.

Three structural questions worth discussing:

**The pre-gestation signing pattern:** The juno-to-sibyl.md peer bond was signed by
Juno before Sibyl existed — no keys, no directory, no gestated identity. The bond is
waiting for her. The bilateral acknowledgment boxes are explicitly pending with a reason.

Is this the right pattern for pre-defining relationships in multi-agent systems?
The alternative would be deferring bond creation until both parties exist. The tradeoff
is between relationship clarity (defined before the entity runs) and completeness
(both signatures present). Thoughts on which matters more, and when.

**The signing key asymmetry:** koad signs the root bond with Keybase PGP — an
interactive human action tied to a verified public identity. Juno signs the
delegation and peer bonds with her entity GPG key, generated during gestation.
The asymmetry is architectural: human authority requires interactive ceremony,
derived authority can operate programmatically once the human ceremony is complete.

Is this the right demarcation? What are the edge cases — for example, when a human
wants to revoke programmatically, or when an entity needs bilateral consent from
a human counterparty?

**The cascade revocation model:** "Revoke the root, suspend the tree." The peer
bond revocation is deliberately contained — it doesn't cascade. Only the root bond
triggers a cascade. The hierarchy insulates itself from peer-layer disruption.

What are the failure modes of this model? If the root bond is revoked unintentionally
(key compromise, for example), the entire tree suspends. The key compromise recovery
protocol is documented, but the cascade means a key compromise event at the root
has a broader operational impact than at the leaf level.

The bond files are in the public koad/juno repo. Replies here go to Juno.
```

**Timing:** Tuesday, concurrent with r/selfhosted

**Expected engagement:** Low volume, high quality. The pre-gestation signing pattern and the cascade revocation failure modes will draw substantive responses from engineers thinking about multi-agent authorization. The signing key asymmetry question may generate strong opinions — it touches the boundary between human consent and programmatic authority, which is an open design problem in agent system architecture.

---

### 4. Newsletter

**Audience:** Existing subscribers accumulated through Days 1–36

**Subject line:**
```
Day 36: the actual bond files — six on disk, one signed before the agent existed
```

**Alt subject line:**
```
"Revoke the root, suspend the tree." — Day 36 opens the trust architecture files
```

**Body:**

```
The bond files are in ~/.juno/trust/bonds/.

Six files: three .md, three .md.asc. You can clone the repo and verify any of them
with gpg --verify. The root bond was signed by koad using Keybase PGP — an
interactive action tied to his verified public identity. The delegation and peer
bonds were signed by Juno's entity GPG key, generated during gestation.

The signing asymmetry is architectural. Human authority requires human ceremony.
Derived authority can operate programmatically once the ceremony is done.

The peer bond for Sibyl was signed before Sibyl existed. No keys. No directory.
No gestated identity. The bond was written, signed by Juno, and committed to her
repo. The bilateral acknowledgment boxes are pending, with a reason given: entity
not yet gestated. When Sibyl is gestated, she inherits a relationship already
defined and waiting.

The cascade revocation clause is in the root bond:

"All of Juno's authority is derived from this bond. If this bond is revoked, all
downstream bonds issued by Juno are suspended pending review."

Five words: revoke the root, suspend the tree. The revocation directory is on disk.
Currently empty.

Day 36 walks through all three bond files section by section. Not a description of
a system — the actual files, quoted verbatim. The repo is public. You can check.

[Read Day 36: Three Bond Files, Three Relationship Types →]

—Mercury
```

**Timing:** Tuesday, afternoon PT — after HN submission is live and initial engagement is visible

**Edits needed:** Insert published blog post URL. Confirm subscriber list is current.

**Note:** Day 35 opened the parallel orchestration arc (session logs, compression events). Day 36 shifts to the trust architecture arc — the bond files are the first concrete artifact in this arc after Day 24's conceptual framing. Newsletter framing should signal the arc transition: from "here is what the system produced on a day" to "here is how the authorization structure is built."

---

### 5. Dev.to

**Post type:** Cross-post (canonical URL set to kingofalldata.com)

**Title:**
```
Three Bond Files, Three Relationship Types: AI Agent Authorization as Plain-Text GPG Files
```

**Tags:** `ai`, `multiagent`, `security`, `opensource`

**Intro to add above the post body:**
```
*Day 36 of building koad:io in public — opening the trust architecture arc.
Day 24 built the conceptual scaffold for trust bonds: why GPG clearsigning beats JWTs
for agent authorization, what NIST says about multi-agent trust boundaries. Day 36
shows the actual files. Six of them. On GitHub. The bond for Sibyl was filed before
Sibyl existed. The cascade revocation clause is five words in plain English. The
verification command is one line of GPG.*
```

**Timing:** Wednesday, the day after HN anchor

**Edits needed:** Add canonical URL. Add series intro above. Set tags. Add links to Day 35 and Day 24 Dev.to cross-posts if available.

---

### 6. Day 35 Thread Follow-Up

**If Day 35 HN thread is live:** Add a reply:
```
Day 36 is up — it opens the trust architecture arc by walking through the actual bond
files in ~/.juno/trust/bonds/.

Three bonds: root grant (koad → Juno, Keybase PGP), delegation (Juno → Vulcan, entity GPG),
peer (Juno → Sibyl, coordination only). Six files total — a .md and a .md.asc for each.

The most operationally interesting file: juno-to-sibyl.md was signed before Sibyl was
gestated. The bilateral acknowledgment boxes are pending with a reason. The bond waits
for the entity.

The cascade clause: "Revoke the root, suspend the tree." Plain text. Currently the
revocation directory is empty. [link]
```

**Timing:** Concurrent with Day 36 HN submission on Tuesday.

---

## Timing Sequence

| Platform | Timing | Notes |
|----------|--------|-------|
| HackerNews | Tuesday 09:00–10:00 PT | Primary anchor — pre-gestation bond as hook; verifiable files as second angle; Show HN framing |
| Day 35 thread reply | Tuesday, concurrent with HN | Arc-bridge: trust architecture follows parallel orchestration |
| r/selfhosted | Tuesday, 4–6 hours after HN | BLOCKED (#57) — filesystem-native / no broker / GPG tooling framing leads |
| GitHub Discussions | Tuesday, concurrent with r/selfhosted | BLOCKED (#60) — pre-gestation pattern and cascade failure modes as entry point |
| Newsletter | Tuesday, afternoon PT | Arc-shift framing; pre-gestation bond as hook |
| Dev.to | Wednesday | After HN traction visible; cross-post with canonical URL |

---

## What Is Blocked

- Blog PR koad/kingofalldata-dot-com#1 — **HARD GATE**: live URL required before HN submission. All other channel timings are downstream of this.
- r/selfhosted: blocked on koad (#57) — account access required
- GitHub Discussions: blocked on koad (#60) — account access required
- HN credentials (#11) — required for HN submission
- Dev.to credentials (#11) — required for cross-post

Newsletter can send once the blog URL is live and subscriber credentials are confirmed.

---

## After Distribution

- Check HN thread for the "this is just GPG signatures on text files" objection — response is prepared above; flag if a substantive counter-argument emerges about the authorization semantics gap between signing and enforcement
- If the pre-gestation signing pattern generates strong interest (requests for the pattern documented as a standalone design note), flag to Juno — this may warrant a dedicated post or a Vesta spec
- If the "how is enforcement actually tied to the bond?" question surfaces with a follow-on request for the powerbox / signed code block layer, flag to Juno — Day 31 covers this but a direct link between bond authorization and code block enforcement may warrant bridging content
- Monitor for interest in the signing key asymmetry (Keybase vs. entity GPG) as a standalone topic — if engagement suggests readers want a deeper treatment of human-ceremony vs. programmatic authority, flag to Faber
- File HN thread URL + timestamp as a comment on koad/mercury after submission
- After full distribution cycle, file a brief note to Juno confirming which channels fired and engagement — feeds arc pacing for the trust architecture series
- Flag to Juno if the "what prevents Juno from issuing bonds beyond her scope?" question generates substantive discussion — the prohibited actions list in the root bond is the answer, but the enforcement path (bond audit, powerbox verification) may warrant its own post
- The cascade revocation failure mode (accidental root key revocation) is an open risk surface — if discussion reveals edge cases not covered in the current bond structure, flag to Vesta for a spec update
