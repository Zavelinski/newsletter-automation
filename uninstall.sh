#!/usr/bin/env bash
# Remove the weekly-ai-digest skill from ~/.claude (or $CLAUDE_CONFIG_DIR).
set -euo pipefail
claude_dir="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
rm -rf "$claude_dir/skills/weekly-ai-digest"
echo "weekly-ai-digest uninstalled from $claude_dir."
