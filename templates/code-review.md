---
id: CR-0000
date: YYYY-MM-DD
product: ""
change: ""                   # PR number / branch / commit range / paths
author: ""                   # role, e.g. "contractor", "founder"
verdict: ""                  # approve | approve with changes | request changes
---

# Code review — <change title>

**Verdict:** … — one paragraph: what the change does and whether it is safe to merge.

## Intent
What the change is meant to do (PR description / issue / founder's words).

## Findings
| # | Severity (blocker / should / nit / praise) | File:line | Area (design, functionality, complexity, tests, naming, comments, style, docs, security) | Finding | Suggested change |
|---|---|---|---|---|---|

## Tests and checks run
| Command | Result |
|---|---|

## Security pointers (OWASP Top 10)
Anything about access control, injection, secrets, dependencies, logging — or "nothing found in
scope". Serious items → security member.

## Follow-ups
| What | Added as (TD-xxxx / O-xxxx / question for member) |
|---|---|
