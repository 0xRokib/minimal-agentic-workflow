# 🧠 Minimal Agentic Workflow — Pi Edition

> **A complete, opinionated guide to AI-assisted coding for $5–10/month.**
> Clone it. Customize it. Ship faster.
>
> **Branch**: `pi` — Pi coding agent + agent-pi multi-agent orchestration.
> For OpenCode workflow, see the `opencode` branch. For the base template, see `main`.

This is both a **methodology** and a **working template** — everything you need to set up production-grade
agentic coding workflows with Pi. It follows its own advice: every referenced file exists,
every path resolves, and the structure is ready to fork for your own project.

---

## 💰 The Engine: OpenCode Go

> Pi works with any LLM provider. Pair with OpenCode Go for the cheapest flat-rate access.

|                | OpenCode Go                                                                           |
| -------------- | ------------------------------------------------------------------------------------- |
| **Cost**       | **$5 first month, then $10/month**                                                    |
| **Models**     | DeepSeek V4 Pro, Qwen3.6 Plus, Kimi K2.6, GLM-5.1, MiniMax M2.7, MiMo-V2.5-Pro + more |
| **Limits**     | Generous requests per 5-hour window                                                   |
| **Works with** | Pi, OpenCode, Claude Code, Cursor, any OpenAI-compatible agent                        |
| **Cancel**     | Anytime                                                                               |

