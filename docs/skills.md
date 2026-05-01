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

## The Three Skill Ecosystems

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
| `design-md` | UI | `/design` |

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

### affaan-m/everything-claude-code (ECC) — OpenCode Native

182 skills purpose-built for OpenCode with a full agent + command system.
**Repo**: [github.com/affaan-m/everything-claude-code](https://github.com/affaan-m/everything-claude-code)

**Philosophy**: Specialized agents per task with automatic model routing. Skills load on
session start — no manual activation needed.

**Default loaded skills (11):**
| Skill | What it enforces |
|-------|-----------------|
| `tdd-workflow` | Red-green-refactor, tests first |
| `security-review` | Vulnerability detection before commit |
| `coding-standards` | Immutability, file size, naming |
| `frontend-patterns` | React, component architecture |
| `backend-patterns` | API design, error handling |
| `e2e-testing` | Playwright, critical user flows |
| `verification-loop` | Automated check after every change |
| `api-design` | REST/GraphQL best practices |
| `strategic-compact` | Context compression under pressure |
| `eval-harness` | Evaluation criteria and scoring |
| `frontend-slides` | Presentation component patterns |

**Additional skills (171 more) — notable ones:**

```
golang-patterns     rust-patterns       python-patterns
kotlin-patterns     swift-concurrency   django-tdd
springboot-tdd      laravel-tdd         nextjs-turbopack
postgres-patterns   docker-patterns     git-workflow
deep-research       security-bounty-hunter  hipaa-compliance
cost-aware-llm-pipeline  context-budget  token-budget-advisor
autonomous-loops    continuous-learning  agentic-engineering
```

**Paired commands (25+ slash commands):**

```
/plan           → GLM-5.1 plans implementation
/tdd            → DeepSeek V4 Pro enforces test-first
/code-review    → MiMo V2.5 Pro audits code
/security       → MiMo V2.5 Pro checks for vulnerabilities
/build-fix      → MiMo V2.5 Pro fixes build errors
/verify         → confirms everything works
/checkpoint     → saves session progress
/learn          → extracts patterns for reuse
/skill-create   → generates new skills from git history
```

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

| Don't         | Why             | Do Instead         |
| ------------- | --------------- | ------------------ |
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

### design-md skill (per-project)

```bash
# Pi — copy to Pi skill directory
cp -r skills/design-md ~/.pi/skills/

# OpenCode — keep in ./skills/ and reference in opencode.json
```

### affaan-m/everything-claude-code (ECC) — OpenCode

```bash
# Step 1: Install the npm plugin globally
cd ~/.config/opencode
npm install ecc-universal

# Step 2: Clone and copy skills + commands
git clone --depth=1 https://github.com/affaan-m/everything-claude-code /tmp/ecc
cp -r /tmp/ecc/.opencode/commands ~/.config/opencode/commands
cp -r /tmp/ecc/.opencode/prompts ~/.config/opencode/prompts
cp -r /tmp/ecc/.opencode/instructions ~/.config/opencode/instructions
cp -r /tmp/ecc/skills ~/.config/opencode/skills

# Step 3: Add to ~/.config/opencode/opencode.json
# "plugin": ["ecc-universal"],
# "instructions": ["skills/tdd-workflow/SKILL.md", ...]

# Per-project: copy .opencode/ into your project root
cp -r /tmp/ecc/.opencode/commands .opencode/commands
cp -r /tmp/ecc/.opencode/prompts .opencode/prompts
cp -r /tmp/ecc/.opencode/instructions .opencode/instructions
```

---

## Which Skills to Start With

### Minimal Starter Set (5 skills)

1. **grill-me** — Align before every task
2. **planning-and-task-breakdown** — Break work into small pieces
3. **incremental-implementation** — Build one slice at a time
4. **tdd** — Red-green-refactor
5. **code-review-and-quality** — Quality gate before commit

### Full Production Set (11 skills)

Add these once you're comfortable:

6. **spec-driven-development** — For new features
7. **context-engineering** — Better agent context management
8. **debugging-and-error-recovery** — Systematic debugging
9. **security-and-hardening** — Security awareness
10. **improve-codebase-architecture** — Weekly cleanup
11. **design-md** (`/design`) — Apply DESIGN.md tokens for pixel-perfect UI

---

## Skills vs MCP Tools

| Aspect        | Skills                | MCP Tools               |
| ------------- | --------------------- | ----------------------- |
| What they are | Markdown workflows    | API-connected tools     |
| Modifies      | Agent behavior/prompt | Available tool set      |
| Example       | "How to do TDD"       | "Connect to Jira"       |
| Creation      | Write markdown        | Write server code       |
| Portability   | Works with any agent  | Specific to MCP servers |

They're complementary — skills define HOW to work, MCP tools define WHAT you can work with.
