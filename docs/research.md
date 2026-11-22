# Research behind the AI CTO

What an early-stage CTO does, and which established frameworks the rules and skills rely on.
Links plus short paraphrases; read the sources for the details. Researched 2026-11-22.

## What a CTO / fractional CTO does for an early-stage startup

- [AltexSoft — Fractional CTO: when do you need one](https://www.altexsoft.com/blog/fractional-cto/),
  [Arc — Fractional CTO: what they do](https://arc.dev/employer-blog/fractional-cto/),
  [madewithlove — The fractional CTO explained](https://madewithlove.com/blog/the-fractional-cto-explained.md),
  [RaftLabs — What does a fractional CTO actually do](https://www.raftlabs.com/blog/what-does-fractional-cto-do):
  the recurring scope is technical strategy and architecture decisions, technology and vendor
  evaluation, architecture and code review, a technology roadmap, prioritising technical debt,
  engineering process, hiring and team structure, and technical communication with investors
  (including surviving technical due diligence). At seed stage the work is more hands-on
  architecture and first hires; later it shifts to team and process. Several sources note the
  model fits best once there is a product and some users; pre-product founders mostly need
  sound, cheap, reversible choices.
- Vendor blogs (cost ranges, time splits) are marketing-grade; we used them only for the scope.

**Used for:** the skill set (adr, tech-review, tech-debt, tech-roadmap, build-vs-buy,
human-help), the stage check in `tech-roadmap`, and the due-diligence pack in `human-help`.

## Architecture Decision Records (ADR)

- [Martin Fowler — Architecture Decision Record](https://www.martinfowler.com/bliki/ArchitectureDecisionRecord.html):
  credits Michael Nygard (2011) with the idea; an ADR is a short document capturing one
  significant decision, kept with the code, never rewritten — a changed decision gets a new ADR
  that supersedes the old one.
- [MADR — Markdown Architectural Decision Records](https://adr.github.io/madr/) and
  [adr.github.io](https://adr.github.io/): Nygard's format is title, status, context, decision,
  consequences; MADR adds explicit considered options with pros and cons.

**Used for:** hard rule 4, the `adr` skill, `templates/adr.md` (Nygard sections + MADR options),
statuses `proposed / accepted / rejected / deprecated / superseded`, and the session hook that
lists proposed ADRs.

## C4 model

- [c4model.com](https://c4model.com/) (Simon Brown) and
  [InfoQ — The C4 model for software architecture](https://www.infoq.com/articles/C4-architecture-model/):
  hierarchical diagrams at four zoom levels — system context, containers, components, code (the
  last optional) — each for a different audience; notation- and tool-independent, with
  supplementary deployment and dynamic views.

**Used for:** the architecture mode of `tech-review` (context + container levels drawn from what
was read), `templates/architecture-review.md`, the due-diligence pack.

## AWS Well-Architected Framework

- [AWS Well-Architected — definitions](https://docs.aws.amazon.com/wellarchitected/latest/framework/definitions.html):
  six pillars — operational excellence, security, reliability, performance efficiency, cost
  optimisation, sustainability — with trade-offs between them. Vendor-specific in its tooling,
  but the pillars work as a generic review lens.

**Used for:** the assessment table in architecture reviews (as questions, not an AWS checklist).

## The Twelve-Factor App

- [12factor.net](https://12factor.net/): a methodology for deployable web services — config in
  the environment, backing services as attached resources, stateless processes, dev/prod parity,
  logs as streams, disposability (fast start, graceful shutdown) and more. Some authors note it is
  partly tied to its platform-as-a-service origins, so we use it as a check, not dogma.

**Used for:** the 12-factor check in `tech-review` and the architecture-review template.

## Code review

- [Google Engineering Practices — What to look for in a code review](https://google.github.io/eng-practices/review/reviewer/looking-for.html)
  and [the review guide](https://google.github.io/eng-practices/review/): design matters most,
  then functionality, complexity (avoid over-engineering — solve today's problem), tests, naming,
  comments that explain why, style consistency, documentation; read every line in scope.
- [OWASP Top 10:2025](https://owasp.org/Top10/2025/0x00_2025-Introduction/): the current list of
  the most critical web application risks (broken access control first; new categories include
  software supply-chain failures and mishandling of exceptional conditions).

**Used for:** the code mode of `tech-review` (order of checks, severity grading,
`templates/code-review.md`) and security pointers that hand serious issues to `security`.

## Technical debt

- [Martin Fowler — Technical Debt Quadrant](https://martinfowler.com/bliki/TechnicalDebtQuadrant.html)
  and [Technical Debt](https://martinfowler.com/bliki/TechnicalDebt.html): debt classified as
  reckless or prudent, deliberate or inadvertent; the useful question is whether debt is prudent,
  and prudent debt in rarely touched code may not be worth paying down if its interest is small.

**Used for:** the `tech-debt` skill and register columns (quadrant, interest, effort, priority,
status `accepted`).

## Technology Radar

- [Thoughtworks Technology Radar FAQ](https://www.thoughtworks.com/en-us/radar/faq): rings Adopt
  (proven, seriously consider it), Trial (ready, try on a limited basis; placed only with
  production experience), Assess (worth watching) and Caution (widely accepted but problematic in
  their experience — the ring long known as Hold).

**Used for:** the company tech radar in `tech-profile.md`, maintained by `tech-roadmap` and `adr`.

## DORA metrics

- [DORA — software delivery performance metrics](https://dora.dev/guides/dora-metrics-four-keys/):
  the original "four keys" (deployment frequency, lead time for changes, change failure rate,
  time to restore) have become five — change lead time, deployment frequency, failed-deployment
  recovery time (replacing MTTR), change fail rate and deployment rework rate — read together so
  throughput is balanced by stability.
- [DORA — continuous delivery capability](https://dora.dev/capabilities/continuous-delivery/) and
  [Atlassian — DORA metrics](https://www.atlassian.com/devops/frameworks/dora-metrics):
  practitioners warn against turning the metrics into targets for teams.

**Used for:** the delivery baseline in `roadmap.md` and the CTO briefing (as a trend, never a
target for people). DevOps owns the pipeline; the CTO reads the numbers.

## Build vs buy

- [Wardley mapping — build, buy or borrow (Barking Iguana)](https://barkingiguana.com/writing/wardley-mapping-build-buy-or-borrow/)
  (shows how a cheap-looking custom build gathers maintenance cost with every integration) and [Thoughtworks — Build vs buy e-book](https://www.thoughtworks.com/content/dam/thoughtworks/documents/e-book/tw_ebook_build_vs_buy_2022.pdf):
  components evolve from genesis through custom-built and product to commodity; build what is
  novel and differentiating, buy, rent or use open source for products and commodities. Newer
  commentary argues cheap AI-assisted building shifts the line — an open question, so the skill
  still weighs total cost of ownership including maintenance.

**Used for:** the `build-vs-buy` skill (evolution stage, TCO over 1 and 3 years, lock-in and
exit) and `templates/build-vs-buy.md`.

## Not adopted (for now)

- Formal enterprise architecture frameworks (TOGAF and similar): too heavy for an early-stage
  company. Revisit if the plugin is specialised for larger teams.
