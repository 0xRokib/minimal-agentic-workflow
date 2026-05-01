---
description: Apply a DESIGN.md design system to the current project
agent: build
---

# Design Command

Apply a DESIGN.md from awesome-design-md to generate or refactor UI that matches a real-world design system.

## Arguments

```
/design <site-name-or-url>
```

Examples:
- `/design linear` → Fetch Linear.app DESIGN.md
- `/design https://getdesign.md/vercel/design-md` → Direct URL
- `/design` → Use existing DESIGN.md in project root

## Your Task

1. **Locate DESIGN.md**
   - If argument is a short name (e.g. `linear`), fetch `https://getdesign.md/<name>/design-md`
   - If argument is a URL, fetch it directly
   - If no argument, read `./DESIGN.md` from project root
   - Save fetched file as `./DESIGN.md` if not already present

2. **Parse Tokens**
   - Extract Color Palette (semantic names + hex + roles)
   - Extract Typography (font families, hierarchy table)
   - Extract Component Stylings (buttons, cards, inputs, nav)
   - Extract Layout Principles (spacing scale, grid)
   - Extract Depth & Elevation (shadows)
   - Extract Do's and Don'ts

3. **Apply to Codebase**
   - Map colors to CSS variables / Tailwind theme / styled-components theme
   - Map typography to font rules
   - Map spacing to scale
   - Refactor existing components to match spec
   - Build new components using extracted tokens

4. **Verify Match**
   - All colors from palette used correctly (no stray hex)
   - Typography hierarchy matches spec
   - Component states (hover, active, disabled) correct
   - Spacing follows the scale

## Output

- Updated `./DESIGN.md` (if fetched)
- Theme config file (e.g. `tailwind.config.ts`, `theme.ts`, `variables.css`)
- Refactored or new components matching the design system

## Reference

- Skill: `skills/design-md/SKILL.md`
- Source: [VoltAgent/awesome-design-md](https://github.com/VoltAgent/awesome-design-md)