> Power users: [OpenCode Zen](https://opencode.ai/zen) — pay-as-you-go premium models (Claude, GPT-4o), $20 min balance.

---

## 🗺️ Architecture

```
┌─────────────────────────────────────────────────────────┐
│                    YOUR TERMINAL                          │
│                                                          │
│  ┌────────────────────────────────────────────────────┐ │
│  │  Pi (TUI)  +  agent-pi  +  modes: normal/team/etc │ │
│  └─────────────────────────┬──────────────────────────┘ │
│                            │                             │
│              ┌─────────────▼─────────────┐               │
│              │   SKILLS LAYER             │               │
│              │  ~/.agent-skills/skills    │               │
│              │  ~/.mattpocock-skills     │               │
│              │  ./skills/                  │               │
│              └─────────────┬──────────────┘               │
│                            │                              │
│         ┌──────────────────┼──────────────────┐           │
│         │                  │                  │           │
│    ┌────▼────┐       ┌─────▼────┐       ┌────▼────┐     │
│    │ SINGLE  │       │  TEAM    │       │ CHAIN   │     │
│    │ (normal)│       │ (parallel│       │(pipeline│     │
│    │         │       │ dispatch)│       │ steps)  │     │
│    └─────────┘       └──────────┘       └─────────┘     │
│                                                          │
│              ┌──────────────────────────┐                │
│              │   OPENCODE GO ($10/mo)    │                │
│              │ DeepSeek·Qwen·Kimi·GLM   │                │
│              │  + Zen pay-as-you-go      │                │
│              └──────────────────────────┘                │
│                                                          │
│              ┌──────────────────────────┐                │
│              │ PAYMENT (RedotPay)       │                │
│              │ Crypto → Visa card         │                │
│              └──────────────────────────┘                │
└─────────────────────────────────────────────────────────┘
```

---

## ⚡ Quick Start

### 1. Clone and switch to this branch

```bash
git clone https://github.com/YOU/minimal-agentic-workflow.git
cd minimal-agentic-workflow
git checkout pi
```

### 2. Install Pi

```bash
npm install -g @mariozechner/pi-coding-agent
pi --version
```

### 3. Install agent-pi (multi-agent)

```bash
pi install git:github.com/ruizrica/agent-pi
```

### 4. Subscribe to OpenCode Go (optional, recommended)

1. Go to [opencode.ai/go](https://opencode.ai/go)
2. Subscribe — **$5 first month, then $10/month**
3. Set `OPENAI_API_BASE` and `OPENAI_API_KEY` in your environment

### 5. Install skills

```bash
# Addyosmani's production engineering skills (20 skills)
git clone https://github.com/addyosmani/agent-skills.git ~/.agent-skills

# Matt Pocock's real engineering skills
npx skills@latest add mattpocock/skills
```

### 6. Customize for your project

```bash
# Edit AGENTS.md with your stack and rules
# Edit .context/CONTEXT.md with your domain glossary
# Pi auto-loads AGENTS.md and .context/CONTEXT.md on startup
```

**That's it.** $5 gets you started. $10/month ongoing. Cancel anytime.

---

## 🎯 What You Get

| Component           | Tool                                                                                                        | Cost                            |
| ------------------ | ----------------------------------------------------------------------------------------------------------- | ------------------------------- |
| **Coding Agent**   | [Pi](https://github.com/badlogic/pi-mono)                                                                   | **Free** (OSS)                  |
| **Multi-Agent**    | [agent-pi](https://github.com/ruizrica/agent-pi) — TEAM/CHAIN/PIPELINE modes                               | **Free** (OSS)                  |
| **LLM Access**     | [OpenCode Go](https://opencode.ai/go) (recommended)                                                        | **$5 first month, then $10/mo** |
| **Agent Skills**   | [agent-skills](https://github.com/addyosmani/agent-skills) + [skills](https://github.com/mattpocock/skills) | **Free** (OSS)                  |
| **Project Template** | This repo — AGENTS.md, .context/, .pi/, agents/, skills/, docs/                                           | **Free** (OSS)                  |
| **Payment Rail**   | [RedotPay](https://www.redotpay.com)                                                                        | **Free** (card)                 |

**Total: $5 first month, $10/month ongoing.**

---

## 🔄 Pi Modes

Pi has built-in mode switching (Shift+Tab cycles modes):

| Mode       | What it does                                          |
| ---------- | ----------------------------------------------------- |
| `normal`   | Standard single-agent coding                           |
| `plan`     | Plan mode — spec before building                     |
| `spec`     | Spec mode — formal requirements capture               |
| `team`     | Parallel dispatch to specialist agents                |
| `chain`    | Sequential pipeline — output of one feeds next        |
| `pipeline` | 5-phase orchestration — full structured workflow     |

### TEAM Mode (parallel dispatch)

```bash
# Switch to TEAM mode: Shift+Tab or:
/agents-team plan-build-review

# Describe what you want:
"Add OAuth login with Google and GitHub providers"

# Primary agent dispatches:
# 1. planner → designs the approach
# 2. builder → implements the code
# 3. reviewer → checks quality
```

### CHAIN Mode (sequential pipeline)

```bash
# Switch to CHAIN mode
/chain audit-migrate-test

# Run the chain:
"Audit all deprecated API calls in src/, migrate them to v2, and verify"
```

---

## 📚 Documentation

### Getting Started

| Document                               | What it covers                                                 |
| -------------------------------------- | -------------------------------------------------------------- |
| [LLM Providers](docs/llm-providers.md) | Provider comparison, cost estimates, model tiering strategy    |
| [RedotPay Setup](docs/redotpay.md)     | Pay for AI APIs with crypto — virtual Visa cards, zero FX fees |

### Workflows

| Document                                    | What it covers                                             |
| ------------------------------------------ | ---------------------------------------------------------- |
| [Single-Agent Workflow](docs/single-agent.md) | Day-to-day: think → plan → build → verify → commit      |
| [Multi-Agent Workflow](docs/multi-agent.md) | Pi TEAM/CHAIN/PIPELINE modes, agent-pi setup             |
| [Skills System](docs/skills.md)             | How skills work, composing your own, which ones to use    |

### Operations

| Document                                  | What it covers                                               |
| ----------------------------------------- | ------------------------------------------------------------ |
| [Security Guide](docs/security.md)        | Prompt injection defense, secrets management, tool hardening   |
| [Best Practices](docs/best-practices.md)   | Principles for building and running agent workflows          |

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

---

## 🧩 Skills Overview

Skills are loaded from three paths configured in `.pi/settings.yaml`:
- `~/.agent-skills/skills` — Addyosmani's 20 production skills
- `~/.mattpocock-skills` — Engineering fundamentals
- `./skills/` — Project-local skills

### Engineering Fundamentals (mattpocock/skills)

| Skill                             | What it does                                                          |
| --------------------------------- | --------------------------------------------------------------------- |
| `/grill-me`                       | Align before coding — asks clarifying questions, saves hours of rework |
| `/grill-with-docs`                | Shared language + ADRs — prevents verbose, misaligned code            |
| `/tdd`                            | Red-green-refactor — tests first, proof not decoration                  |
| `/diagnose`                       | Structured debugging — systematic over shotgun                         |
| `/improve-codebase-architecture`  | Weekly cleanup — fights entropy                                       |

### Production Engineering (addyosmani/agent-skills)

| Skill     | What it does                                              |
| --------- | --------------------------------------------------------- |
| `/spec`   | Spec-driven development — define before you build         |
| `/plan`   | Atomic task breakdown — small, verifiable, ordered          |
| `/build`  | Incremental implementation — thin vertical slices         |
| `/test`   | Browser testing + TDD — 80% unit, 15% integration, 5% e2e |
| `/review` | Five-axis code review — quality gate before merge          |
| `/ship`   | Safe deployment — feature flags, rollback-ready            |

### Design System (design-md)

| Skill     | What it does                                              |
| --------- | --------------------------------------------------------- |
| `/design` | Apply DESIGN.md tokens — pixel-perfect UI from real brands |

---

## 🛡️ Security Guard

Pi includes a security guard (`.pi/security.yaml`) that runs pre-tool-hook:

- **Blocked patterns**: `rm -rf`, `sudo`, `curl | sh`, `env dump`
- **Protected paths**: `~/.ssh/`, `~/.aws/`, `.env`, `*.secret`
- **Network restrictions**: External URLs require confirmation

---

## 💵 Why This Is the Cheapest Path

| Alternative       | Monthly Cost  | What You Get                                     |
| ----------------- | ------------- | ------------------------------------------------ |
| **OpenCode Go**   | **$5→$10/mo** | 8+ coding models, any agent, predictable billing |
| GitHub Copilot    | $10/mo        | One model, IDE-only                              |
| ChatGPT Plus      | $20/mo        | General-purpose, no API access                   |
| Claude Pro        | $20/mo        | One model, rate limited, no API access           |
| API pay-as-you-go | $20–100+/mo   | Unpredictable — a heavy day can cost $30         |

---

## 📖 Resources

- [Pi](https://github.com/badlogic/pi-mono) — Terminal-native coding agent with TUI
- [agent-pi](https://github.com/ruizrica/agent-pi) — Multi-agent orchestration for Pi
- [OpenCode Go](https://opencode.ai/go) — $10/mo flat-rate LLM access
- [OpenCode Zen](https://opencode.ai/zen) — Pay-as-you-go premium models
- [agent-skills](https://github.com/addyosmani/agent-skills) — 20 production skills
- [skills (Matt Pocock)](https://github.com/mattpocock/skills) — Engineering fundamentals
- [RedotPay](https://www.redotpay.com) — Crypto payment card

---

## 📄 License

MIT — Build, fork, and ship.
