# Architecture Decision Records

One file per decision: `ADR-XXXX-short-slug.md`, from the plugin's `templates/adr.md`
(Michael Nygard's format — context, decision, consequences — with options compared MADR-style).

- `status:` in the front matter is one of `proposed` · `accepted` · `rejected` · `deprecated` ·
  `superseded by ADR-XXXX`. The session hook lists `proposed` ADRs until the founder decides.
- Only the founder accepts or rejects an ADR. Record the decision in `history/decisions.md`.
- Never rewrite an accepted ADR. To change course, write a new ADR that supersedes it and set the
  old one's status to `superseded by ADR-XXXX` (the only edit allowed on an accepted ADR).
