# Single-Agent Workflow

The day-to-day coding workflow with one AI agent. This is where you'll spend 80% of your time.

---

## The Core Loop

```
THINK → PLAN → BUILD → VERIFY → COMMIT
  ↑                                  │
  └──────────────────────────────────┘
```

### 1. THINK — Align Before Coding

The biggest failure mode: the agent builds something you didn't want. Fix it before it starts:

```
/grill-me
```

The agent will ask you clarifying questions about:

- What exactly are you building?
- What are the constraints?
- What does "done" look like?
- What should it NOT do?

This takes 2–5 minutes and saves hours of rework.

### 2. PLAN — Break It Down

```
/plan
```

Produces a task list with:

- Small, atomic units of work
- Dependency ordering
- Acceptance criteria per task

Pi and OpenCode both enforce task discipline — you define tasks before using tools.

### 3. BUILD — One Slice at a Time

```
/build
```

Rules for building:

- **Thin vertical slices** — implement, test, verify, commit in one pass
- **Don't touch more than 3 files per slice**
- **Feature flags** for anything risky
- **Safe defaults** — the codebase should always be in a working state
- **Rollback-friendly** — every commit should be revertable independently

### 4. VERIFY — Prove It Works

```
/test
```

- Red-Green-Refactor: write the failing test first
- Test pyramid: 80% unit, 15% integration, 5% e2e
- Tests are proof, not decoration
- If it's not tested, it's broken

### 5. COMMIT — Small, Clean History

```
/review
```

Before committing:

- Review the diff yourself
- Keep changes under ~100 lines per commit
- Write a descriptive commit message
- One logical change per commit

---

## Pi Commands Reference

| Command                               | What it does                |
| ------------------------------------- | --------------------------- |
| `pi`                                  | Start interactive session   |
| `pi "fix the login bug"`              | One-shot task               |
| `pi --model claude-sonnet-4-20250514` | Choose model                |
| `Ctrl+X`                              | Cycle theme (with agent-pi) |
| `Shift+Tab`                           | Cycle mode (with agent-pi)  |

---

## OpenCode Commands Reference

| Command                    | What it does              |
| -------------------------- | ------------------------- |
| `opencode`                 | Start interactive session |
| `opencode "add dark mode"` | One-shot task             |
| `opencode --model gpt-4o`  | Choose model              |

---

## OpenCode + ECC Workflow

With [everything-claude-code](https://github.com/affaan-m/everything-claude-code) installed,
OpenCode gains 25+ slash commands and 9 specialist agents with automatic model routing.

### ECC Daily Loop

```bash
opencode   # start in your project dir
```

```
/plan <what you want>    → GLM-5.1 produces step-by-step plan
                          ↓
(Kimi K2.6 builds it)
                          ↓
/code-review             → MiMo V2.5 Pro audits the diff
                          ↓
/security                → MiMo V2.5 Pro checks for vulns
                          ↓
git commit
```

### ECC Command Reference

| Command           | Agent (model)                        | When to use                   |
| ----------------- | ------------------------------------ | ----------------------------- |
| `/plan`           | planner (GLM-5.1)                    | Before any implementation     |
| `/tdd`            | tdd-guide (DeepSeek V4 Pro)          | New features — tests first    |
| `/code-review`    | code-reviewer (MiMo V2.5 Pro)        | After writing code            |
| `/security`       | security-reviewer (MiMo V2.5 Pro)    | Before committing             |
| `/build-fix`      | build-error-resolver (MiMo V2.5 Pro) | Build broken                  |
| `/verify`         | build (Kimi K2.6)                    | Confirm everything works      |
| `/checkpoint`     | build                                | Save mid-session progress     |
| `/learn`          | build                                | Extract reusable patterns     |
| `/update-docs`    | doc-updater (GLM-5.1)                | Sync docs after changes       |
| `/skill-create`   | build                                | Turn git history into a skill |
| `/refactor-clean` | refactor-cleaner (DeepSeek V4 Flash) | Remove dead code              |
| `/orchestrate`    | planner                              | Coordinate multiple agents    |

### `.opencode/` Project Setup

Add this to your project root for per-project ECC config:

```
project/
├── opencode.json          ← project config (loads AGENTS.md + context)
├── .opencode/
│   ├── commands/          ← 25+ slash command .md files
│   ├── prompts/agents/    ← agent prompt .txt files
│   └── instructions/
│       └── INSTRUCTIONS.md ← base session instructions
├── AGENTS.md
└── .context/
```

`opencode.json` auto-loads project context every session:

```json
{
  "$schema": "https://opencode.ai/config.json",
  "instructions": ["AGENTS.md", ".context/CONTEXT.md"],
  "command": {
    "plan": {
      "template": "{file:.opencode/commands/plan.md}\n\n$ARGUMENTS",
      "agent": "planner",
      "subtask": true
    }
  }
}
```

---

## The Skill Stack

Load these skills into your agent for a complete workflow:

### Always Active

1. **Context Engineering** — Feed the agent the right files at the right time
2. **Incremental Implementation** — Thin vertical slices
3. **Test-Driven Development** — Red-Green-Refactor

### On Demand

4. **Grill Me** (`/grill-me`) — Before starting any task
5. **Diagnose** (`/diagnose`) — When something breaks
6. **Improve Architecture** (`/improve-codebase-architecture`) — Weekly cleanup
7. **Code Review** (`/review`) — Before merging

---

## Project Setup

### `.context/` Directory

Pi and OpenCode both look for project context:

```
project/
├── .context/
│   ├── CONTEXT.md       # Shared language / glossary
│   ├── ARCHITECTURE.md  # System design decisions (ADRs)
│   └── todo.md          # Current task list
├── AGENTS.md            # Agent rules (for both humans and agents)
└── CLAUDE.md            # Claude-specific instructions
```

### `AGENTS.md` Template

```markdown
# Agent Rules

## Project: [name]

## Stack: [list]

## Rules

1. Never delete files — ask first
2. Always write tests before implementation
3. Keep changes under 100 lines per commit
4. Use TypeScript strict mode
5. Follow the existing code style

## Context Files

- Architecture decisions: .context/ARCHITECTURE.md
- Shared glossary: .context/CONTEXT.md
```

---

## Daily Workflow Cheat Sheet

```bash
# Morning: Start fresh
pi

# Align on the task
/grill-me

# Plan the work
/plan

# Build in small slices
/build

# Test each slice
/test

# Review before committing
/review

# Commit
git add -p && git commit -m "feat: add user authentication"
```
