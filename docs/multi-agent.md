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
| `build`                | Kimi K2.6           | Primary — writes code, implements features |
| `planner`              | GLM-5.1             | Plans implementation, breaks into tasks    |
| `architect`            | GLM-5.1             | System design, architectural decisions     |
| `code-reviewer`        | MiMo V2.5 Pro       | Audits code quality, finds issues          |
| `security-reviewer`    | MiMo V2.5 Pro       | Vulnerability detection, auth checks       |
| `tdd-guide`            | DeepSeek V4 Pro     | Enforces test-first, 80%+ coverage         |
| `build-error-resolver` | MiMo V2.5 Pro       | Fixes build/type errors, minimal diffs     |
| `refactor-cleaner`     | DeepSeek V4 Flash   | Dead code removal, consolidation           |
| `doc-updater`          | GLM-5.1             | Documentation sync, codemap updates        |

### How ECC Routes Models Automatically

Each `/command` maps to an agent, which maps to a model:

```
/plan   → planner agent → GLM-5.1
/tdd    → tdd-guide agent → DeepSeek V4 Pro
/review → code-reviewer agent → MiMo V2.5 Pro
```

All run as `subtask: true` — they spin up, complete, and return. No manual model switching.

### ECC as a TEAM Pattern

```
You: /plan add payment integration
           ↓
    planner (GLM-5.1) → structured task list
           ↓
    build (Kimi K2.6) → implements each task
           ↓
    /code-review
    code-reviewer (MiMo V2.5 Pro) → audits output
           ↓
    /security
    security-reviewer (MiMo V2.5 Pro) → checks auth/payment code
           ↓
    git commit
```

### Cost: All Included

With OpenCode Go ($10/mo flat), all agents in the fleet run at zero extra cost —
no per-token billing when switching between GLM-5.1, Kimi K2.6, MiMo V2.5 Pro, or DeepSeek.
