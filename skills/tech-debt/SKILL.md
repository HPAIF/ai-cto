---
name: tech-debt
description: Find, record, score and prioritise technical debt in ai-team/cto/tech-debt.md — classify with Martin Fowler's technical-debt quadrant, weigh interest against fix effort, and propose what to pay down next. Use for "what tech debt do we have", "what should we refactor", "add this to the debt list", a code-health audit, or before planning the roadmap.
---

# tech-debt

Debt is fine when it is a choice with a plan. The register makes it visible so it is paid down on
purpose, not by accident during an outage.

1. **Load memory**: `tech-debt.md`, recent `reviews/`, `adr/` (accepted shortcuts),
   `roadmap.md`, `tech-profile.md`, active lessons. If `devops` is installed, read its incident
   register and postmortems — repeated causes are debt.
2. **Find** (audit mode, when asked): for each product, read — don't guess — the signals:
   outdated or end-of-life dependencies (check dates on official sources or endoflife.date and
   record the date checked), missing or flaky tests around critical paths (payments, auth, data
   writes), duplicated logic, very large files or functions that change often (`git log` churn),
   TODO/FIXME/HACK markers, manual deploy steps, missing monitoring, secrets in code (→ `security`
   at once), code no one understands. Cite paths and commits.
3. **Record** each item as a row in `tech-debt.md` (next TD-number): where, what, Fowler quadrant
   (reckless/prudent × deliberate/inadvertent), interest (what keeping it costs: H/M/L), effort to
   fix (S/M/L), priority, status, links.
4. **Prioritise** — high priority when interest is high and the area changes often, or when it
   carries security, data-loss or compliance risk. Low-interest debt in code that rarely changes
   may stay as `accepted` (Fowler: prudent debt is not always worth paying down). Explain the call.
5. **Plan** — propose the top 3 items to pay down, sized, with a suggestion where they fit
   (alongside related feature work, or a dedicated slot) and add them to `roadmap.md` (Now/Next)
   if the founder agrees. A rule of thumb to offer, not impose: a steady share of each cycle for
   debt rather than big rewrites.
6. **Answer** in the format in RULES.md: the top items, why, and what to do.
7. `ai-cto:log-job` (new TD rows, status changes, roadmap changes).
