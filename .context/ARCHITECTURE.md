# Architecture Decision Records (ADRs)

> Lightweight decision tracking for this project.
> Record decisions that affect structure, dependencies, or workflow.

---

## ADR-001: Project Structure Aligned with README Spec

**Date**: 2025-07-01
**Status**: accepted

**Context**: The project had files scattered across `configs/` and missing referenced documents.
The README.md serves as the ground truth for what should exist and where.

**Decision**: Align project structure to match the documented conventions:
- `AGENTS.md` at project root
- `.context/` for shared knowledge (CONTEXT.md, ARCHITECTURE.md, todo.md)
- `docs/` for all documentation
- `agents/` for custom agent definitions
- `skills/` for custom skills
- `scripts/` for automation

**Consequences**:
- Positive: Single source of truth (README), consistent structure, discoverable files
- Negative: Minor path updates needed in scripts

---

## ADR-002: Minimal Dependencies

**Date**: 2025-07-01
**Status**: accepted

**Context**: This is a documentation-and-configuration project, not a software application.
Adding package.json, node_modules, or build tools would add maintenance burden with no benefit.

**Decision**: Keep the project dependency-free. No npm packages, no build steps. Plain markdown and shell scripts only.

**Consequences**:
- Positive: Zero maintenance, instant setup, no vulnerability surface
- Negative: No automation for linting/formatting (rely on editor defaults)

---

## ADR Template

```markdown
## ADR-NNN: [Decision Title]

**Date**: YYYY-MM-DD
**Status**: [proposed / accepted / deprecated / superseded]

**Context**: What was the situation?

**Decision**: What did we decide?

**Consequences**: What are the effects?
- Positive: ...
- Negative: ...
```
