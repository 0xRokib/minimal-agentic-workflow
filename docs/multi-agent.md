# Multi-Agent Workflow

> **Conceptual guide** — patterns and principles for coordinating multiple AI agents.
> Tool-specific implementations: see the `pi` or `opencode` branch.

When one agent isn't enough — dispatch teams of specialists, chain sequential steps, or run full orchestrated pipelines.

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
| **PLAN**       | 1      | Produce a detailed implementation plan      |
| **EXECUTE**    | 2–4    | Build in parallel per plan                  |
| **REVIEW**     | 1      | Quality gate, summary report               |

### When to use PIPELINE

- Greenfield projects requiring full structure
- Complex features with many interdependent components
- When you need a structured quality gate at each phase

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

---

## Anti-Patterns

| Don't | Why | Do Instead |
|-------|-----|------------|
| Use multi-agent for everything | Wastes tokens and time | Single-agent for simple tasks |
| Long chains without quality gates | Errors cascade | Add review steps between agents |
| No model routing | Expensive models for simple tasks | Route by task complexity |
| Skip the PLAN phase | Wasted build effort | Always plan before executing |

---

## Tool-Specific Implementations

Each branch of this repo contains a tool-specific implementation:

| Branch    | How to use                                        |
| --------- | ------------------------------------------------ |
| `pi`     | `pi install agent-pi` → `/agents-team` commands  |
| `opencode` | `/command` → subtask agents via ECC fleet      |
