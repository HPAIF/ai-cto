---
name: setup
description: Set up (or repair/upgrade) the AI CTO in the current project — creates the private ai-team/ workspace (shared company files + ai-team/cto/), maps the products to their code repositories, registers the CTO in team.md, and offers privacy, permissions and a monthly briefing. Use on first use in a project, when the workspace is missing, or after a plugin update that changes the workspace.
---

# setup

Template files are in `${CLAUDE_PLUGIN_ROOT}/skills/setup/workspace/`. Never overwrite an
existing file in `ai-team/` — the workspace may already hold real history.

1. **Explain** in two lines what will be created (`ai-team/` private workspace) and that nothing
   leaves the machine.
   **Location:** if an `ai-team/` already exists in this folder or a parent folder, join it —
   never create a second one. Otherwise ask where to create it: in this folder (default), or in a
   parent company folder when this project is one of several products (layout
   `<company>/ai-team/` next to `<company>/projects/<product>/`).
2. **Ask** (one question at a time, skip what is already in `ai-team/team.md` or the company
   files): answer language (default English). The CTO is jurisdiction-neutral — don't ask for one;
   keep any jurisdiction another member recorded.
3. **Create shared files if missing** (another member may have created them already):
   `ai-team/README.md`, `ai-team/team.md`, `ai-team/company/profile.md`,
   `ai-team/company/documents.md`, `ai-team/company/products/_template.md`. If you create
   `team.md`, fill the date and `workspace_contract: 1`; if you create the profile, fill the
   stage date.
4. **Create the member folder** `ai-team/cto/` from the template's `cto/` folder:
   `learnings.md`, `tech-profile.md`, `tech-debt.md`, `roadmap.md`,
   `history/{journal,decisions,obligations}.md`, `adr/README.md`, `reviews/README.md`,
   `research/README.md`, `digests/README.md`, `inbox/README.md`.
5. **Map the products to their code.** Read `ai-team/company/products/*.md` (the "Website /
   repo" line), the company `CLAUDE.md` and the `projects/` folder if there is one. List what you
   found and ask the founder to confirm; then fill the "Products and code" table in
   `tech-profile.md`. If you can read a repository, note its main language and framework from the
   manifest files (`package.json`, `pyproject.toml`, `go.mod`, …) — evidence, not guesses.
   No product file yet → offer to draft one from the project README; the founder confirms before
   you write.
6. **Register** a row in `team.md`: `cto | ai-cto | ai-cto:cto | ai-team/cto/ | <plugin version>
   | <today> | architecture, ADRs, code review, tech debt, roadmap, build vs buy`.
7. **First journal entry** `J-0001 · <today> · setup` and obligations `O-0001` "Confirm products,
   repositories and stack in cto/tech-profile.md" and `O-0002` "Set the human-expert threshold in
   cto/tech-profile.md" (due in 14 days).
8. **Offer, don't force** (ask each; do only what is approved):
   - **Privacy:** if the project is a git repo, add `ai-team/` to `.gitignore`; suggest
     `git init` inside `ai-team/` for private history.
   - **Permissions:** merge `${CLAUDE_PLUGIN_ROOT}/skills/setup/permissions.json` into the
     project's `.claude/settings.json` — read-only git commands and documentation sites are
     allowed without prompts; pushes, merges, resets, tags and releases always ask.
   - **Scheduled run:** monthly `tech-roadmap` briefing (e.g. 1st of month). Create it if a
     scheduling tool is available in this session; otherwise explain how to schedule it in the
     Claude app.
9. **Upgrade mode** (workspace exists): compare with the template, create only missing files or
   folders, apply migrations listed in `CHANGELOG.md` for versions newer than the one in
   `team.md`, update the version in the CTO's `team.md` row, and log what changed.
10. Finish with a short summary: what exists now, the three most useful first requests (e.g.
    "review the architecture of <product>", "record our stack as ADRs", "what tech debt do we
    have?"), and `log-job`.
