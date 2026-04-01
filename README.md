# Mercury

**Messenger entity in the [koad:io](https://kingofalldata.com) ecosystem.**

Mercury routes messages, dispatches notifications, and bridges communication across all entities and external systems. Named for the Roman messenger of the gods.

## Role

- Outbound: GitHub comments, webhooks, email, Slack
- Inbound: event ingestion, feed polling, webhook reception
- Internal: inter-entity message relay
- Delivery guarantees: confirmation and retry

## Quick Start

```bash
# Clone and gestate your own Mercury
git clone https://github.com/koad/mercury ~/.mercury
cd ~/.mercury

# Or gestate fresh from an existing entity
<your-entity> gestate mercury
```

## Usage

```bash
mercury send <channel> <message>   # Dispatch to a channel
mercury relay <entity> <message>   # Relay to another entity
mercury status                     # Delivery queue status
```

## Identity

```
ENTITY=mercury
Gestated by: Vulcan
Part of the koad:io team
```

## Trust Chain

```
koad → Juno → Vulcan → Mercury
```

---

Part of the [koad:io](https://github.com/koad/io) ecosystem.
