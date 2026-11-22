---
name: log-job
description: Record a job in the company's technical memory — journal entry plus updates to decisions, ADR index, obligations, tech-debt register, roadmap, tech profile, shared company facts and learnings. Use at the end of every task that produced advice, a review, an ADR, a decision, a code change, a deadline or a change of company facts (including scheduled runs).
---

# log-job

All history files are **append-only**: add rows/entries; to correct, add a new entry that
references the old one. Never delete history. Get today's date with `date +%F`.
Paths below are under `ai-team/cto/` unless they start with `ai-team/`.

1. **Journal** — append to `history/journal.md` (next J-number, format at the top of the file):
   request, what was done, output files, product-code changes (repo, branch, commit — never
   pushed unless approved), evidence read and docs checked with dates, follow-ups.
2. **Decisions** — the founder accepted or rejected something (an ADR, a vendor, a hire, accepting
   a risk) → append to `history/decisions.md` linking the ADR or memo, and set the ADR's `status:`.
3. **Obligations** — every deadline, recurring duty or recommended action → append a row to
   `history/obligations.md` (keep the exact table format; due date `YYYY-MM-DD` or `—`). Mark
   finished ones `done` (don't delete the row).
4. **Tech debt** — new debt found → add a row to `tech-debt.md`; debt paid → set status `paid`
   with the date and link.
5. **Roadmap and tech profile** — items started, finished or re-prioritised → `roadmap.md`;
   new stack facts, repo paths, environments or radar moves → `tech-profile.md`.
6. **Company facts** — new or changed facts → update `ai-team/company/profile.md`, the product
   file in `ai-team/company/products/` or `ai-team/company/documents.md`, and say in the journal
   entry what changed (these files are shared with other members).
7. **Learnings** — anything this task taught you (correction, mistake, moved doc, missing step)
   → append to `learnings.md` with the right scope (see RULES.md).
8. Confirm to the founder in one line what was recorded (e.g. "Logged J-0007, ADR-0003, TD-0012,
   O-0004, L-0002").
