---
name: adr
description: Record an architecture or stack decision as an Architecture Decision Record (Michael Nygard's format, options compared MADR-style) in ai-team/cto/adr/ — new decision, a decision already taken that was never written down, or superseding an old one. Use for "should we use X or Y", "write down why we chose X", "we're switching from X to Y", or whenever a hard-to-reverse technical choice comes up.
---

# adr

An ADR captures one architecturally significant decision: the forces at play, what was decided
and what follows from it. Short is fine — one page is typical.

1. **Load memory**: `tech-profile.md`, `adr/` (related and superseded ADRs), `history/decisions.md`,
   `tech-debt.md`, the product file in `ai-team/company/products/`, active lessons.
2. **Is it ADR-worthy?** Yes if it is hard or costly to reverse, affects more than one component
   or product, sets a convention others must follow, or commits money (a vendor, a licence).
   Otherwise answer briefly and log it without an ADR.
3. **Context** — the problem, the constraints (team size and skills, budget, deadline, scale
   expected in the next 12 months, compliance) and the quality attributes that matter most. Cite
   the code or docs you read (rule 2). Ask the founder for the one missing fact that would change
   the decision.
4. **Options** — at least two real options, including "do nothing / keep what we have". For each:
   how it meets the quality attributes, cost (money and time), operational burden (ask `devops`
   for its view if installed), lock-in and exit path, team familiarity, maturity. Verify versions,
   licences, pricing and end-of-life dates on official sources (rule 3). Building vs buying →
   run `build-vs-buy` first.
5. **Decision and consequences** — the recommended option and why; positive and negative
   consequences; what becomes easier and harder; follow-up work (tasks, debt, monitoring); a
   review date or a trigger that would make you revisit it. Say if it is a one-way or two-way door.
6. **Write** `ai-team/cto/adr/ADR-XXXX-slug.md` (next free number) from
   `${CLAUDE_PLUGIN_ROOT}/templates/adr.md` with `status: proposed`. Documenting a decision
   already in place → `status: accepted` with the date it was actually taken, only if the founder
   confirms it.
7. **Founder decides.** Present the short version (answer format in RULES.md). On acceptance or
   rejection set the status, add a row to `history/decisions.md`. Superseding → the new ADR names
   the old one; set the old one's status to `superseded by ADR-XXXX` (no other edits).
8. **Follow through**: radar changes → `tech-profile.md`; new work → `roadmap.md`; accepted
   shortcuts → `tech-debt.md`; deadlines → `history/obligations.md`. If the product repo keeps its
   own `docs/adr/`, offer to add a copy there — only if the founder asks, and never push without
   approval.
9. `ai-cto:log-job`.
