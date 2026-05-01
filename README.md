# 🧠 Minimal Agentic Workflow (Experimental)

> **A complete, opinionated guide to AI-assisted coding for $5–10/month.**
> Clone it. Customize it. Ship faster.

This is both a **methodology** and a **working template** — everything you need to set up production-grade
agentic coding workflows. It follows its own advice: every referenced file exists, every path resolves,
and the structure is ready to fork for your own project.

---

## 🌿 Branching Strategy

This repo has three branches — each a complete, standalone workflow:

| Branch       | What it includes                                             | Use when                             |
| ------------ | ------------------------------------------------------------ | ------------------------------------ |
| **`main`**   | Shared core: AGENTS.md, docs, skills, scripts                 | Base for your own project            |
| **`pi`**    | main + `.pi/` (Pi agent config, security guard, multi-agent)  | You want Pi as your coding agent     |
| **`opencode`** | main + `.opencode/` + `opencode.json` (ECC fleet, 22 commands) | You want OpenCode as your coding agent |

```
git clone https://github.com/YOU/minimal-agentic-workflow.git
cd minimal-agentic-workflow

# Choose your branch:
git checkout pi        # Pi workflow
git checkout opencode  # OpenCode workflow
git checkout main      # Start from scratch — base template
```

> **Tip**: Fork the branch you want, not main. Each branch is self-contained and ready to use.

---

## 💰 The Engine: OpenCode Go

> Applicable to the `opencode` branch. Pi and other agents work with any LLM provider.

|                | OpenCode Go                                                                           |
| -------------- | ------------------------------------------------------------------------------------- |
| **Cost**       | **$5 first month, then $10/month**                                                    |
| **Models**     | DeepSeek V4 Pro, Qwen3.6 Plus, Kimi K2.6, GLM-5.1, MiniMax M2.7, MiMo-V2.5-Pro + more |
| **Limits**     | Generous requests per 5-hour window                                                   |
| **Top-up**     | Add credit if you hit limits                                                          |
| **Works with** | OpenCode, Pi, Claude Code, Cursor, any OpenAI-compatible agent                        |
| **Cancel**     | Anytime                                                                               |

