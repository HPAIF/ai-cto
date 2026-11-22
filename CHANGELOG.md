# Changelog

All notable changes to the AI CTO. Versions follow semver: patch = fixes and wording,
minor = new skill / workspace files, major = breaking workspace change.
Entries that need a workspace change list a **Migration** step; `setup` (upgrade mode) applies it.

## 0.1.1 — 2026-11-23
- Rule "Be concise": shortest answer that keeps all important information (warnings, numbers,
  dates, sources, decisions); long only when the content needs it.

## 0.1.0 — 2026-11-22
- Basic version, to be specialised later.
- Agent `cto`, rules (`RULES.md`), skills: setup, adr, tech-review, tech-debt, tech-roadmap,
  build-vs-buy, human-help, log-job, improve.
- Workspace folder `ai-team/cto/` (AI Team workspace contract v1): tech profile, tech-debt
  register, roadmap, ADRs, reviews, history, learnings; found in the project folder or any parent.
- Templates: ADR, architecture review, code review, build-vs-buy memo, expert brief.
- Session hook: obligations, journal, ADRs awaiting a decision, high-priority debt, inbox,
  pending learnings. Silent outside AI Team projects.
