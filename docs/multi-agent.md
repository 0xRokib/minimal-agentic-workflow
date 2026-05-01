# Multi-Agent Workflow

> **OpenCode branch** — multi-agent orchestration via [everything-claude-code](https://github.com/affaan-m/everything-claude-code) (ECC) fleet.
> For conceptual patterns, see the `main` branch.

When one agent isn't enough — dispatch teams of specialists, chain sequential steps, or run full orchestrated pipelines.

> **Requires**: [OpenCode](https://opencode.ai) + [OpenCode Go subscription](docs/opencode-go.md)

---

## Three Orchestration Patterns

| Pattern      | Model              | Best For                                            |
| ------------ | ------------------ | --------------------------------------------------- |
| **TEAM**     | Parallel dispatch  | Independent workstreams that can run simultaneously   |
| **CHAIN**    | Sequential pipeline | Steps where output of one feeds into the next       |
| **PIPELINE** | 5-phase hybrid     | Complex projects needing structure                  |

---

## TEAM — Parallel Dispatch

One primary agent delegates tasks to specialist agents running in parallel.

```
              ┌──────────┐
              │  PRIMARY │  ← You talk to this one
              │  (orchestrator)
              └─────┬────┘
         ┌──────────┼──────────┐
         │          │          │
    ┌────▼───┐ ┌───▼────┐ ┌───▼───┐
    │PLANNER │ │ BUILDER│ │REVIEWER│
    │ designs│ │ writes │ │ checks │
    │  plan  │ │  code  │ │quality │
    └────────┘ └────────┘ └────────┘
```

### When to use TEAM

- A task naturally splits into 3+ independent pieces
- You have specialist agents (planner, builder, reviewer) available
- Parallel execution saves wall-clock time

### Cost consideration

TEAM mode is the most efficient multi-agent pattern — agents run in parallel, reducing total wall-clock time. Use smaller/cheaper models for scouts and reviewers, reserve the best model for builders.

---

## CHAIN — Sequential Pipeline

Each step receives the output of the previous step via `$INPUT`.

```
┌──────────┐    ┌──────────┐    ┌──────────┐
│  AUDIT   │───▶│ MIGRATE  │───▶│   TEST   │
│ (scout)  │    │ (builder)│    │ (tester) │
└──────────┘    └──────────┘    └──────────┘
   $INPUT →        $INPUT →        $INPUT →
```

### When to use CHAIN

- Steps have a strict data dependency (output of A is input to B)
- Audit → fix → verify workflows
- Each agent's output must be reviewed by the next agent

### Cost consideration

CHAIN uses the most tokens since each step sees the full history. Keep chains short (3–5 steps max) and use `$INPUT` to pass only what the next agent needs.

---

## PIPELINE — Full Orchestration

Five phases that combine TEAM and CHAIN patterns:

```
UNDERSTAND ──▶ GATHER ──▶ PLAN ──▶ EXECUTE ──▶ REVIEW
(1 agent)      (parallel) (1 agent)  (parallel)   (1 agent)
```

| Phase          | Agents | What happens                                |
| -------------- | ------ | ------------------------------------------ |
| **UNDERSTAND** | 1      | Clarify the task, ask questions            |
| **GATHER**     | 2–3    | Scout codebase, gather context in parallel  |
| **PLAN**       | 1      | Produce a detailed implementation plan       |
| **EXECUTE**    | 2–4    | Build in parallel per plan                  |
| **REVIEW**     | 1      | Quality gate, summary report               |

### When to use PIPELINE

- Greenfield projects requiring full structure
- Complex features with many interdependent components
- When you need a structured quality gate at each phase

---

## ECC Agent Fleet

Everything Claude Code (ECC) adds native multi-agent orchestration to OpenCode — no manual model switching.

### Fleet Overview

| Agent                  | Model (OpenCode Go) | Role                                       |
| --------------------- | ------------------- | ------------------------------------------ |
| `build`               | DeepSeek V4 Pro     | Primary — writes code, implements features |
| `planner`             | Qwen3.6 Plus        | Plans implementation, breaks into tasks    |
| `architect`           | Qwen3.6 Plus        | System design, architectural decisions     |
| `code-reviewer`        | Kimi K2.6           | Audits code quality, finds bugs           |
| `security-reviewer`    | MiniMax M2.7        | Deep vulnerability scan                    |
| `tdd-guide`            | DeepSeek V4 Pro     | Enforces test-first, 80%+ coverage          |
| `build-error-resolver` | Kimi K2.6           | Fixes build/type errors, minimal diffs    |
| `refactor-cleaner`     | DeepSeek V4 Flash   | Lightweight dead code cleanup             |
| `refactor-heavy`       | DeepSeek V4 Pro     | Heavy structural refactoring              |
| `doc-updater`          | Qwen3.6 Plus        | Documentation drafting, changelogs        |
| `doc-polisher`         | Kimi K2.5           | Final docs polish, clarity pass           |

### How ECC Routes Models Automatically

Each `/command` maps to an agent, which maps to a model:

```
/plan           → planner agent      → Qwen3.6 Plus
/tdd            → tdd-guide agent    → DeepSeek V4 Pro
/code-review    → code-reviewer      → Kimi K2.6
/security       → security-reviewer  → MiniMax M2.7
/refactor-clean → refactor-cleaner   → DeepSeek V4 Flash
/refactor-heavy → refactor-heavy    → DeepSeek V4 Pro
/polish-docs    → doc-polisher       → Kimi K2.5
```

All run as `subtask: true` — they spin up, complete, and return. No manual model switching.

---

## The Full ECC Pipeline

Recommended end-to-end workflow for any non-trivial feature:

```
/plan <feature>
Qwen3.6 Plus (planner / architect)
— produces implementation plan, ADR, task breakdown
        ↓
/tdd
DeepSeek V4 Pro (tdd-guide)
— writes tests first, implements to pass them (80%+ coverage)
        ↓
/code-review
Kimi K2.6 (code-reviewer)
— audits quality, finds bugs, checks maintainability
        ↓
/security
MiniMax M2.7 (security-reviewer)
— deep vulnerability scan, auth, injection, data exposure
        ↓
/build-fix  (if issues found)
DeepSeek V4 Pro (build-error-resolver for critical)
— fixes flagged issues with minimal diffs
        ↓
/refactor-clean  or  /refactor-heavy
DeepSeek V4 Flash (light) / DeepSeek V4 Pro (structural)
— removes dead code, consolidates duplication
        ↓
/polish-docs
Kimi K2.5 (doc-polisher)
— final documentation pass, clarity and consistency
        ↓
git commit
```

**When to use the full pipeline**: new features, PRs, anything touching auth/payments/data.
**When to skip steps**: small fixes → just `/build-fix` + `/code-review`.

### Lightweight Loop (daily use)

```
/plan → build (DeepSeek V4 Pro) → /code-review → git commit
```

---

## Commands Available

| Command        | What it does                            | Model           |
| -------------- | --------------------------------------- | --------------- |
| `/plan`        | Implementation plan with risk assessment| Qwen3.6 Plus     |
| `/code-review` | Quality and security review             | Kimi K2.6        |
| `/security`    | Vulnerability and injection scan        | MiniMax M2.7     |
| `/verify`      | Confirm links and paths resolve         | build            |
| `/update-docs` | Sync docs with current state           | Qwen3.6 Plus     |
| `/learn`       | Extract patterns from session           | build            |
| `/checkpoint`  | Save progress snapshot                  | build            |
| `/tdd`         | Test-first development                  | DeepSeek V4 Pro  |
| `/refactor-clean` | Lightweight cleanup                  | DeepSeek V4 Flash|
| `/refactor-heavy` | Structural refactoring              | DeepSeek V4 Pro  |

---

## Cost: All Included

With OpenCode Go ($10/mo flat), all agents in the fleet run at zero extra cost —
no per-token billing switching between Qwen3.6 Plus, Kimi K2.6/K2.5, MiniMax M2.7, or DeepSeek V4 Pro/Flash.

---

## When to Go Multi-Agent

| Situation                           | Pattern  | Why                              |
| ----------------------------------- | -------- | -------------------------------- |
| Large feature with independent parts | TEAM     | Parallelize implementation       |
| Audit → fix → verify workflows      | CHAIN    | Sequential dependency            |
| Greenfield project                  | PIPELINE | Full structure needed            |
| Quick bug fix                       | SINGLE   | Overhead not worth it           |
| Code review                         | SINGLE   | One agent is enough             |

**Rule of thumb**: Start single-agent. Go multi-agent when:

1. A task naturally splits into 3+ independent pieces, OR
2. You need structured quality gates (audit → check → approve), OR
3. You're building something from scratch and want the full process.
