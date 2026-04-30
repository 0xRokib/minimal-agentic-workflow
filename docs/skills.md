# Skills System

Skills are reusable markdown files that teach AI agents repeatable workflows. Think of them as "standard operating procedures" for coding.

---

## How Skills Work

A skill is a markdown file (`SKILL.md`) that describes:

1. **When to activate** — triggers (slash commands, keywords, file types)
2. **Step-by-step workflow** — what the agent should do, in order
3. **Verification gates** — how to know when a step is done
4. **Anti-patterns** — what NOT to do, with rationalization tables

Skills are loaded by the agent on startup or on demand. They modify the system prompt to add context-aware behavior.

---

## The Two Skill Ecosystems

### addyosmani/agent-skills — Production Engineering

20 skills covering the full dev lifecycle. Designed for Claude Code, Cursor, Gemini CLI, Windsurf, OpenCode, Copilot, Kiro.

**Philosophy**: Production-grade engineering workflows with quality gates at every step.

```
Define → Plan → Build → Verify → Review → Ship
```

**Key skills**:
| Skill | Category | Trigger |
|-------|----------|---------|
| `spec-driven-development` | Define | `/spec` |
| `planning-and-task-breakdown` | Plan | `/plan` |
| `incremental-implementation` | Build | `/build` |
| `test-driven-development` | Verify | `/test` |
| `code-review-and-quality` | Review | `/review` |
| `shipping-and-launch` | Ship | `/ship` |
| `security-and-hardening` | All | auto on auth/data |
| `context-engineering` | All | session start |

### mattpocock/skills — Real Engineering

Focused on fixing specific failure modes. Works with any model.

**Philosophy**: Small, composable, based on decades of engineering experience. You hack them to fit your workflow.

**Key skills**:
| Skill | Category | Problem it solves |
|-------|----------|-------------------|
| `grill-me` | Productivity | Misalignment — agent builds wrong thing |
| `grill-with-docs` | Engineering | No shared language → verbose code |
| `tdd` | Engineering | Code doesn't work → no feedback loops |
| `diagnose` | Engineering | Bugs are hard to find |
| `to-prd` | Engineering | Spec is too vague |
| `improve-codebase-architecture` | Engineering | Codebase turns into mud |
| `zoom-out` | Engineering | Agent loses the big picture |

---

## Composing Your Own Skills

Skills are plain markdown. Here's the template:

```markdown
# Skill: [name]

## When to Use
- Trigger: `/my-command` or auto-detect conditions
- Applies to: TypeScript projects, React components, etc.

## Workflow

### Step 1: Understand
1. Read [specific files]
2. Check [conditions]
3. Ask user if [uncertain]

### Step 2: Execute
1. Do [specific action]
2. Verify by [check]
3. If fail → [fallback]

## Verification Gates
- [ ] Gate 1: [condition]
- [ ] Gate 2: [condition]

## Anti-Patterns
| Don't | Why | Do Instead |
|-------|-----|------------|
| Skip the spec | Leads to rework | Always /spec first |

## Reference
- [Link to relevant docs]
```

---

## Installing Skills

### agent-skills

```bash
# Claude Code (marketplace)
/plugin marketplace add addyosmani/agent-skills
/plugin install agent-skills@addy-agent-skills

# Local / any agent
git clone https://github.com/addyosmani/agent-skills.git ~/.agent-skills
# Reference skills from ~/.agent-skills/skills/ in your agent config

# Pi
cp -r ~/.agent-skills/skills/* ~/.pi/skills/
```

### mattpocock/skills

```bash
# One-command installer
npx skills@latest add mattpocock/skills

# Manual
git clone https://github.com/mattpocock/skills.git ~/.mattpocock-skills
```

### agent-pi skills

```bash
pi install git:github.com/ruizrica/agent-pi
# Skills auto-discovered from the package
```

---

## Which Skills to Start With

### Minimal Starter Set (5 skills)

1. **grill-me** — Align before every task
2. **planning-and-task-breakdown** — Break work into small pieces
3. **incremental-implementation** — Build one slice at a time
4. **tdd** — Red-green-refactor
5. **code-review-and-quality** — Quality gate before commit

### Full Production Set (10 skills)

Add these once you're comfortable:
6. **spec-driven-development** — For new features
7. **context-engineering** — Better agent context management
8. **debugging-and-error-recovery** — Systematic debugging
9. **security-and-hardening** — Security awareness
10. **improve-codebase-architecture** — Weekly cleanup

---

## Skills vs MCP Tools

| Aspect | Skills | MCP Tools |
|--------|--------|-----------|
| What they are | Markdown workflows | API-connected tools |
| Modifies | Agent behavior/prompt | Available tool set |
| Example | "How to do TDD" | "Connect to Jira" |
| Creation | Write markdown | Write server code |
| Portability | Works with any agent | Specific to MCP servers |

They're complementary — skills define HOW to work, MCP tools define WHAT you can work with.
