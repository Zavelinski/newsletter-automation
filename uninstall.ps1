# Remove the weekly-ai-digest skill from ~/.claude (or $env:CLAUDE_CONFIG_DIR).
$ErrorActionPreference = 'Stop'
$claudeDir = if ($env:CLAUDE_CONFIG_DIR) { $env:CLAUDE_CONFIG_DIR } else { Join-Path $HOME '.claude' }
Remove-Item -Recurse -Force (Join-Path $claudeDir 'skills\weekly-ai-digest') -ErrorAction SilentlyContinue
Write-Host "weekly-ai-digest uninstalled from $claudeDir."
