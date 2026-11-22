---
name: build-vs-buy
description: Decide whether to build a capability in-house, buy a SaaS/product, use open source, or outsource it — using Wardley-map evolution stages (genesis, custom, product, commodity), total cost of ownership over 1–3 years, lock-in and exit cost, and fit with the team. Writes a memo and an ADR. Use for "should we build or buy X", "which vendor for X", "can we just use an open-source X", "should we outsource this".
---

# build-vs-buy

Build what makes the company different; buy or rent what is a commodity. The work is in being
honest about which is which, and about the full cost.

1. **Load memory**: `tech-profile.md`, `adr/`, `roadmap.md`, the product file (costs and
   suppliers table), active lessons; the accountant's and lawyer's notes on the vendor if any.
2. **Define the capability** — what job it does, for whom, required quality attributes (uptime,
   data residency, security, scale in 12 months), integration points, deadline.
3. **Place it on the evolution axis** (Wardley): genesis (novel, poorly understood) → custom-built
   (understood, bespoke) → product / rental (several vendors) → commodity / utility (standard,
   metered). Is it part of what customers pay the company for? Default: build only genesis or
   custom capabilities that differentiate; buy, rent or use open source for products and
   commodities.
4. **Options** — usually: build; buy SaaS (2–3 named vendors); self-host open source; outsource
   to a contractor or agency. For each, verify on official sources and record the date checked:
   pricing tier that fits, licence (open source: obligations → `lawyer`), data location and
   processing terms (→ `lawyer` for the DPA), API limits, maturity and support.
5. **Total cost of ownership** (1 and 3 years): licence/subscription, hosting, build time
   (estimate in weeks × cost of the people), maintenance (typically ongoing, not one-off),
   operations and on-call (→ `devops`), migration and exit cost. Show the arithmetic (a small
   script beats mental math). Mark estimates as estimates.
6. **Risks** — lock-in and exit path, vendor viability, security and compliance, key-person risk
   for in-house code, opportunity cost (what the team won't build meanwhile).
7. **Write** a memo `ai-team/cto/research/R-XXXX-build-vs-buy-slug.md` from
   `${CLAUDE_PLUGIN_ROOT}/templates/build-vs-buy.md` with a recommendation and confidence, then an
   ADR with `ai-cto:adr` (status `proposed`).
8. **Never sign up, start a trial, accept terms or buy** — the founder does that after accepting
   the ADR. Money questions (budget, accounting treatment) → write the exact question (as "For @member: …", RULES: "Talk to colleagues only where the founder sees it") for the
   `accountant`.
9. `ai-cto:log-job`.
