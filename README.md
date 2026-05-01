# 🧠 Minimal Agentic Workflow — OpenCode Edition

> **A complete, opinionated guide to AI-assisted coding for $5–10/month.**
> Clone it. Customize it. Ship faster.
>
> **Branch**: `opencode` — OpenCode + ECC fleet + 22 slash commands.
> For Pi workflow, see the `pi` branch. For the base template, see `main`.

This is both a **methodology** and a **working template** — everything you need to set up production-grade
agentic coding workflows with OpenCode. It follows its own advice: every referenced file exists,
every path resolves, and the structure is ready to fork for your own project.

---

## 💰 The Engine: OpenCode Go

|                | OpenCode Go                                                                           |
| -------------- | ------------------------------------------------------------------------------------- |
| **Cost**       | **$5 first month, then $10/month**                                                    |
| **Models**     | DeepSeek V4 Pro, Qwen3.6 Plus, Kimi K2.6, GLM-5.1, MiniMax M2.7, MiMo-V2.5-Pro + more |
| **Limits**     | Generous requests per 5-hour window                                                   |
| **Top-up**     | Add credit if you hit limits                                                          |
| **Cancel**     | Anytime                                                                               |

> Power users: [OpenCode Zen](https://opencode.ai/zen) — pay-as-you-go premium models (Claude, GPT-4o), $20 min balance.

---

## 🗺️ Architecture

```
┌─────────────────────────────────────────────────────────┐
│                    YOUR TERMINAL                          │
│                                                          │
│  ┌────────────────────────────────────────────────────┐ │
│  │  OpenCode (CLI)  +  22 /commands  +  16+ agents    │ │
│  └────────────────────────┬───────────────────────────┘ │
│                           │                              │
│              ┌────────────▼───────────┐                │
│              │   SKILLS LAYER          │                │
│              │  ~/.agent-skills/skills  │                │
│              │  mattpocock/skills      │                │
│              │  .opencode/prompts/agents│                │
│              └────────────┬─────────────┘                │
│                           │                              │
│         ┌─────────────────┼─────────────────┐            │
│         │                 │                 │            │
│    ┌────▼────┐      ┌─────▼────┐      ┌────▼────┐     │
│    │ SINGLE  │      │  TEAM    │      │ CHAIN   │     │
│    │ AGENT   │      │ (parallel│      │(pipeline│     │
│    │ (normal)│      │ dispatch)│      │ steps)  │     │
│    └─────────┘      └──────────┘      └─────────┘     │
│                                                          │
│              ┌──────────────────────────┐                │
│              │   OPENCODE GO ($10/mo)    │                │
│              │ DeepSeek·Qwen·Kimi·GLM   │                │
│              │  + Zen pay-as-you-go      │                │
│              └──────────────────────────┘                │
│                                                          │
│              ┌──────────────────────────┐                │
│              │ PAYMENT (RedotPay)        │                │
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
git checkout opencode
```

### 2. Download OpenCode

Download from [opencode.ai](https://opencode.ai) — free, OSS, LSP-native.
Available as: terminal CLI, desktop app, and IDE extension.

### 3. Subscribe to OpenCode Go

1. Go to [opencode.ai/go](https://opencode.ai/go)
2. Subscribe — **$5 first month, then $10/month**
3. Point OpenCode at the endpoint

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
# OpenCode auto-loads AGENTS.md and .context/CONTEXT.md on startup
```

**That's it.** $5 gets you started. $10/month ongoing. Cancel anytime.

---

## 🎯 What You Get

| Component           | Tool                                                                                                        | Cost                            |
| ------------------ | ----------------------------------------------------------------------------------------------------------- | ------------------------------- |
| **Coding Agent**   | [OpenCode](https://opencode.ai)                                                                             | **Free** (OSS)                  |
| **LLM Access**     | [OpenCode Go](https://opencode.ai/go)                                                                       | **$5 first month, then $10/mo** |
| **ECC Fleet**      | 16 specialist agents (planner, code-reviewer, security-reviewer, tdd-guide...)                            | **Included in OpenCode Go**      |
| **Commands**       | 22 slash commands (/plan, /code-review, /security, /tdd, /verify...)                                     | **Free**                        |
| **Agent Skills**   | [agent-skills](https://github.com/addyosmani/agent-skills) + [skills](https://github.com/mattpocock/skills) | **Free** (OSS)                  |
| **Project Template** | This repo — AGENTS.md, .context/, .opencode/, agents/, skills/, docs/                                     | **Free** (OSS)                  |
| **Payment Rail**   | [RedotPay](https://www.redotpay.com)                                                                        | **Free** (card)                 |

**Total: $5 first month, $10/month ongoing.**

---

## 🤖 ECC Agent Fleet

All agents run as `subtask: true` — spin up, complete, return. No manual model switching.

| Agent                 | Model (OpenCode Go) | Role                                      |
| --------------------- | ------------------- | ----------------------------------------- |
| `build`               | DeepSeek V4 Pro     | Primary — writes code, implements features |
| `planner`             | Qwen3.6 Plus        | Plans implementation, breaks into tasks    |
| `architect`           | Qwen3.6 Plus        | System design, architectural decisions      |
| `code-reviewer`        | Kimi K2.6           | Audits code quality, finds bugs           |
| `security-reviewer`    | MiniMax M2.7        | Deep vulnerability scan                    |
| `tdd-guide`            | DeepSeek V4 Pro     | Enforces test-first, 80%+ coverage         |
| `build-error-resolver` | Kimi K2.6           | Fixes build/type errors, minimal diffs    |
| `refactor-cleaner`     | DeepSeek V4 Flash   | Lightweight dead code cleanup             |
| `refactor-heavy`       | DeepSeek V4 Pro     | Heavy structural refactoring              |
| `doc-updater`          | Qwen3.6 Plus        | Documentation drafting, changelogs        |
| `doc-polisher`         | Kimi K2.5           | Final docs polish, clarity pass           |

---

## 📚 Documentation

### Getting Started

| Document                                  | What it covers                                                 |
| ----------------------------------------- | -------------------------------------------------------------- |
| [OpenCode Go Plan](docs/opencode-go.md)  | Plan details, model fleet, rate limits, Zen comparison, setup  |
| [LLM Providers](docs/llm-providers.md)   | Provider comparison, cost estimates, model tiering strategy    |
| [RedotPay Setup](docs/redotpay.md)       | Pay for AI APIs with crypto — virtual Visa cards, zero FX fees |

### Workflows

| Document                                    | What it covers                                             |
| ------------------------------------------ | ---------------------------------------------------------- |
| [Single-Agent Workflow](docs/single-agent.md) | Day-to-day: think → plan → build → verify → commit      |
| [Multi-Agent Workflow](docs/multi-agent.md) | ECC fleet, TEAM/CHAIN/PIPELINE, full pipeline, commands   |
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

## ⚡ Slash Commands

| Command         | Agent            | Model           | What it does                                    |
| --------------- | ---------------- | --------------- | ---------------------------------------------- |
| `/plan`         | planner          | Qwen3.6 Plus    | Implementation plan with risk assessment        |
| `/code-review`  | code-reviewer    | Kimi K2.6       | Quality and security review                    |
| `/security`     | security-reviewer| MiniMax M2.7    | Vulnerability and injection scan                |
| `/verify`       | build            | DeepSeek V4 Pro | Confirm links and paths resolve                  |
| `/update-docs`  | doc-updater      | Qwen3.6 Plus    | Sync docs with current state                    |
| `/learn`        | build            | DeepSeek V4 Pro | Extract patterns from session                  |
| `/checkpoint`   | build            | DeepSeek V4 Pro | Save progress snapshot                          |
| `/tdd`          | tdd-guide        | DeepSeek V4 Pro | Test-first development                          |
| `/refactor-clean` | refactor-cleaner | DeepSeek V4 Flash | Lightweight cleanup                          |
| `/refactor-heavy` | refactor-heavy   | DeepSeek V4 Pro | Structural refactoring                          |
| `/e2e`          | e2e-runner       | Kimi K2.6       | End-to-end test execution                      |
| `/eval`         | build            | DeepSeek V4 Pro | Run evaluation harness                          |
| `/design`       | build            | DeepSeek V4 Pro | Apply DESIGN.md tokens for matching UI          |

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
- [Everything Claude Code](https://github.com/affaan-m/everything-claude-code) — ECC fleet for OpenCode
- [agent-skills](https://github.com/addyosmani/agent-skills) — 20 production skills
- [skills (Matt Pocock)](https://github.com/mattpocock/skills) — Engineering fundamentals
- [RedotPay](https://www.redotpay.com) — Crypto payment card

---

## 📄 License

MIT — Build, fork, and ship.
