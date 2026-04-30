# Skill: Minimal Architecture Review

A lightweight architecture review skill — simpler than the full agent-skills version.

## When to Use

**Trigger**: `/arch-review` or when you've been building for a few hours.

**Applies to**: Any project that's more than a few files.

**Frequency**: Run weekly or after any significant feature.

---

## Workflow

### Step 1: Survey the Structure
1. List all top-level directories and their purposes
2. Count files per directory
3. Identify any directories with >20 files (potential monoliths)

### Step 2: Check Module Boundaries
1. For each major module, list its exports
2. Check: does any module import internals from another module?
3. Flag any circular dependencies

### Step 3: Deep Module Check
For the 3 most-changed files (check git log):
1. Are they "deep modules" (simple interface, complex internals)?
2. Or "shallow modules" (complex interface, simple internals)?
3. Flag shallow modules for refactoring

### Step 4: Report
Output a structured report:
```
## Architecture Health Check

### Structure: [OK / NEEDS WORK]
- [Findings]

### Module Boundaries: [OK / NEEDS WORK]
- [Findings]

### Deep Modules: [OK / NEEDS WORK]
- [Findings]

### Recommended Actions
1. [Actionable item]
2. [Actionable item]
```

---

## Verification Gates

- [ ] All directories have clear, single responsibilities
- [ ] No module imports another module's internals
- [ ] No circular dependencies found
- [ ] Top 3 most-changed files are deep modules
- [ ] Report has actionable recommendations

---

## Anti-Patterns

| Don't | Why | Do Instead |
|-------|-----|------------|
| Rewrite everything | Destabilizes the codebase | Make small, targeted improvements |
| Add abstractions preemptively | YAGNI — adds complexity | Only abstract when you have 3+ concrete cases |
| Move files just for aesthetics | Breaks git blame and imports | Only reorganize when structure causes real problems |
| Ignore the report | Architecture rot accelerates | Fix at least one item before next session |

---

## Reference

- John Ousterhout, "A Philosophy of Software Design" (deep vs shallow modules)
- Kent Beck, "Extreme Programming Explained" (incremental design)
