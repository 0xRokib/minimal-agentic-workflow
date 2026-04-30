# LLM Providers — Cost Comparison

How to get the cheapest, best-quality AI for your coding workflow.

---

## The Cheapest Path

```
$5 first month OpenCode Go  →  8+ coding models, any agent, predictable billing
            +
   $0 local models           →  Fallback for offline/private work
            +
  Free OSS tools             →  Pi, OpenCode, skills — all $0
            =
   ~$5 first month, $10/mo ongoing
```

> Power users: [OpenCode Zen](https://opencode.ai/zen) — pay-as-you-go premium models
> (Claude, GPT-4o, etc.), $20 minimum balance.

---

## Provider Comparison

| Provider           | Model                                                                          | Cost                           | Quality | Best For                   |
| ------------------ | ------------------------------------------------------------------------------ | ------------------------------ | ------- | -------------------------- |
| **OpenCode Go** ⭐ | DeepSeek V4 Pro, Qwen3.6 Plus, Kimi K2.6, GLM-5.1, MiniMax M2.7, MiMo-V2.5-Pro | **$5 first mo, $10/mo flat**   | ★★★★★   | Everything — best value    |
| **OpenCode Zen**   | Claude Sonnet, GPT-4o + more                                                   | Pay-as-you-go, $20 min balance | ★★★★★   | Premium models when needed |
| **GitHub Copilot** | GPT-4o / Claude                                                                | $10/mo                         | ★★★★    | IDE-only, one model        |
| **ChatGPT Plus**   | GPT-4o                                                                         | $20/mo                         | ★★★★    | General purpose, no API    |
| **Anthropic API**  | Claude Haiku                                                                   | $0.80 / $4.00 per 1M tokens    | ★★★     | Scouts, reviewers          |
| **Anthropic API**  | Claude Sonnet                                                                  | $3.00 / $15.00 per 1M tokens   | ★★★★★   | Complex builds             |
| **OpenAI API**     | GPT-4o-mini                                                                    | $0.15 / $0.60 per 1M tokens    | ★★★     | Scouts, reviewers          |
| **OpenAI API**     | GPT-4o                                                                         | $2.50 / $10.00 per 1M tokens   | ★★★★★   | Complex builds             |
| **Google**         | Gemini Flash                                                                   | $0.075 / $0.30 per 1M tokens   | ★★★     | Scouts, reviewers          |
| **Google**         | Gemini Pro                                                                     | $1.25 / $5.00 per 1M tokens    | ★★★★    | Complex builds             |
| **Ollama (local)** | Llama 3 / Qwen                                                                 | $0 (your hardware)             | ★★½     | Privacy, offline           |
| **DeepSeek**       | DeepSeek-V3                                                                    | $0.27 / $1.10 per 1M tokens    | ★★★★    | Budget API builds          |

---

## Strategy: Model Tiering

With **OpenCode Go**, all included models are available at the flat rate — no per-token surprises. When you need raw API access, tier by task:

```
┌──────────────────────────────────────────────────┐
│                  MODEL TIERING                    │
│                                                   │
│  SCOUT / PLANNER                                  │
│  ├─ OpenCode Go: Qwen3.6 Plus / MiMo-V2.5-Pro   │
│  ├─ API alt: Claude Haiku / GPT-4o-mini          │
│  ├─ Task: Read code, analyze, plan               │
│  └─ Cost: included in $10/mo OR $0.15–0.80/1M   │
│                                                   │
│  BUILDER (YOUR BEST MODEL)                        │
│  ├─ OpenCode Go: DeepSeek V4 Pro / Kimi K2.6    │
│  ├─ Zen alt: Claude Sonnet / GPT-4o             │
│  ├─ Task: Write code, complex logic              │
│  └─ Cost: included in $10/mo OR $2.50–3.00/1M   │
│                                                   │
│  REVIEWER                                         │
│  ├─ OpenCode Go: GLM-5.1 / MiniMax M2.7         │
│  ├─ API alt: Claude Haiku / GPT-4o-mini          │
│  ├─ Task: Review diffs, check quality            │
│  └─ Cost: included in $10/mo OR $0.15–0.80/1M   │
└──────────────────────────────────────────────────┘
```

**OpenCode Go eliminates tiering cost math** — use any model in the fleet for any role at the same flat rate.

---

## Free Tiers

| Provider             | Free Tier                 | Limitations                                |
| -------------------- | ------------------------- | ------------------------------------------ |
| **OpenCode**         | Free OSS agent            | No LLM included — needs API key or Go plan |
| **GitHub Copilot**   | Free tier available       | Limited completions                        |
| **Google AI Studio** | Gemini Flash free         | Rate limited                               |
| **Groq**             | Free API (Llama, Mixtral) | Rate limited, no training                  |
| **Together AI**      | $1 free credit            | One-time                                   |
| **Ollama**           | Completely free           | Your hardware runs it                      |

---

## Local Models (Ollama)

Run models on your own machine — zero cost, full privacy:

```bash
# Install Ollama
# See: https://ollama.com

# Pull coding-capable models
ollama pull qwen2.5-coder:7b     # ~4GB, good for small tasks
ollama pull llama3.1:8b          # ~5GB, general purpose
ollama pull deepseek-coder-v2    # ~8GB, best local coding

# Configure Pi/OpenCode to use it
export OPENAI_BASE_URL="http://localhost:11434/v1"
export OPENAI_API_KEY="ollama"
```

**Limitations**: Slower, less capable than cloud models. Best for:

- Offline work
- Privacy-sensitive code
- Simple refactors and tests
- Learning/practice

---

## Paying with Crypto (RedotPay)

If you need API access and want to pay with crypto:

1. Get a [RedotPay](https://www.redotpay.com) virtual card (free)
2. Load it with USDC/USDT
3. Use it to pay for API subscriptions (OpenAI, Anthropic, etc.)

Benefits:

- No bank FX fees on international payments
- Use crypto earnings directly
- Virtual cards are free
- Available in 100+ countries

---

## Real Monthly Cost Estimates

### Scenario 1: Solo dev, one project (recommended)

```
OpenCode Go (month 1):  $5
OpenCode Go (ongoing):  $10/mo
Local Ollama backup:    $0
OpenCode agent:         $0 (free OSS)
Total:                  $5 first month, $10/mo ongoing
```

### Scenario 2: Heavy multi-agent user

```
OpenCode Go flat rate:      $10/mo
+ Zen credits for Claude:   ~$10/mo (pay-as-you-go)
Total:                      ~$20/mo cap
```

### Scenario 3: Team of 3 devs

```
3x OpenCode Go:        $30/mo
1x Zen credits for CI: ~$10/mo
Total:                 ~$40/mo

vs. raw API alternative:
3x API keys (variable): $60–150+/mo (unpredictable)
```

### Scenario 4: Raw API pay-as-you-go

```
Claude Haiku (scout + review):  ~$5/mo
Claude Sonnet (build):         ~$15/mo
Total API:                     ~$20/mo
(vs. OpenCode Go flat:          $10/mo — better deal)
```
