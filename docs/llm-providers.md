# LLM Providers — Cost Comparison

How to get the cheapest, best-quality AI for your coding workflow.

---

## The Cheapest Path

```
$10/mo GitHub Copilot  →  Covers all coding needs for most devs
         +
   $0 local models      →  Fallback for offline/private work
         +
  Free OSS tools        →  Pi, OpenCode, skills — all $0
         =
   ~$10/mo total
```

---

## Provider Comparison

| Provider | Model | Cost (input/output per 1M tokens) | Quality | Best For |
|----------|-------|-----------------------------------|---------|----------|
| **GitHub Copilot** | GPT-4o / Claude | Included in $10/mo | ★★★★ | All-around coding |
| **ChatGPT Plus** | GPT-4o | Included in $20/mo | ★★★★ | All-around coding |
| **Anthropic API** | Claude Haiku | $0.80 / $4.00 | ★★★ | Scouts, reviewers |
| **Anthropic API** | Claude Sonnet | $3.00 / $15.00 | ★★★★★ | Complex builds |
| **OpenAI API** | GPT-4o-mini | $0.15 / $0.60 | ★★★ | Scouts, reviewers |
| **OpenAI API** | GPT-4o | $2.50 / $10.00 | ★★★★★ | Complex builds |
| **Google** | Gemini Flash | $0.075 / $0.30 | ★★★ | Scouts, reviewers |
| **Google** | Gemini Pro | $1.25 / $5.00 | ★★★★ | Complex builds |
| **Ollama (local)** | Llama 3 / Qwen | $0 (your hardware) | ★★½ | Privacy, offline |
| **DeepSeek** | DeepSeek-V3 | $0.27 / $1.10 | ★★★★ | Budget builds |
| **Models.dev** | 75+ providers | Varies | Varies | Maximum choice |

---

## Strategy: Model Tiering

Use different models for different agent roles to minimize cost:

```
┌─────────────────────────────────────────┐
│              MODEL TIERING               │
│                                          │
│  SCOUT / PLANNER                         │
│  ├─ Model: Claude Haiku / GPT-4o-mini   │
│  ├─ Task: Read code, analyze, plan      │
│  └─ Cost: ~$0.15–0.80/1M tokens         │
│                                          │
│  BUILDER (YOUR BEST MODEL)               │
│  ├─ Model: Claude Sonnet / GPT-4o       │
│  ├─ Task: Write code, complex logic     │
│  └─ Cost: ~$2.50–3.00/1M tokens         │
│                                          │
│  REVIEWER                                │
│  ├─ Model: Claude Haiku / GPT-4o-mini   │
│  ├─ Task: Review diffs, check quality   │
│  └─ Cost: ~$0.15–0.80/1M tokens         │
└─────────────────────────────────────────┘
```

**This cuts multi-agent costs by ~60%** versus using Sonnet/4o for everything.

---

## Free Tiers

| Provider | Free Tier | Limitations |
|----------|-----------|-------------|
| **GitHub Copilot** | Free tier available | Limited completions |
| **Google AI Studio** | Gemini Flash free | Rate limited |
| **Groq** | Free API (Llama, Mixtral) | Rate limited, no training |
| **Together AI** | $1 free credit | One-time |
| **Ollama** | Completely free | Your hardware runs it |

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

### Scenario 1: Solo dev, one project
```
GitHub Copilot:        $10/mo
Local Ollama backup:   $0
Total:                 $10/mo
```

### Scenario 2: Heavy multi-agent user
```
Claude Haiku (scout + review):  ~$5/mo
Claude Sonnet (build):         ~$15/mo
Total API:                     ~$20/mo
(or use Copilot flat-rate:     $10/mo)
```

### Scenario 3: Team of 3 devs
```
3x GitHub Copilot:     $30/mo
1x API key for CI:     $10/mo
Total:                 $40/mo
```