> Power users: [OpenCode Zen](https://opencode.ai/zen) — pay-as-you-go premium models (Claude, GPT-4o), $20 min balance.

---

## 🗺️ Architecture

```
┌─────────────────────────────────────────────────────────┐
│                    YOUR TERMINAL                          │
│                                                          │
│  ┌──────────┐   ┌──────────┐   ┌──────────────────┐     │
│  │ OpenCode │   │    Pi    │   │  Any LLM Client  │     │
│  │  (CLI)   │   │  (TUI)   │   │  (bring yours)   │     │
│  └────┬─────┘   └────┬─────┘   └────────┬─────────┘     │
│       │              │                  │               │
│       └──────────────┼──────────────────┘               │
│                      │                                  │
│              ┌───────▼────────┐                         │
│              │   SKILLS LAYER  │                         │
│              │  agent-skills   │                         │
│              │  mattpocock     │                         │
│              └───────┬────────┘                         │
│                      │                                  │
│         ┌────────────┼────────────┐                     │
│         │            │            │                     │
│    ┌────▼────┐ ┌─────▼────┐ ┌────▼────┐                │
│    │ SINGLE  │ │  TEAM    │ │ CHAIN   │                │
│    │ AGENT   │ │ (parallel│ │(pipeline│                │
│    │ (normal)│ │ dispatch)│ │ steps)  │                │
│    └─────────┘ └──────────┘ └─────────┘                │
│                                                          │
│              ┌──────────────────────┐                    │
│              │   OPENCODE GO ($10/mo)                    │
│              │ DeepSeek·Qwen·Kimi·GLM│                   │
│              │  + Zen pay-as-you-go  │                   │
│              └──────────────────────┘                    │
│                                                          │
│              ┌──────────────────────┐                    │
│              │ PAYMENT (RedotPay)   │                    │
│              │ Crypto → Visa card   │                    │
│              └──────────────────────┘                    │
└─────────────────────────────────────────────────────────┘
```

---

## ⚡ Quick Start

### 1. Clone the branch you want

```bash
# Clone the full repo
git clone https://github.com/YOU/minimal-agentic-workflow.git
cd minimal-agentic-workflow

# Switch to your branch:
git checkout pi        # Pi coding agent
git checkout opencode  # OpenCode coding agent
# Or start from main and add tools yourself
```

### 2. Install your coding agent

```bash
# OpenCode (recommended — flat-rate LLM access)
# Download from https://opencode.ai — free, OSS, LSP-native

# Or Pi (multi-agent support via agent-pi)
npm install -g @mariozechner/pi-coding-agent
```

### 3. Subscribe to OpenCode Go (for OpenCode branch)

1. Go to [opencode.ai/go](https://opencode.ai/go)
2. Subscribe — **$5 first month, then $10/month**
3. Point your agent at the endpoint

### 4. Install skills

```bash
# Addyosmani's production engineering skills (20 skills)
git clone https://github.com/addyosmani/agent-skills.git ~/.agent-skills

# Matt Pocock's real engineering skills
npx skills@latest add mattpocock/skills
```

### 5. Customize for your project

```bash
# Edit AGENTS.md with your stack and rules
# Fill in .context/CONTEXT.md with your domain glossary
# Add agent definitions in agents/
# Add custom skills in skills/
```

**That's it.** $5 gets you started. $10/month ongoing. Cancel anytime.

---

## 🎯 What You Get

| Component            | Tool                                                                                                        | Cost                            |
| -------------------- | ----------------------------------------------------------------------------------------------------------- | ------------------------------- |
| **Coding Agent**     | [OpenCode](https://opencode.ai) or [Pi](https://github.com/badlogic/pi-mono)                                 | **Free** (OSS)                  |
| **LLM Access**       | [OpenCode Go](https://opencode.ai/go)                                                                       | **$5 first month, then $10/mo** |
| **Agent Skills**     | [agent-skills](https://github.com/addyosmani/agent-skills) + [skills](https://github.com/mattpocock/skills) | **Free** (OSS)                  |
| **Multi-Agent**      | [agent-pi](https://github.com/ruizrica/agent-pi) (Pi) or ECC fleet (OpenCode)                               | **Free** (OSS)                  |
| **Project Template** | This repo — AGENTS.md, .context/, agents/, skills/, docs/                                                 | **Free** (OSS)                  |
| **Payment Rail**     | [RedotPay](https://www.redotpay.com)                                                                        | **Free** (card)                 |

**Total: $5 first month, $10/month ongoing.**

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
| [Multi-Agent Workflow](docs/multi-agent.md) | TEAM (parallel), CHAIN (sequential), PIPELINE (5-phase)  |
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

From [agent-skills](https://github.com/addyosmani/agent-skills) — powered by OpenCode Go models.

---

## 🧩 Skills Overview

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

- [OpenCode](https://opencode.ai) — Free, OSS coding agent (LSP-native, Go binary)
- [OpenCode Go](https://opencode.ai/go) — $10/mo plan ($5 first month)
- [OpenCode Zen](https://opencode.ai/zen) — Pay-as-you-go premium models
- [agent-skills](https://github.com/addyosmani/agent-skills) — 20 production skills
- [skills (Matt Pocock)](https://github.com/mattpocock/skills) — Engineering fundamentals
- [agent-pi](https://github.com/ruizrica/agent-pi) — Multi-agent orchestration for Pi
- [Pi](https://github.com/badlogic/pi-mono) — Terminal-native coding agent with TUI
- [RedotPay](https://www.redotpay.com) — Crypto payment card

---

## 📄 License

MIT — Build, fork, and ship.
