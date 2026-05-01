# Task Board

> Current work items for this project.
> Keep tasks small, verifiable, and ordered by priority.

---

## Backlog

- [ ] Add CI/CD pipeline for doc validation (link checker)
- [ ] Create more custom skills in `skills/`
- [ ] Add agent definitions in `agents/`

---

## In Progress

_(none)_

---

## Done

- [x] Add `skills/design-md/` skill for DESIGN.md workflow
- [x] Update `AGENTS.md` with DESIGN.md rule
- [x] Update `.context/CONTEXT.md` with DESIGN.md glossary + key files
- [x] Update `docs/skills.md` with design-md install instructions
- [x] Update `README.md` with `/design` command
- [x] Add branching strategy to README (main + pi + opencode)
- [x] Rewrite README.md on pi branch (Pi-specific)
- [x] Rewrite docs/multi-agent.md on pi branch (agent-pi patterns)
- [x] Remove .opencode/ and opencode.json from pi branch
- [x] Update .context/todo.md on pi branch
- [x] Create `docs/opencode-go.md` (was missing)
- [x] Move `configs/AGENTS.md` → root `AGENTS.md`
- [x] Move `configs/CONTEXT.md` → `.context/CONTEXT.md`
- [x] Create `.context/ARCHITECTURE.md`
- [x] Create `.context/todo.md`
- [x] Remove `configs/` folder
- [x] Update `scripts/setup.sh` paths
- [x] Audit and normalize `---` separator style across all docs
- [x] Make `.context/CONTEXT.md` project-specific (domain glossary, conventions, structure)
- [x] Make `AGENTS.md` project-specific (rules adapted for docs-only project)

---

## Branch Architecture

```
main      ← shared core (no tool-specific config)
  ├── docs/multi-agent.md (tool-agnostic patterns)
  └── docs/opencode-go.md ← REMOVED (opencode branch only)

pi        ← main + .pi/ (Pi config, agent-pi, security guard)
  ├── .pi/ (settings.yaml, security.yaml)
  └── docs/multi-agent.md (agent-pi patterns)

opencode  ← main + .opencode/ + opencode.json (ECC fleet)
  ├── .opencode/ (22 commands, 16 agents, plugin deps)
  ├── opencode.json
  ├── docs/multi-agent.md (ECC fleet patterns)
  └── docs/opencode-go.md (OpenCode Go plan details)
```

---

## Task Template

```markdown
- [ ] **Task title**
  - Depends on: (task or none)
  - Acceptance: (how to verify it's done)
```
