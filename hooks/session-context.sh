#!/bin/bash
# AI CTO — SessionStart hook.
# Prints the CTO's memory for this project: date, company stage, overdue/upcoming obligations,
# last journal entries, ADRs awaiting the founder's decision, high-priority tech debt,
# pending learnings, inbox, latest digest.
# Silent when the project has no ai-team/cto workspace.
set -u
# Find the nearest workspace: ai-team/cto in the project folder or any parent folder
# (a company folder can hold ai-team/ next to projects/<product>/).
dir="${CLAUDE_PROJECT_DIR:-$PWD}"
WS=""
while [ -n "$dir" ] && [ "$dir" != "/" ]; do
  if [ -d "$dir/ai-team/cto" ]; then WS="$dir/ai-team"; break; fi
  dir=$(dirname "$dir")
done
[ -n "$WS" ] || exit 0
ME="$WS/cto"
cd "$ME" || exit 0

version=$(grep -m1 '"version"' "${CLAUDE_PLUGIN_ROOT:-.}/.claude-plugin/plugin.json" 2>/dev/null | sed 's/.*"version": *"\([^"]*\)".*/\1/')
today=$(date +%F)
soon=$(date -v+30d +%F 2>/dev/null || date -d '+30 days' +%F)

echo "=== AI CTO ${version:+v$version }— session context (${today}) ==="
echo "Rules: ${CLAUDE_PLUGIN_ROOT:-<plugin>}/RULES.md (agent ai-cto:cto). Cite the code you read. Decisions become ADRs (adr). Log every job (log-job). Never push, merge or deploy without explicit approval."
echo "Workspace: $WS  (every ai-team/... path in the rules and skills means this folder)"

stage=$(grep -m1 '^- \*\*Stage:\*\*' "$WS/company/profile.md" 2>/dev/null | sed 's/^- \*\*Stage:\*\* *//')
products=$(find "$WS/company/products" -name '*.md' ! -name '_template.md' 2>/dev/null | wc -l | tr -d ' ')
echo "Company stage: ${stage:-unknown} · Product files: ${products:-0}"
echo

echo "--- Technical obligations: overdue or due by ${soon} ---"
if [ -f history/obligations.md ]; then
  awk -F'|' -v today="$today" -v soon="$soon" '
    /^\| O-/ {
      id=$2; due=$3; type=$4; what=$5; status=$7
      gsub(/^ +| +$/, "", id); gsub(/^ +| +$/, "", due); gsub(/^ +| +$/, "", type)
      gsub(/^ +| +$/, "", what); gsub(/^ +| +$/, "", status)
      if (status == "open" && due ~ /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/ && due <= soon) {
        flag = (due < today) ? "OVERDUE " : ""
        printf "%s%s  %s  [%s] %s\n", flag, id, due, type, what; n++
      }
      if (status == "open" && due == "—") u++
    }
    END { if (n == 0) print "(none)"; if (u > 0) printf "(+ %d open items without a date)\n", u }' history/obligations.md
fi
echo

echo "--- Last journal entries ---"
j=$(grep '^## J-' history/journal.md 2>/dev/null | tail -n 6)
echo "${j:-(none)}"
echo

echo "--- ADRs awaiting the founder's decision (status: proposed) ---"
found=0
for f in adr/ADR-*.md; do
  [ -e "$f" ] || continue
  st=$(grep -m1 '^status:' "$f" | awk '{print $2}')
  if [ "$st" = "proposed" ]; then
    t=$(grep -m1 '^# ' "$f" | sed 's/^# *//')
    echo "$(basename "$f" .md)  ${t}"; found=1
  fi
done
[ $found -eq 0 ] && echo "(none)"
echo

hd=$(awk -F'|' '/^\| TD-/ { p=$10; s=$11; gsub(/ /, "", p); gsub(/ /, "", s); if (s == "open" && p == "high") n++ } END { print n+0 }' tech-debt.md 2>/dev/null)
pending=$(grep -c '^| L-[0-9]* .*| general .*| pending' learnings.md 2>/dev/null || true)
inbox=$(find inbox -type f ! -name 'README.md' ! -name '.*' 2>/dev/null | wc -l | tr -d ' ')
latest=$(ls -1 digests/20*.md 2>/dev/null | tail -n 1)
echo "Open high-priority tech debt: ${hd:-0} · Inbox: ${inbox:-0} file(s) · Pending general learnings: ${pending:-0}$( [ "${pending:-0}" -ge 3 ] && echo ' → suggest ai-cto:improve') · Latest digest: ${latest:-none yet}"
exit 0
