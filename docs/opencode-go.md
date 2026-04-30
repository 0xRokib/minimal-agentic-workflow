# OpenCode Go — The $10/month AI Coding Plan

OpenCode Go is a subscription that gives you API access to a curated fleet of coding-optimized LLMs for **$5 first month, then $10/month**. It's the cheapest way to run production-grade AI coding agents.

---

## What You Actually Get

An **API key** and **endpoint** that's OpenAI-compatible. You point any agent at it and it works — OpenCode CLI, Pi, Claude Code, Cursor, Continue, Aider, you name it.

```
Your agent  →  https://api.opencode.ai/v1  →  Curated model fleet
              (OpenAI-compatible)              (DeepSeek, Qwen, Kimi, GLM…)
```

No per-token billing. No surprise invoices. Just flat $10/month.

---

## Models Available

OpenCode Go rotates models based on what's best at any given time. The fleet typically includes:

| Model Family | Strengths |
|-------------|-----------|
| **DeepSeek** (V3, R1) | Strong reasoning, large context windows, excellent for complex refactors |
| **Qwen** (2.5, Coder) | Fast, reliable all-around coding, good at following instructions |
| **Kimi** (K2) | Very long context (great for whole-codebase analysis) |
| **GLM** | Solid reasoning, good at architecture and planning |
| **MiniMax** | Quick iteration, responsive for simple tasks |
| **MiMo** | Creative problem-solving, novel approaches |

> Models update regularly. The fleet is managed — you don't pick individual models, the platform routes to the best available one for your request. For specific model selection, use [OpenCode Zen](https://opencode.ai/zen).

---

## Rate Limits: The 5-Hour Window

Instead of monthly token caps, OpenCode Go uses **rolling 5-hour windows**:

- You get a generous number of requests per window
- Window resets automatically every 5 hours
- If you hit the limit, you wait (or top up with credit)
- In practice: enough for a full day of heavy coding for one dev

This means you won't get a "you've used all your tokens this month" surprise on day 5. It's designed for daily use, not burst-and-done.

---

## OpenCode Go vs. Everything Else

### vs. API Pay-as-You-Go (OpenAI, Anthropic)

```
API (Claude Sonnet):  $3.00/1M input + $15.00/1M output
                      Heavy coding day = easily $10–30
OpenCode Go:         $10 flat. Same work, fixed cost.
```

### vs. GitHub Copilot

| | OpenCode Go | GitHub Copilot |
|---|---|---|
| **Cost** | $5→$10/mo | $10/mo |
| **Models** | 8+ curated | GPT-4o / Claude (limited) |
| **Agent support** | Any OpenAI-compatible agent | IDE-only (mostly) |
| **Flexibility** | Use with Pi, CLI, any tool | VS Code / JetBrains / neovim |
| **Best for** | Agentic workflows, terminal-native devs | IDE-integrated autocomplete |

### vs. ChatGPT Plus / Claude Pro

| | OpenCode Go | ChatGPT Plus | Claude Pro |
|---|---|---|---|
| **Cost** | $5→$10/mo | $20/mo | $20/mo |
| **Purpose** | Coding agents | General chat | General chat |
| **API access** | Yes (OpenAI-compatible) | No (chat UI only) | No (chat UI only) |
| **Agent support** | Full | None | Limited (MCP) |

---

## OpenCode Zen — The Power-User Tier

Zen is the pay-as-you-go complement to Go:

| | Go | Zen |
|---|---|---|
| **Billing** | $10/mo flat | Per-token |
| **Models** | Curated coding fleet | Premium: Claude, GPT-4o, Gemini |
| **Min deposit** | N/A | $20 |
| **Use case** | Daily driver | When you need a specific model |
| **Model choice** | Automatic | You pick |

**Strategy**: Use Go for 80% of work. Top up Zen when you need Claude Sonnet for a gnarly refactor or GPT-4o for a complex greenfield build.

---

## Setup (2 Minutes)

### 1. Subscribe

