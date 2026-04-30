# 🧠 Minimal Agentic Workflow

> Build a production-grade AI coding workflow at the lowest possible cost.

A practical guide to setting up single-agent and multi-agent coding workflows using open-source tools, reusable skills, and cheap LLM access — all from your terminal.

---

## 🎯 What You Get

| Component | Tool | Cost |
|-----------|------|------|
| **Coding Agent** | [Pi](https://github.com/badlogic/pi-mono) or [OpenCode](https://opencode.ai) | **Free** (OSS) |
| **LLM Access** | GitHub Copilot / ChatGPT Plus / local models | **$0–20/mo** |
| **Agent Skills** | [agent-skills](https://github.com/addyosmani/agent-skills) + [skills](https://github.com/mattpocock/skills) | **Free** (OSS) |
| **Multi-Agent** | [agent-pi](https://github.com/ruizrica/agent-pi) | **Free** (OSS) |
| **Payment Rail** | [RedotPay](https://www.redotpay.com) (crypto → fiat card) | **Free** (card) |

---

## 🗺️ Architecture

```
┌──────────────────────────────────────────────────────┐
│                   YOUR TERMINAL                       │
│                                                       │
│  ┌──────────┐   ┌──────────┐   ┌──────────────────┐  │
│  │   Pi     │   │ OpenCode │   │  Any LLM Client  │  │
│  │ (TUI)    │   │ (CLI)    │   │  (bring yours)   │  │
│  └────┬─────┘   └────┬─────┘   └────────┬─────────┘  │
│       │              │                  │            │
│       └──────────────┼──────────────────┘            │
│                      │                               │
│              ┌───────▼────────┐                      │
│              │   SKILLS LAYER  │                      │
│              │  agent-skills   │                      │
│              │  mattpocock     │                      │
│              │  agent-pi       │                      │
│              └───────┬────────┘                      │
│                      │                               │
│         ┌────────────┼────────────┐                  │
│         │            │            │                  │
│    ┌────▼────┐ ┌─────▼────┐ ┌────▼────┐             │
│    │ SINGLE  │ │  TEAM    │ │ CHAIN   │             │
│    │ AGENT   │ │ (parallel│ │(pipeline│             │
│    │ (normal)│ │ dispatch)│ │ steps)  │             │
│    └─────────┘ └──────────┘ └─────────┘             │
│                                                       │
│              ┌──────────────────┐                     │
│              │   LLM PROVIDERS  │                     │
│              │ Copilot·GPT·Claude│                    │
│              │ Gemini·Local·Ollama│                   │
│              └──────────────────┘                     │
│                                                       │
│              ┌──────────────────┐                     │
│              │ PAYMENT (RedotPay)│                    │
│              │ Crypto→Fiat card │                     │
│              └──────────────────┘                     │
└──────────────────────────────────────────────────────┘
```

---

## ⚡ Quick Start (5 minutes)

### 1. Install a Coding Agent

**Option A: Pi (recommended for multi-agent)**

See the [Pi install guide](https://github.com/badlogic/pi-mono/tree/main/packages/coding-agent) for your platform:
- macOS: `npm install -g @mariozechner/pi-coding-agent`
- Linux: See the official install script at [pi.dev](https://pi.dev)
- Any: Clone and build from source

**Option B: OpenCode**

Download from [opencode.ai](https://opencode.ai) — available as terminal CLI, desktop app, and VS Code extension. Free and open source.

### 2. Install Skills

```bash
# Addyosmani's production engineering skills
git clone https://github.com/addyosmani/agent-skills.git ~/.agent-skills

# Matt Pocock's real engineering skills
npx skills@latest add mattpocock/skills

# Agent-pi multi-agent extensions (for Pi users)
pi install git:github.com/ruizrica/agent-pi
```

### 3. Configure Your LLM

Pi and OpenCode auto-detect your GitHub Copilot, ChatGPT Plus, or any API key:

```bash
# For Pi — set API keys as environment variables
export ANTHROPIC_API_KEY="sk-ant-..."   # Claude
export OPENAI_API_KEY="sk-..."          # GPT
export GOOGLE_API_KEY="..."             # Gemini

# Or log in with GitHub Copilot (included in $10/mo subscription)
```

### 4. Start Coding

```bash
pi          # Launch Pi TUI
opencode    # Launch OpenCode CLI
```

---

## 📚 What's Inside

| Document | What it covers |
|----------|---------------|
| [Single-Agent Workflow](docs/single-agent.md) | The day-to-day: plan → build → test → review loop |
| [Multi-Agent Workflow](docs/multi-agent.md) | TEAM, CHAIN, and PIPELINE orchestration patterns |
| [Skills System](docs/skills.md) | How skills work, which ones to use, composing your own |
| [LLM Providers](docs/llm-providers.md) | Cost comparison, free tiers, local models |
| [Security Guide](docs/security.md) | Prompt injection, secrets, tool hardening |
| [Best Practices](docs/best-practices.md) | Keep it minimal, composable, and maintainable |
| [RedotPay Setup](docs/redotpay.md) | Pay for AI APIs using crypto, lowest fees |

---

## 🔄 The Development Loop

```
  DEFINE          PLAN           BUILD          VERIFY         REVIEW          SHIP
 ┌──────┐      ┌──────┐      ┌──────┐      ┌──────┐      ┌──────┐      ┌──────┐
 │ Idea │ ───▶ │ Spec │ ───▶ │ Code │ ───▶ │ Test │ ───▶ │  QA  │ ───▶ │  Go  │
 │Refine│      │  PRD │      │ Impl │      │Debug │      │ Gate │      │ Live │
 └──────┘      └──────┘      └──────┘      └──────┘      └──────┘      └──────┘
  /spec          /plan          /build        /test         /review       /ship
```

From [agent-skills](https://github.com/addyosmani/agent-skills) — the full production lifecycle as repeatable slash commands.

---

## 🧩 Skill Categories

### Engineering (from mattpocock/skills)
- `/grill-me` — Align with the agent before coding
- `/grill-with-docs` — Build shared language + ADRs
- `/tdd` — Red-green-refactor loop
- `/diagnose` — Structured debugging
- `/to-prd` — Module-aware spec generation
- `/improve-codebase-architecture` — Fight entropy

### Production (from addyosmani/agent-skills)
- `/spec` — Spec-driven development
- `/plan` — Atomic task breakdown
- `/build` — Incremental implementation
- `/test` — Browser testing + TDD
- `/review` — Five-axis code review
- `/ship` — Safe deployment

---

## 🤖 Operational Modes (agent-pi)

| Mode | Use When |
|------|----------|
| **NORMAL** | Quick questions, single-file edits |
| **PLAN** | Multi-step changes needing a plan + approval |
| **SPEC** | New features needing requirements + spec |
| **TEAM** | Parallel dispatch to specialist agents |
| **CHAIN** | Sequential pipeline (audit → migrate → test) |
| **PIPELINE** | Full phased orchestration (gather → plan → execute → review) |

---

## 🔒 Security at Every Layer

```
┌──────────────────────────────────────┐
│        PRE-TOOL-HOOK GUARD            │
│  Blocks: rm -rf, sudo, secrets dump  │
│  Detects: prompt injection in files   │
│  Prevents: data exfiltration         │
└──────────────────────────────────────┘
```

See [Security Guide](docs/security.md) for the full protection model.

---

## 💰 Keeping It Cheap

| Strategy | Savings |
|----------|---------|
| GitHub Copilot (included in $10/mo) | Covers most coding needs |
| Local models via Ollama | $0, runs on your machine |
| RedotPay for API payments | Avoid FX fees, use crypto |
| Pi + OpenCode are OSS | No license costs |
| Skills are free and reusable | No consultant needed |

---

## 📖 Resources

- [Pi Monorepo](https://github.com/badlogic/pi-mono) — The coding agent
- [OpenCode](https://opencode.ai) — Alternative coding agent
- [agent-skills](https://github.com/addyosmani/agent-skills) — 20 production skills
- [skills (Matt Pocock)](https://github.com/mattpocock/skills) — Engineering fundamentals
- [agent-pi](https://github.com/ruizrica/agent-pi) — Multi-agent orchestration
- [RedotPay](https://www.redotpay.com) — Crypto payment card

---

## 📄 License

MIT — Build, fork, and ship.
