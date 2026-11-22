# Contributing

Improvements are welcome — new skills, better procedures, sharper templates. Many will arrive as
pull requests from the agent's own `improve` skill.

## The one rule: no company data
This repository is public. Never commit anything from an `ai-team/` workspace or a private product
repository: names, repositories, hostnames, account IDs, code, amounts, incidents, dates of private
events. Use neutral examples ("a web app on a managed Postgres", "a payments vendor").

## What goes where
| Change | File |
|---|---|
| A rule every company should follow | `RULES.md` (rules may be added or clarified, never weakened) |
| A procedure | `skills/<skill>/SKILL.md` (new skill → new folder + row in RULES.md skills table) |
| A document format | `templates/` |
| Workspace files | `skills/setup/workspace/` + a **Migration** note in `CHANGELOG.md` |
| A framework the skills rely on | `docs/research.md` (link + short paraphrase) |

Hard rules that may never be weakened: read the memory first · evidence from the code · verify
changing facts · decisions as ADRs the founder accepts · append-only history · never invent ·
confidentiality · never push, merge or deploy without explicit approval · escalation.

The shared workspace files (`skills/setup/workspace/README.md`, `team.md`, `company/`) are
identical in every AI Team member; change them in all members together.

## Release
1. Bump `version` in `.claude-plugin/plugin.json` (patch / minor / major — see CHANGELOG).
2. Add a `CHANGELOG.md` entry (with a Migration step if the workspace changes).
3. `claude plugin validate .` must pass.
4. Merge to `main`. Users get it with `/plugin update ai-cto@ai-team`.
