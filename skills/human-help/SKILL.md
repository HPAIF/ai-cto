---
name: human-help
description: Decide when the company needs human technical help (a first engineer, a contractor or agency, a fractional CTO, a security auditor, a specialist) and prepare it — role scope, job description or statement of work, interview or take-home plan, vendor-evaluation questions, a short brief for a paid expert, or a technical due-diligence pack for investors. Use for "should I hire an engineer", "help me brief this agency", "review this contractor's quote", "investors want technical due diligence", or when rule 11 triggers escalation.
---

# human-help

The cheapest expert hour is the one that starts with a good brief. You prepare; the founder
decides, contacts and signs.

1. **Load memory**: `tech-profile.md` (escalation settings, help in place), `roadmap.md`,
   `tech-debt.md`, `adr/`, the company profile (stage, people, budget), active lessons.
2. **Decide the need.** Name the trigger (rule 11, a roadmap item beyond the current team, a
   skill gap, key-person risk, due diligence) and the kind of help that fits:
   - one-off expert hours (architecture second opinion, performance, a specific technology);
   - security review or penetration test (→ with `security`);
   - contractor or agency for a bounded piece of work;
   - first employee engineer, or a fractional CTO, when the work is continuous.
   Say what it should cost to find out cheaply first (e.g. a 2-hour paid consultation).
3. **Prepare the artefact** from `${CLAUDE_PLUGIN_ROOT}/templates/expert-brief.md` →
   `ai-team/cto/research/R-XXXX-slug.md`:
   - **Expert brief** — the question, context, what was tried, constraints, the exact deliverable
     wanted, links the expert may see. Share only what the expert needs; no secrets.
   - **Hiring** — role scope, must-have vs nice-to-have skills, a small realistic take-home or
     pairing exercise, interview questions, red flags, what access they get on day one.
   - **Contractor / agency** — statement-of-work outline (scope, milestones, acceptance criteria,
     code ownership, repo and accounts owned by the company, handover docs), vendor questions, how
     to review their quote. Contract terms and IP assignment → `lawyer`; payment terms →
     `accountant`.
   - **Technical due diligence pack** — architecture summary (C4 context/container), stack and
     ADR list, security posture (→ `security`), delivery baseline (DORA), incident history
     (→ `devops`), open-source licences (→ `lawyer`), known debt and plan, team and key-person
     risks. Facts only, with evidence; gaps marked as gaps.
4. **Access hygiene** — any outsider gets least-privilege access, their own accounts, no shared
   passwords, and an offboarding step; record it as obligations (grant / review / revoke).
5. **Never contact, post a job, sign or pay** — give the founder the text to send.
6. Update `tech-profile.md` ("Human help in place") once the founder confirms; `ai-cto:log-job`.
