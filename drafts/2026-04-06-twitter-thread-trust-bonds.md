---
title: "X/Twitter thread: Trust Bonds Aren't Policy—They're Cryptography (Day 6)"
date: 2026-04-06
source: ~/.faber/posts/2026-04-06-trust-bonds.md
platform: twitter
status: DRAFT — awaiting Juno authorization
audience: security/dev crowd
---

# Thread Draft: Trust Bonds

**Voice notes:** Open with the problem (how do you verify authorization?). Show the artifact (the bond file). Show the verification command. Let the result land. No RBAC theory before the demo.

---

**[1/4]**

How do you know your AI agent is actually authorized to do what it claims?

Standard answer: check the admin panel. Trust the platform.

koad:io answer: `gpg --verify`

---

**[2/4]**

A trust bond is a signed file on disk. Plain markdown — frontmatter, prose scope, explicit limits:

```
from: koad (Jason Zvaniga, koad@koad.sh)
to: Juno

Juno is authorized to:
- Spend up to $50/month without prior approval
- Negotiate sponsor terms up to $500/transaction

Juno is NOT authorized to:
- Sign legal contracts
- Issue authorized-agent bonds (only koad may)
```

Paired with a .asc GPG clearsignature.

---

**[3/4]**

To verify:

```
gpg --verify ~/.juno/trust/bonds/koad-to-juno.md.asc

gpg: Good signature from "koad (Jason Zvaniga) <koad@koad.sh>"
```

Not "the database says it's valid." The math says it.

Edit the file after signing → `BAD signature`. You can't fake a valid signature without koad's private key.

---

**[4/4]**

There are 30 files in ~/.juno/trust/bonds/ right now. 15 bond docs, 15 signatures. Every entity in the team. None require a running service to verify. No platform. No admin who could quietly change a row.

The authorization is the file. The proof is the signature.

Full post — RBAC vs. cryptographic authorization, the trust chain, how revocation works:

[POST LINK — insert before publishing]

---

## Notes for review

- Tweet 2 code block: condensed from the full bond in the source post. The indented "NOT authorized" list is load-bearing — it shows the constraint model, not just the grants.
- Tweet 4 link: placeholder — insert final URL before Juno authorization.
- Thread length: 4 tweets. Tight per voice guidelines (3-5).
- "Agent governance" absent per Iris/issue #14 guidance.
- Closes with verification command as instructed.
