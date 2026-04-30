# Best Practices

Minimal, composable, maintainable — principles for building and running agent workflows.

---

## Core Principles

### 1. Keep Agents Simple

An agent should do ONE thing well. If an agent prompt is more than a paragraph, split it.

```
❌ BAD: One agent that plans, builds, tests, reviews, deploys, and sends Slack messages
✅ GOOD: Six agents, each with one responsibility
```

**Tests for simplicity**:

- Can you describe what the agent does in one sentence?
- Does the agent's system prompt fit on a screen?
- Can another developer understand the agent in 30 seconds?

### 2. Compose, Don't Build Monoliths

Skills are composable. An agent's behavior = system prompt + activated skills.

```
Agent = Base personality + Skill A + Skill B + Skill C
```

You can swap skills without changing the agent:

```
Builder Agent + tdd skill         → Test-first builder
Builder Agent + no-tdd skill      → Quick prototype builder
Builder Agent + security skill    → Security-aware builder
```

### 3. Skills Over Prompts

Skills are better than long prompts because they're:

- **Reusable** — same skill across different agents and projects
- **Versionable** — track changes in git
- **Shareable** — `npx skills@latest add mattpocock/skills`
- **Composable** — mix and match for different workflows
- **Discoverable** — slash commands make them easy to find

### 4. Feedback Loops > Perfect Plans

The faster an agent gets feedback, the better its output.

```
Best feedback loops (fastest to slowest):
1. TypeScript compiler (< 1 second)
2. Linter (< 2 seconds)
3. Unit tests (< 10 seconds)
4. Integration tests (< 1 minute)
5. E2E tests (< 5 minutes)
6. Human review (< 1 hour)
7. Production errors (too late!)
```

**Rule**: Never let an agent write more than 50 lines without running a feedback loop.

### 5. Start Single, Scale to Multi

Don't reach for multi-agent orchestration until you need it.

```
Phase 1: Single agent, no skills        → Learn the tool
Phase 2: Single agent + skills          → Better quality
Phase 3: Single agent + custom skills   → Your workflow
Phase 4: Multi-agent TEAM mode          → Parallelize
Phase 5: Multi-agent PIPELINE           → Full orchestration
```

---

## Project Structure

```
project/
├── AGENTS.md              # Rules for all agents
├── opencode.json          # OpenCode project config (instructions, commands, agents)
├── .context/              # Shared project knowledge
│   ├── CONTEXT.md         # Glossary, shared language
│   ├── ARCHITECTURE.md    # Decision records (ADRs)
│   └── todo.md            # Current task board
├── .opencode/             # OpenCode-specific config (ECC)
│   ├── commands/          # Slash commands (/plan, /tdd, /code-review, ...)
│   ├── prompts/agents/    # Agent prompt files
│   └── instructions/
│       └── INSTRUCTIONS.md  # Base instructions loaded every session
├── .pi/                   # Pi-specific config
│   ├── settings.yaml      # Agent configuration
│   └── security.yaml      # Security allowlist
├── .claude/               # Claude Code config
│   └── settings.json
├── .cursor/
│   └── rules/             # Cursor rules (can use skills)
├── agents/                # Custom agent definitions
│   ├── planner.md
│   ├── builder.md
│   └── reviewer.md
├── skills/                # Custom skills
│   └── my-workflow/
│       └── SKILL.md
└── src/                   # Your actual code
```

The `.opencode/` directory follows the [ECC convention](https://github.com/affaan-m/everything-claude-code)
and is read automatically by OpenCode on startup. Commands defined there appear as slash commands in the TUI.

---

## Writing Good Agent Rules

### `AGENTS.md` Template

```markdown
# Agent Rules for [Project Name]

## Stack

- TypeScript, React, Node.js
- PostgreSQL, Prisma ORM
- Testing: Vitest + Playwright

## Rules (always follow these)

1. Never delete files without asking
2. Always run the type checker after changes
3. Keep PRs under 200 lines
4. Follow the existing code style — don't reformat
5. Write tests for all new behavior

## Shared Language (see .context/CONTEXT.md)

- "Materialization" = creating real files from templates
- "Pipeline" = the CI/CD build process
- "Provider" = external payment gateway integration

## Anti-Patterns (never do these)

- Don't introduce new dependencies without asking
- Don't refactor and add features in the same PR
- Don't leave TODO comments without a ticket number
```

---

## Communication Patterns

### Before Starting Work

Always align first:

```
You: "Add dark mode toggle to settings"
Agent: /grill-me
Agent: "Should this persist across sessions? System preference detection?
        What components need it first?"
You: [answers]
Agent: "Got it. Here's the plan..."
```

### During Work

Give the agent tight feedback loops:

```
Agent: "I've added the ThemeProvider. Running tests..."
Agent: "Tests pass. Now adding the toggle component..."
Agent: "Here's the toggle — does this look right?"
You: "Move it to the header, not settings"
Agent: "Done. Updated and tests still pass."
```

### After Work

Always review:

```
Agent: "All tasks complete. Running /review..."
Agent: "PR ready: 3 files, +45/-12 lines, 100% test coverage"
You: [reviews diff]
You: "Ship it"
```

---

## Anti-Patterns to Avoid

| Anti-Pattern                  | Why It's Bad                      | Fix                          |
| ----------------------------- | --------------------------------- | ---------------------------- |
| "Just build the whole thing"  | No feedback, high rework risk     | Grill first, then plan       |
| Giant commits (500+ lines)    | Hard to review, easy to miss bugs | Max 100 lines per commit     |
| Agent writes 10 files at once | Can't verify all at once          | One file/component at a time |
| No tests                      | Code rots immediately             | TDD always                   |
| Copy-pasting agent output     | Don't trust blindly               | Review every line            |
| Agent as black box            | Can't debug when things fail      | Understand what it's doing   |
| Skipping the spec             | Builds wrong thing                | `/spec` or `/grill-me` first |
| One mega-agent                | Hard to reason about              | Compose small agents         |

---

## Daily Habits

1. **Morning**: Check agent context — is it fresh or stale? Run `memory-cycle` if needed
2. **Before each task**: `/grill-me` to align
3. **During builds**: Watch the diff, not just the chat
4. **After each slice**: Run tests, commit
5. **End of day**: `/improve-codebase-architecture` if things got messy
6. **Weekly**: `/secure` sweep, review agent logs

---

## When NOT to Use an Agent

Some tasks are still better done manually:

- Git merge conflict resolution (agent can make it worse)
- Large-scale refactoring (use codemods/tools instead)
- Security-critical code (auth, crypto, payments — write yourself)
- Configuration of CI/CD secrets (too sensitive)
- Anything you don't fully understand (you need to review it anyway)
