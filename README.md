# weekly-ai-digest for Claude Code

[![License: MIT](https://img.shields.io/github/license/Zavelinski/claude-code-weekly-ai-digest)](LICENSE)
[![Stars](https://img.shields.io/github/stars/Zavelinski/claude-code-weekly-ai-digest?style=flat)](https://github.com/Zavelinski/claude-code-weekly-ai-digest/stargazers)
[![Last commit](https://img.shields.io/github/last-commit/Zavelinski/claude-code-weekly-ai-digest)](https://github.com/Zavelinski/claude-code-weekly-ai-digest/commits)
[![Claude Code skill](https://img.shields.io/badge/Claude%20Code-skill-8A2BE2)](https://claude.com/claude-code)

A [Claude Code](https://claude.com/claude-code) skill that produces a **sourced, skimmable weekly AI roundup**. Ask for "what happened in AI this week" and Claude pulls the last 7 days from multiple sources, dedupes and clusters by story, ranks by signal, and writes a link-backed markdown digest. No hype, every factual claim linked.

It is **source-agnostic** and degrades gracefully: it uses the [`last30days`](https://github.com/) plugin if you have it installed, otherwise falls back to `WebSearch` + the Perplexity MCP. Whatever you have, it works.

## Prerequisites

Claude Code with `/plugin` support (v2.x+) and a shell if you use the manual fallback.

## Install

### Option 1 — Claude Code plugin marketplace (recommended)

```bash
/plugin marketplace add Zavelinski/claude-code-skills
/plugin install weekly-ai-digest@claude-code-skills
```

Registered hooks (if any) install through the Claude Code consent UI, with no manual edit to `~/.claude/settings.json`.

### Option 2 — Manual fallback (run it yourself)

> **Security note.** This script mutates `~/.claude/settings.json` directly. Claude Code auto-mode blocks it because a third-party `UserPromptSubmit` hook that injects text into every prompt is a known risk vector. The script is benign and local-only (no network), but you must review and run it yourself. Prefer Option 1.

```bash
git clone https://github.com/Zavelinski/claude-code-weekly-ai-digest.git
cd claude-code-weekly-ai-digest
bash install.sh        # macOS / Linux
.\install.ps1          # Windows (PowerShell)
```

## Uninstall

```bash
/plugin uninstall weekly-ai-digest@claude-code-skills    # Option 1
bash uninstall.sh                                # Option 2 (or uninstall.ps1 on Windows)
```

## Update

```bash
/plugin marketplace update claude-code-skills    # Option 1
# Option 2: pull the latest commit and re-run the manual fallback.
```

## What it does

1. **Collect** — last30days plugin first (Reddit / HN / YouTube / X / Polymarket); else WebSearch with a 7-day recency filter + Perplexity for grounded summaries. Covers lab blogs, arXiv, HN front page, r/LocalLLaMA, r/MachineLearning.
2. **Dedup + cluster** — one entry per story, canonical link kept.
3. **Rank** — by novelty, reach, source diversity, and durability. No silent truncation (it tells you candidates considered vs included).
4. **Verify** — every headline links to a source fetched that run; no invented numbers, dates, or quotes.
5. **Write** — a markdown digest grouped into Headlines / Models & Releases / Research / Tools & Products / Discussion / One-liners.

Output defaults to `ai-digest-<YYYY>-W<week>.md` in the current directory.

## Use

- "give me the weekly AI digest"
- "what happened in AI this week"
- "/weekly-ai-digest, last 14 days, just open-weights models"

## Provenance

Original work, written from scratch. Inspired by the general idea of a weekly AI newsletter pipeline, but it shares no text or code with any other skill. Not affiliated with any vendor or news source.

## License

MIT. See [LICENSE](LICENSE).

---

## Part of claude-code-skills

This skill ships in the [claude-code-skills](https://zavelinski.github.io/claude-code-skills/) marketplace. Browse its landing page: [weekly-ai-digest](https://zavelinski.github.io/claude-code-skills/weekly-ai-digest.html). See also: [content-repurpose-engine](https://github.com/Zavelinski/claude-code-content-repurpose-engine), [docs-drift-sync](https://github.com/Zavelinski/claude-code-docs-drift-sync).