---
name: tech-roadmap
description: Maintain the technical roadmap (Now / Next / Later) in ai-team/cto/roadmap.md, the company tech radar (Adopt / Trial / Assess / Caution) and the DORA delivery baseline, and write the monthly CTO briefing for the founder — what to do next technically for the company's stage, decisions waiting, risks, debt and when to get human help. Use for "what should we do next technically", "update the roadmap", "tech status", or the monthly scheduled run.
---

# tech-roadmap

Think like a careful fractional CTO at a start-up: few priorities, cheapest path first, no
technology for its own sake. Scheduled runs don't ask questions — they record them as obligations.

1. **Load everything**: `ai-team/company/` (stage, products, plans), `tech-profile.md`,
   `roadmap.md`, `tech-debt.md`, `adr/`, `history/`, reviews and digests since the last
   briefing, `learnings.md`; `ai-team/team.md` and other members' latest digests (product plans,
   devops incidents and costs, security findings) — read only.
2. **Stage check** — for the company's stage (idea → prototype → first customers → growing team →
   scaling), list what the technology should have by now and compare with the facts. Typical
   items: one product repo per product with protected main branch; ADRs for the core stack;
   automated tests on critical paths; CI on every change; repeatable deploys and a rollback path
   (→ `devops`); backups with a tested restore (→ `devops`); secrets out of code (→ `security`);
   error tracking and basic monitoring; open-source licence list (→ `lawyer`); access to code
   and accounts owned by the company, not by a contractor.
3. **Delivery baseline (DORA software-delivery metrics)** — estimate deployment frequency, change
   lead time, change fail rate, failed-deployment recovery time and deployment rework rate from
   git history, CI runs and the devops incident register; note the source and confidence (DORA
   moved from the original four keys to five metrics — check dora.dev for the current set). Use them as a trend for the founder, never as a
   target for people.
4. **Roadmap** — update Now / Next / Later: business goals from `company/` and the product member,
   debt pay-down from `tech-debt.md`, accepted ADR follow-ups, stage gaps. Each item says why it
   matters and its size. Keep Now short (≤ 5 items).
5. **Tech radar** — move technologies between Adopt / Trial / Assess / Caution in `tech-profile.md`
   when an ADR or experience justifies it; flag end-of-life dependencies (verify dates, rule 3).
6. **Human help** — check the escalation settings: anything that calls for a human engineer,
   security audit or due diligence this month (see `human-help`).
7. **Self-improvement** — count `general` learnings that are `pending`; if any, propose running
   `ai-cto:improve`.
8. **Write** `ai-team/cto/digests/YYYY-MM-DD-cto-briefing.md`:
   ```
   # CTO briefing — YYYY-MM-DD
   ## Top 3 technical priorities this month
   ## Decisions waiting for you (proposed ADRs, build-vs-buy)
   ## Risks (security, data loss, single points of failure, key-person dependency)
   ## Tech debt (top items, trend)
   ## Delivery baseline (DORA, with confidence)
   ## Deadlines (overdue / next 60 days)
   ## When to bring in a human expert this month (if at all)
   ## Questions for other team members
   ## Agent self-improvement (pending learnings)
   ```
9. `ai-cto:log-job` (journal entry; roadmap and radar changes; new obligations; open questions).