Go to [opencode.ai/go](https://opencode.ai/go) → subscribe → get your API key.

### 2. Configure your agent

```bash
# OpenCode CLI
opencode --api-key "go-..."

# Pi (OpenAI-compatible)
export OPENAI_BASE_URL="https://api.opencode.ai/v1"
export OPENAI_API_KEY="go-..."

# Claude Code
# Add to .claude/settings.json:
# { "apiKey": "go-...", "baseURL": "https://api.opencode.ai/v1" }

# Cursor / Continue / Aider
# Add as custom OpenAI-compatible provider with the same URL + key
```

### 3. Start coding

```bash
opencode "add dark mode toggle"
# or
pi "fix the login timeout bug"
```

That's it. No model configuration needed — the platform picks the best model for your request.

---

## The OpenCode Agent (Free, OSS)

OpenCode itself is worth understanding separately from the Go plan:

- **Free and open source** — MIT license, no restrictions
- **Written in Go** — single binary, no dependencies
- **LSP-native** — reads your codebase through language servers, not grep
- **Terminal-native** — CLI + TUI, works over SSH, in tmux, on any OS
- **OpenAI-compatible** — works with any provider, not just Go

```bash
# Install (macOS/Linux/Windows)
# Download from https://opencode.ai

opencode                    # Interactive session
opencode "task"             # One-shot
opencode --model gpt-4o     # Use any model from any provider
```

OpenCode + Go is the recommended combo, but Go works with any agent.

---

## Practical Tips

### Make the most of Go

1. **Batch complex work** — do your heavy refactoring in one session, not scattered across windows
2. **Use cheaper models for review** — if you combine Go with Zen, use Go models for planning/review, Zen models for critical builds
3. **Don't overthink model selection** — Go's automatic routing usually picks well
4. **Top up if needed** — hitting the window limit often? Add credit instead of waiting

### What Go is NOT good for

- **Image generation** — coding models only
- **Very long conversations** (200+ messages) — context windows vary by model
- **Guaranteed specific model** — if you need Claude Sonnet specifically every time, use Zen
- **Production API serving** — rate limits are for human-paced coding, not automated pipelines

---

## Real Numbers: What $10/month Gets You

```
Scenario: Solo dev, full-time AI-assisted coding

Morning session (3h):
├── Plan feature:       15 requests
├── Build feature:      40 requests
├── Test + fix:         25 requests
└── Review + commit:    10 requests
                        90 requests

Afternoon session (3h):
├── Refactor module:    35 requests
├── Add tests:          30 requests
├── Debug issues:       25 requests
└── Docs update:        10 requests
                       100 requests

Total: ~190 requests/day × 20 days = ~3,800 requests/month
                  ↑
           Well within Go limits
```

For comparison, that same workload on Claude Sonnet API would cost **$40–80/month**.

---

## FAQ

**Q: Can I use OpenCode Go without the OpenCode agent?**
Yes. The Go plan gives you an OpenAI-compatible endpoint. Use it with Pi, Claude Code, Cursor, Aider, or anything that speaks the OpenAI API format.

**Q: What happens when I hit the rate limit?**
You get a 429 response. Wait for the next 5-hour window (it resets automatically), or add top-up credit.

**Q: Can I pick which model handles my request?**
Not with Go — the platform routes automatically. If you need specific model selection, use [Zen](https://opencode.ai/zen) (pay-as-you-go, you pick the model).

**Q: Is there a free trial?**
The first month is $5 instead of $10. No free tier beyond that. Cancel anytime.

**Q: Does it work in China / behind firewalls?**
The API is hosted on standard infrastructure. Check [opencode.ai](https://opencode.ai) for region-specific availability.

---

## Bottom Line

| You want… | Use… |
|-----------|------|
| Cheapest AI coding | OpenCode Go ($5→$10/mo) |
| Specific premium model | OpenCode Zen (pay-as-you-go) |
| IDE autocomplete | GitHub Copilot |
| General chat + coding | ChatGPT Plus |
| Maximum control, no budget cap | Direct API (OpenAI/Anthropic) |

For developers who work in the terminal and want agentic AI coding without unpredictable bills, OpenCode Go is the best deal available.
