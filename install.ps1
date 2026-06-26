# Install the weekly-ai-digest skill into ~/.claude (or $env:CLAUDE_CONFIG_DIR).
$ErrorActionPreference = 'Stop'

$repo = Split-Path -Parent $MyInvocation.MyCommand.Path
$claudeDir = if ($env:CLAUDE_CONFIG_DIR) { $env:CLAUDE_CONFIG_DIR } else { Join-Path $HOME '.claude' }

New-Item -ItemType Directory -Force -Path (Join-Path $claudeDir 'skills\weekly-ai-digest') | Out-Null
Copy-Item (Join-Path $repo 'skills\weekly-ai-digest\SKILL.md') (Join-Path $claudeDir 'skills\weekly-ai-digest\SKILL.md') -Force

Write-Host ""
Write-Host "weekly-ai-digest installed into $claudeDir"
Write-Host "Restart Claude Code, then ask for a 'weekly AI digest' (or /weekly-ai-digest)."
