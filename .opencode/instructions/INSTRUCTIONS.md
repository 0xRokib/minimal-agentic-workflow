# Minimal Agentic Workflow — OpenCode Instructions

This project is a **documentation-and-configuration repository** — not a software application.
Stack: Markdown, YAML, Bash only. No runtime. No npm. No builds. No tests.

> Read `.context/CONTEXT.md` for domain glossary and conventions.
> Read `AGENTS.md` for agent rules before making any changes.

---

## Project Identity

- **What it is**: A methodology + working template for AI-assisted coding at $5–10/month
- **Primary tool**: OpenCode Go ($5 first month, $10/mo) — flat-rate access to DeepSeek, Kimi, GLM, Qwen, MiMo, MiniMax
- **Agent tools**: OpenCode, Pi, Claude Code, Cursor
- **Payment**: RedotPay (crypto → Visa card for API subscriptions)

## Project Structure

```
README.md              ← ground truth — all referenced files must exist
AGENTS.md              ← rules for all AI agents working on this project
opencode.json          ← project-level OpenCode config
.context/              ← shared knowledge (CONTEXT.md, ARCHITECTURE.md, todo.md)
docs/                  ← 8 documentation guides
agents/                ← custom agent definitions (markdown + YAML frontmatter)
skills/                ← custom skills (SKILL.md files)
.opencode/             ← OpenCode commands, prompts, instructions
scripts/               ← automation (setup.sh)
.pi/                   ← Pi agent config
.github/workflows/     ← CI (docs validation)
```

## Hard Constraints (never violate)

1. **No dependencies** — no npm, no pip, no gems, no build tools
2. **No broken links** — every `[text](path.md)` must resolve to a real file
3. **No orphaned files** — new files must be referenced in README or CONTEXT.md
4. **No placeholder text** — replace all `[Your Project]`, `<!-- fill in -->`
5. **No runtime tools** — `.opencode/tools/*.ts` files are excluded (require Node/Bun)

---

## Security Guidelines

Before ANY commit:

- [ ] No hardcoded API keys, tokens, or credentials in markdown or scripts
- [ ] `.gitignore` covers all secret file patterns (`*.key`, `*.pem`, `.env*`)
- [ ] No personal account data in docs
- [ ] External URLs in docs are intentional (not injected)

If security issue found:

1. STOP immediately
2. Use **security-reviewer** agent
3. Remove the secret, rotate it, then commit the fix

---

## Markdown Style

Before marking work complete:

- [ ] Section separators: `---` with blank lines before and after
- [ ] Headings: ATX-style (`##`) with a space
- [ ] Code blocks: fenced with triple backticks and language tag
- [ ] Tables: aligned pipes with `|` on both edges
- [ ] No lines over 200 chars (markdownlint rule)
- [ ] No placeholder text remains
- [ ] All internal links resolve

---

## Verification (no test suite — use these instead)

After any change:

```bash
# Check all docs referenced in README exist
bash scripts/setup.sh --dry-run

# Check markdown linting
npx markdownlint-cli2 "**/*.md" "!node_modules/**"
```

Before committing:

- [ ] Every file referenced in README.md exists on disk
- [ ] Every internal link `[text](path.md)` resolves
- [ ] Markdown renders without errors
- [ ] `.context/todo.md` updated

---

## Git Workflow

### Commit Message Format

```
<type>: <description>

<optional body>
```

Types: feat, fix, refactor, docs, test, chore, perf, ci

### Pull Request Workflow

When creating PRs:

1. Analyze full commit history (not just latest commit)
2. Use `git diff [base-branch]...HEAD` to see all changes
3. Draft comprehensive PR summary
4. Include test plan with TODOs
5. Push with `-u` flag if new branch

### Feature Implementation Workflow

1. **Plan First**
   - Use **planner** agent to create implementation plan
   - Identify dependencies and risks
   - Break down into phases

2. Bug fix or new feature - Use **tdd-guide** agent
3. Architectural decision - Use **architect** agent

---

## Model Selection (OpenCode Go)

| Task                         | Agent                             | Model         |
| ---------------------------- | --------------------------------- | ------------- |
| Planning, docs, ADRs         | planner / architect               | GLM-5.1       |
| Writing content, refactoring | build                             | Kimi K2.6     |
| Review, audit, bug fixes     | code-reviewer / security-reviewer | MiMo V2.5 Pro |
| Doc updates                  | doc-updater                       | GLM-5.1       |

All models are included in the OpenCode Go flat rate — no per-token cost.

---

## Workflow Patterns

### Adding a new doc

1. Create `docs/<name>.md`
2. Add entry to README.md documentation table
3. Add entry to `.context/CONTEXT.md` key files table
4. Run `/verify` to confirm links resolve

### Editing existing docs

1. Make change
2. Check all internal links still resolve
3. Run `/code-review` to check consistency
4. Commit with `docs: <description>`

### Adding a skill

1. Create `skills/<name>/SKILL.md`
2. Reference in README if notable
3. Optionally add to `instructions` in `opencode.json`

---

## Commands Available

| Command        | What it does                            | Agent used                        |
| -------------- | --------------------------------------- | --------------------------------- |
| `/plan`        | Implementation plan for complex changes | planner (GLM-5.1)                 |
| `/code-review` | Review docs for quality and consistency | code-reviewer (MiMo V2.5 Pro)     |
| `/security`    | Check for exposed secrets or injection  | security-reviewer (MiMo V2.5 Pro) |
| `/verify`      | Confirm links and paths resolve         | build                             |
| `/update-docs` | Sync docs with current state            | doc-updater (GLM-5.1)             |
| `/learn`       | Extract patterns from session           | build                             |
| `/checkpoint`  | Save progress mid-session               | build                             |

---

## Success Criteria

Work is complete when:

- All files referenced in README.md exist
- All internal links resolve
- Markdown renders without lint errors
- No placeholder text remains
- `.context/todo.md` is updated
- Commit follows `category: description` format

---
