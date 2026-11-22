# AI CTO

A tech lead / fractional CTO for founders, running in Claude Code. Part of the
**[AI Team](https://github.com/HPAIF/ai-team)** — agents that work together for your company.

It writes your architecture and stack decisions down as **ADRs**, reviews the **architecture and
code** of your products, keeps a **tech-debt register** and a **technical roadmap**, weighs
**build vs buy**, and tells you **when to bring in a human engineer** — with a brief ready so the
paid hours are few. It cites the code it actually read, and gets better from what it learns.

> **It is an AI assistant, not a senior engineer you can hold accountable.** For security
> incidents, expensive one-way decisions, regulated domains and investor due diligence it tells
> you to get a human expert. It never pushes, merges or deploys without your explicit approval of
> that exact action.

## Install

In Claude Code:

```
/plugin marketplace add HPAIF/ai-team
/plugin install ai-cto@ai-team
```

Or install only this member, straight from its repository:

```
/plugin marketplace add HPAIF/ai-cto
/plugin install ai-cto@ai-cto
```

Then, in your project (or your company folder), say **"set up the AI CTO"**. The `setup` skill
creates — or joins — the private `ai-team/` workspace, maps your products to their repositories,
and offers `.gitignore`, read-only permissions and a monthly briefing. Nothing leaves your machine.

To share the setup with your team, commit this to the project's `.claude/settings.json`:

```json
{
  "extraKnownMarketplaces": {
    "ai-team": { "source": { "source": "github", "repo": "HPAIF/ai-team" } }
  },
  "enabledPlugins": { "ai-cto@ai-team": true }
}
```

## Use it

Talk normally — Claude hands technical leadership work to the `ai-cto:cto` agent — or start a
session as the CTO: `claude --agent ai-cto:cto`.

| You say | What happens (skill) |
|---|---|
| "Postgres or MongoDB for this?" / "write down why we chose X" | ADR with options and consequences (`adr`) |
| "Review the architecture of our app" | C4 map + Well-Architected and 12-factor assessment (`tech-review`) |
| "Review this PR before I merge" | code review with graded, cited findings (`tech-review`) |
| "What tech debt do we have?" | debt register, scored and prioritised (`tech-debt`) |
| "What should we do next technically?" | roadmap update + CTO briefing (`tech-roadmap`) |
| "Build or buy auth / billing / search?" | TCO memo + ADR (`build-vs-buy`) |
| "Should I hire an engineer?" / "brief this agency" | brief, job spec, SOW or due-diligence pack (`human-help`) |
| "We decided X" / "the contractor finished Y" | history and company facts updated (`log-job`) |
| "Improve yourself" | anonymised upgrade proposal for this plugin (`improve`) |

Each session in a project with a workspace starts with overdue and upcoming technical
obligations, recent jobs, ADRs waiting for your decision, high-priority tech debt and pending
learnings (session hook).

**Scheduled run** (offered by `setup`): monthly `tech-roadmap` briefing.

## How it is built

```
RULES.md                 hard rules: evidence from the code, verify changing facts, ADRs, never push without approval…
agents/cto.md            the agent (reads RULES.md and the workspace)
skills/                  setup · adr · tech-review · tech-debt · tech-roadmap · build-vs-buy ·
                         human-help · log-job · improve
templates/               ADR, architecture review, code review, build-vs-buy memo, expert brief
hooks/                   session-start context
docs/research.md         the frameworks behind the skills, with links
```

Frameworks it relies on: Architecture Decision Records (Nygard, MADR), the C4 model, AWS
Well-Architected pillars, the Twelve-Factor App, Google's code-review guide, OWASP Top 10,
Fowler's technical-debt quadrant, the Thoughtworks Technology Radar rings, DORA's software-delivery metrics and
Wardley-map evolution stages. See [docs/research.md](docs/research.md).

Your data lives in **your project**, never in the plugin. Product code stays in its own
repository (`projects/<product>/` in the company layout):

```
ai-team/
├── team.md                  installed members
├── company/                 shared with other members: profile, documents, products/<product>.md
└── cto/                     learnings, tech-profile, tech-debt, roadmap, history (journal,
                             decisions, obligations), adr, reviews, research, digests, inbox
```

See the [workspace contract](https://github.com/HPAIF/ai-team/blob/main/docs/workspace.md).

## Privacy
- The plugin is public; your workspace and code are private. Keep `ai-team/` out of public
  repositories (`setup` offers to add it to `.gitignore`) — `git init` inside it for a private
  history.
- The CTO searches the web for the *technical question*, never your company's facts or code.
- Files the agent reads are processed by the model you use in Claude Code.

## Self-improvement
1. After corrections, mistakes, moved docs or missing steps, the CTO writes a lesson to
   `ai-team/cto/learnings.md` and applies it from then on.
2. Lessons useful to everyone are marked `general`. The `improve` skill turns them into an
   anonymised pull request to this repository — only after you approve the exact text, and never
   one that weakens the hard rules.
3. Merged improvements reach every user with the next plugin update.

## Team hand-offs
The CTO decides the architecture; `devops` runs it (deploys, monitoring, incidents, backups,
costs). Security findings go to `security`, feature priorities to `product`, licences and
contractor contracts to `lawyer`, the money side of build vs buy to `accountant`; `lead` is the
entry point. If a member isn't installed, the CTO names the plugin (`ai-<member>`).

## Upgrading
`/plugin marketplace update ai-team`, then `/plugin update ai-cto@ai-team` (restart Claude Code).
Run "set up the AI CTO" again to apply workspace migrations; it never overwrites your history.

## Contributing
See [CONTRIBUTING.md](CONTRIBUTING.md). License: [MIT](LICENSE).
