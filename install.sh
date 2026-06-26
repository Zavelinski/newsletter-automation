#!/usr/bin/env bash
# Install the weekly-ai-digest skill into ~/.claude (or $CLAUDE_CONFIG_DIR).
set -euo pipefail

repo="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
claude_dir="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"

mkdir -p "$claude_dir/skills/weekly-ai-digest"
cp "$repo/skills/weekly-ai-digest/SKILL.md" "$claude_dir/skills/weekly-ai-digest/SKILL.md"

echo ""
echo "weekly-ai-digest installed into $claude_dir"
echo "Restart Claude Code, then ask for a 'weekly AI digest' (or /weekly-ai-digest)."
