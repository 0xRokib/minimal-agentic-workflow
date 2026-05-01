# Minimal Agentic Workflow — Shared Language & Context

> AI agents read this file to understand the project's domain language, conventions, and structure.
> Keep it precise. Avoid verbose explanations.

---

## Domain Glossary

| Term                 | Definition                                                                            |
| -------------------- | ------------------------------------------------------------------------------------- |
| **Agentic workflow** | A development process where AI agents plan, build, test, and review code autonomously |
| **Skill**            | A reusable markdown file (SKILL.md) that teaches an agent a repeatable workflow       |
| **TEAM mode**        | Parallel dispatch — a primary agent delegates to specialist agents simultaneously     |
| **CHAIN mode**       | Sequential pipeline — each agent step feeds output into the next via `$INPUT`         |
| **PIPELINE mode**    | 5-phase orchestration: Understand → Gather → Plan → Execute → Review                  |
| **OpenCode Go**      | $10/month subscription providing API access to a curated fleet of coding LLMs         |
| **OpenCode Zen**     | Pay-as-you-go tier for premium models (Claude, GPT-4o, Gemini)                        |
| **agent-pi**         | Multi-agent orchestration extension for the Pi coding agent                           |
| **RedotPay**         | Crypto-to-Visa payment platform — bridge USDC/USDT to fiat for AI API subscriptions   |
| **ADR**              | Architecture Decision Record — a lightweight document capturing a design decision     |
| **DESIGN.md**        | Plain-text design system document that AI agents read to generate consistent UI       |
| **Feedback loop**    | Running types/lint/tests after every ~50 lines of code to catch issues early          |

---

## Architecture Decisions (ADRs)

All ADRs live in [.context/ARCHITECTURE.md](ARCHITECTURE.md). Key decisions recorded there:

| ADR     | Decision                                          | Status   |
| ------- | ------------------------------------------------- | -------- |
| ADR-001 | Project structure aligned with README spec        | Accepted |
| ADR-002 | Zero dependencies — plain markdown and shell only | Accepted |

---

## Project Conventions

### File Naming

- **Markdown files**: kebab-case (`single-agent.md`, `best-practices.md`)
- **Skill files**: `SKILL.md` inside a kebab-case folder
- **Config files**: lowercase with extension (`settings.yaml`, `security.yaml`)
- **Scripts**: lowercase with `.sh` extension

### Markdown Style

- Section separators: `---` with blank lines before and after
- Headings: ATX-style (`##`) with a space after `##`
- Code blocks: fenced with triple backticks and language tag
- Tables: aligned pipes with `|` on both edges

### Git Conventions

- **Commit format**: `category: description` (conventional-style)
  - `docs:` — documentation changes
  - `config:` — configuration changes
  - `refactor:` — structural reorganization
  - `feat:` — new content or feature
  - `fix:` — corrections
- Branches off `main`, merged via PR

### No Tests? That's Fine

This is a documentation project. There are no unit tests, linters, or type checkers. The equivalents:

- Links must resolve (no broken internal references)
- File paths referenced in docs must exist
- Markdown must render correctly
- Setup script must run without errors

---

## Key Files & Directories

| Path                        | Purpose                                                                |
| --------------------------- | ---------------------------------------------------------------------- |
| `README.md`                 | Project overview — the ground truth for what this project contains     |
| `AGENTS.md`                 | Rules all AI agents must follow when working on this project           |
| `docs/`                     | All documentation (8 guides covering the full agentic workflow)        |
| `docs/opencode-go.md`       | Deep dive on the OpenCode Go subscription plan                         |
| `docs/single-agent.md`      | Day-to-day single-agent coding workflow                                |
| `docs/multi-agent.md`       | TEAM, CHAIN, and PIPELINE multi-agent orchestration                    |
| `docs/skills.md`            | How skills work, composing your own                                    |
| `docs/security.md`          | Prompt injection defense, secrets, tool hardening                      |
| `docs/best-practices.md`    | Principles for building agent workflows                                |
| `docs/redotpay.md`          | Paying for AI APIs with crypto                                         |
| `docs/llm-providers.md`     | Provider comparison, cost estimates, model tiering                     |
| `.context/`                 | Project knowledge for AI agents                                        |
| `.context/CONTEXT.md`       | This file — shared language and conventions                            |
| `.context/ARCHITECTURE.md`  | Architecture decision records                                          |
| `.context/todo.md`          | Current task board                                                     |
| `.pi/`                      | Pi coding agent configuration                                          |
| `.pi/settings.yaml`         | Agent settings, mode defaults, skills paths                            |
| `.pi/security.yaml`         | Security guard rules and allowlist                                     |
| `agents/`                   | Custom agent definitions (markdown with YAML frontmatter)              |
| `skills/`                   | Custom skills (SKILL.md files)                                         |
| `.opencode/`                | OpenCode project config — commands, agent prompts, instructions        |
| `.opencode/commands/`       | Slash commands (`/plan`, `/code-review`, `/security`, `/verify`, etc.) |
| `.opencode/prompts/agents/` | Agent prompt files (planner, reviewer, security, doc-updater)          |
| `.opencode/instructions/`   | Base instructions loaded into every OpenCode session                   |
| `opencode.json`             | Project-level OpenCode config — wires commands to agents               |
| `skills/arch-review/`       | Lightweight architecture review skill                                  |
| `skills/design-md/`         | Design system skill — apply DESIGN.md tokens to UI work                |
| `skills/SKILL-TEMPLATE.md`  | Template for creating new skills                                       |
| `scripts/setup.sh`          | Bootstrap script — installs agents, skills, and config                 |
| `.gitignore`                | Git ignore rules (secrets, agent state, OS files)                      |
