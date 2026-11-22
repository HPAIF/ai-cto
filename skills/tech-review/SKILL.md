---
name: tech-review
description: Review a product's architecture (C4 views, AWS Well-Architected pillars as a lens, Twelve-Factor App check) or review code (a pull request, diff, branch or module, following Google's engineering-practices review guide and OWASP Top 10 as a security pointer). Writes a review with cited findings and feeds the tech-debt register. Use for "review the architecture", "review this PR / diff / module", "is this code OK to merge", "what's wrong with our codebase".
---

# tech-review

Pick the mode from the request: **architecture** (the whole system or a product) or **code**
(a change or a module). Read before you judge — every finding cites a file, line, commit or config.

## Common start
1. **Load memory**: `tech-profile.md`, the product file, `adr/` (decisions the code must honour),
   `tech-debt.md`, earlier `reviews/` of the same product, active lessons. Find the repository
   from the product file / company `CLAUDE.md`.
2. **Scope** — what exactly is reviewed (repo + branch/commit, PR number, paths) and what is out of
   scope. Read-only: `git log`, `git diff`, `git show`, reading files. Never check out over the
   founder's uncommitted work; never push.

## Architecture mode
3. **Map it (C4).** Describe the System Context (users, external systems) and Containers (apps,
   services, databases, queues, third-party APIs) from what you read — manifests, configs,
   infrastructure files, docker/compose files, environment variable names (never values). Draw the
   two levels as text or Mermaid in the review. Components only where it matters.
4. **Assess** against the Well-Architected pillars as questions: operational excellence (can it be
   deployed and observed?), security (auth, secrets, data exposure — hand deep issues to
   `security`), reliability (single points of failure, backups — confirm with `devops`),
   performance efficiency, cost optimisation, sustainability (briefly). Then a Twelve-Factor check
   for deployable services: config in the environment, backing services as attached resources,
   stateless processes, dev/prod parity, logs as streams, disposability.
5. **Check fit**: does the architecture match the stage (no microservices for a team of one
   without a reason), the ADRs, and the next 12 months of the roadmap?
6. **Write** `ai-team/cto/reviews/AR-XXXX-slug.md` from `${CLAUDE_PLUGIN_ROOT}/templates/architecture-review.md`.

## Code mode
3. **Understand the intent** — the PR description, linked issue or the founder's words. Then read
   the whole change, and enough surrounding code to know it fits.
4. **Look for** (Google's "what to look for" order): design (does it belong here, does it fit the
   architecture), functionality (does it do what's intended, edge cases, concurrency), complexity
   and over-engineering, tests (present, meaningful, would they fail if the code broke), naming,
   comments explaining *why*, consistency with the codebase style, documentation. Security
   pointers from the OWASP Top 10 — access control, injection, secrets in code, unsafe
   deserialization, vulnerable dependencies, missing logging of security events; anything serious
   → `security` member and rule 11.
5. **Run what is safe** — the project's tests, linters or type checks, if the founder agrees and
   they don't touch production or external services. Report results with the command used.
6. **Grade each finding**: `blocker` (must fix before merge) · `should` · `nit` · `praise`.
   Write `ai-team/cto/reviews/CR-XXXX-slug.md` from `${CLAUDE_PLUGIN_ROOT}/templates/code-review.md`
   with a verdict: approve / approve with changes / request changes.

## Common finish
7. **Feed the registers**: unfixed findings → `tech-debt.md`; decisions discovered without an ADR
   → propose one with `adr`; infra and ops findings → question for `devops`; deadlines →
   `history/obligations.md`.
8. **Fixes**: offer to make the fixes on a branch. Do it only when the founder asks; show the diff;
   never push, merge or comment on a PR without explicit approval of that exact action.
9. `ai-cto:log-job`.
