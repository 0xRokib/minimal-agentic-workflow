# Multi-Agent Workflow

When one agent isn't enough — dispatch teams of specialists, chain sequential steps, or run full orchestrated pipelines.

> **Requires**: [agent-pi](https://github.com/ruizrica/agent-pi) installed on top of [Pi](https://github.com/badlogic/pi-mono)

---

## Three Orchestration Patterns

| Pattern      | Model               | Best For                                            |
| ------------ | ------------------- | --------------------------------------------------- |
| **TEAM**     | Parallel dispatch   | Independent workstreams that can run simultaneously |
| **CHAIN**    | Sequential pipeline | Steps where output of one feeds into the next       |
| **PIPELINE** | 5-phase hybrid      | Complex projects needing structure                  |

---

## TEAM — Parallel Dispatch

One primary agent delegates tasks to specialist agents running in parallel.

```
              ┌──────────┐
              │  PRIMARY  │  ← You talk to this one
              │  (orchestrator)
              └─────┬─────┘
         ┌──────────┼──────────┐
         │          │          │
    ┌────▼────┐ ┌───▼────┐ ┌───▼────┐
    │ PLANNER │ │BUILDER │ │REVIEWER│
    │ designs │ │ writes │ │ checks │
    │  plan   │ │  code  │ │ quality│
    └─────────┘ └────────┘ └────────┘
```

### How to use:

```bash
# Switch to TEAM mode (Shift+Tab cycles modes)
# Or:
/agents-team plan-build-review

# Now just describe what you want:
"Add OAuth login with Google and GitHub providers"

# The primary agent will:
# 1. Dispatch planner to design the approach
# 2. Dispatch builder(s) to implement
# 3. Dispatch reviewer to check the work
```

### Team Definition (`agents/teams.yaml`):

```yaml
plan-build-review:
  - planner
  - builder
  - reviewer

bug-hunt:
  - scout
  - tester
  - reviewer
```

---

## CHAIN — Sequential Pipeline

Each step receives the output of the previous step via `$INPUT`.

```
┌──────────┐    ┌──────────┐    ┌──────────┐
│  AUDIT   │───▶│ MIGRATE  │───▶│   TEST   │
│ (scout)  │    │ (builder)│    │ (tester) │
└──────────┘    └──────────┘    └──────────┘
   $INPUT →       $INPUT →       $INPUT →
```

### How to use:

```bash
# Switch to CHAIN mode
/chain audit-migrate-test

# Run the chain
"Audit all deprecated API calls in src/, migrate them to v2, and verify"
```

### Chain Definition (`agents/agent-chain.yaml`):

```yaml
audit-migrate-test:
  description: "Find deprecated APIs, migrate, and verify"
  steps:
    - agent: scout
      prompt: "Audit the codebase for deprecated API usage. Report every instance found.\n\nContext: $INPUT"
    - agent: builder
      prompt: "Migrate every deprecated API call found below to the v2 API:\n\n$INPUT"
    - agent: tester
      prompt: "Run the full test suite and verify all migrations are correct. Report any failures:\n\n$INPUT"
```

---

## PIPELINE — Full Orchestration

Five phases that combine TEAM and CHAIN patterns:

```
UNDERSTAND ──▶ GATHER ──▶ PLAN ──▶ EXECUTE ──▶ REVIEW
(1 agent)      (parallel) (1 agent)  (parallel)   (1 agent)
```

| Phase          | Agents | What happens                               |
| -------------- | ------ | ------------------------------------------ |
| **UNDERSTAND** | 1      | Clarify the task, ask questions            |
| **GATHER**     | 2–3    | Scout codebase, gather context in parallel |
| **PLAN**       | 1      | Produce a detailed implementation plan     |
| **EXECUTE**    | 2–4    | Build in parallel per plan                 |
| **REVIEW**     | 1      | Quality gate, summary report               |

### How to use:

```bash
# Switch to PIPELINE mode (Shift+Tab)
# Just describe your task — the pipeline handles the rest

"Refactor the payment module to support multiple currencies"
```

---

## Agent Definitions

Agents are defined as markdown files with YAML frontmatter in `agents/`:

```markdown
---
name: planner
role: lead
model: claude-sonnet-4-20250514
tools: [read, bash, write, tasks]
system_prompt: |
  You are a planning specialist. Your job is to analyze requirements
  and produce detailed, actionable implementation plans with:
  - Task breakdown (small, verifiable units)
  - Dependency ordering
  - Risk assessment
  - Acceptance criteria per task

  Always output plans as structured markdown.
---

# Planner Agent

Specializes in breaking down complex requirements into implementable tasks.
```

---

## When to Go Multi-Agent

| Situation                            | Pattern  | Why                        |
| ------------------------------------ | -------- | -------------------------- |
| Large feature with independent parts | TEAM     | Parallelize implementation |
| Audit → fix → verify workflows       | CHAIN    | Sequential dependency      |
| Greenfield project                   | PIPELINE | Full structure needed      |
| Quick bug fix                        | SINGLE   | Overhead not worth it      |
| Code review                          | SINGLE   | One agent is enough        |

**Rule of thumb**: Start single-agent. Go multi-agent when:

1. A task naturally splits into 3+ independent pieces, OR
2. You need structured quality gates (audit → check → approve), OR
3. You're building something from scratch and want the full process.

---

## Cost Consideration

Multi-agent means multiple LLM calls. To keep it cheap:

- Use smaller/cheaper models for scouts and reviewers (`claude-haiku`, `gpt-4o-mini`)
- Reserve the best model for builders only
- TEAM mode is the most efficient (parallel = less wall-clock time)
- CHAIN mode uses the most tokens (each step sees full history)

---

## OpenCode Multi-Agent with ECC

[everything-claude-code](https://github.com/affaan-m/everything-claude-code) adds native
multi-agent orchestration to OpenCode — no manual model switching.

### ECC Agent Fleet

| Agent                  | Model (OpenCode Go) | Role                                       |
| ---------------------- | ------------------- | ------------------------------------------ |
| `build`                | DeepSeek V4 Pro     | Primary — writes code, implements features |
| `planner`              | Qwen3.6 Plus        | Plans implementation, breaks into tasks    |
| `architect`            | Qwen3.6 Plus        | System design, architectural decisions     |
| `code-reviewer`        | Kimi K2.6           | Audits code quality, finds bugs            |
| `security-reviewer`    | MiniMax M2.7        | Deep vulnerability scan                    |
| `tdd-guide`            | DeepSeek V4 Pro     | Enforces test-first, 80%+ coverage         |
| `build-error-resolver` | Kimi K2.6           | Fixes build/type errors, minimal diffs     |
| `refactor-cleaner`     | DeepSeek V4 Flash   | Lightweight dead code cleanup              |
| `refactor-heavy`       | DeepSeek V4 Pro     | Heavy structural refactoring               |
| `doc-updater`          | Qwen3.6 Plus        | Documentation drafting, changelogs         |
| `doc-polisher`         | Kimi K2.5           | Final docs polish, clarity pass            |

### How ECC Routes Models Automatically

Each `/command` maps to an agent, which maps to a model:

```
/plan         → planner agent    → Qwen3.6 Plus
/tdd          → tdd-guide agent  → DeepSeek V4 Pro
/code-review  → code-reviewer    → Kimi K2.6
/security     → security-reviewer → MiniMax M2.7
/refactor-clean → refactor-cleaner → DeepSeek V4 Flash
/refactor-heavy → refactor-heavy   → DeepSeek V4 Pro
/polish-docs  → doc-polisher     → Kimi K2.5
```

All run as `subtask: true` — they spin up, complete, and return. No manual model switching.

### The Full ECC Pipeline

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

### Cost: All Included

With OpenCode Go ($10/mo flat), all agents in the fleet run at zero extra cost —
no per-token billing switching between Qwen3.6 Plus, Kimi K2.6/K2.5, MiniMax M2.7, or DeepSeek V4 Pro/Flash.
