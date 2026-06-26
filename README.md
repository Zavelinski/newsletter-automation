# weekly-ai-digest for Claude Code

[![License: MIT](https://img.shields.io/github/license/Zavelinski/newsletter-automation)](LICENSE)
[![Stars](https://img.shields.io/github/stars/Zavelinski/newsletter-automation?style=flat)](https://github.com/Zavelinski/newsletter-automation/stargazers)
[![Last commit](https://img.shields.io/github/last-commit/Zavelinski/newsletter-automation)](https://github.com/Zavelinski/newsletter-automation/commits)
[![Claude Code skill](https://img.shields.io/badge/Claude%20Code-skill-8A2BE2)](https://claude.com/claude-code)

A [Claude Code](https://claude.com/claude-code) skill that produces a **sourced, skimmable weekly AI roundup**. Ask for "what happened in AI this week" and Claude pulls the last 7 days from multiple sources, dedupes and clusters by story, ranks by signal, and writes a link-backed markdown digest. No hype, every factual claim linked.

It is **source-agnostic** and degrades gracefully: it uses the [`last30days`](https://github.com/) plugin if you have it installed, otherwise falls back to `WebSearch` + the Perplexity MCP. Whatever you have, it works.

## What it does

1. **Collect** — last30days plugin first (Reddit / HN / YouTube / X / Polymarket); else WebSearch with a 7-day recency filter + Perplexity for grounded summaries. Covers lab blogs, arXiv, HN front page, r/LocalLLaMA, r/MachineLearning.
2. **Dedup + cluster** — one entry per story, canonical link kept.
3. **Rank** — by novelty, reach, source diversity, and durability. No silent truncation (it tells you candidates considered vs included).
4. **Verify** — every headline links to a source fetched that run; no invented numbers, dates, or quotes.
5. **Write** — a markdown digest grouped into Headlines / Models & Releases / Research / Tools & Products / Discussion / One-liners.

Output defaults to `ai-digest-<YYYY>-W<week>.md` in the current directory.

## Install

```bash
git clone https://github.com/Zavelinski/newsletter-automation.git
cd newsletter-automation
```

**macOS / Linux**
```bash
bash install.sh
```

**Windows (PowerShell)**
```powershell
.\install.ps1
```

This is a skill-only install (no hooks, no `settings.json` changes) — it just copies one folder into `~/.claude/skills/`. Restart Claude Code, then ask for a **weekly AI digest** (or `/weekly-ai-digest`).

> Optional but recommended: install the `last30days` plugin for the richest collection. Without it, the skill falls back to `WebSearch` + Perplexity automatically.

## Use

- "give me the weekly AI digest"
- "what happened in AI this week"
- "/weekly-ai-digest, last 14 days, just open-weights models"

## Uninstall

```bash
bash uninstall.sh      # macOS / Linux
```
```powershell
.\uninstall.ps1        # Windows
```

## Provenance

Original work, written from scratch. Inspired by the general idea of a weekly AI newsletter pipeline, but it shares no text or code with any other skill. Not affiliated with any vendor or news source.

## License

MIT. See [LICENSE](LICENSE).
