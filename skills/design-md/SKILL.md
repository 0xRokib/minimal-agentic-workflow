# Skill: design-md

> Use a DESIGN.md file to generate pixel-perfect UI that matches a real-world design system.
> Source: [VoltAgent/awesome-design-md](https://github.com/VoltAgent/awesome-design-md)

---

## When to Use

- Trigger: `/design <site-name>` or when user says "make it look like X"
- Applies to: Any frontend work — React, Vue, HTML/CSS, native apps
- Requires: A `DESIGN.md` file in project root or fetched from getdesign.md

---

## Workflow

### Step 1: Acquire DESIGN.md

1. Check if `DESIGN.md` already exists in project root
2. If not, fetch from `https://getdesign.md/<site>/design-md`
   - Example: `https://getdesign.md/linear.app/design-md`
3. Save as `DESIGN.md` in project root

### Step 2: Read and Parse

Read the full `DESIGN.md`. Extract these sections:

| Section | What to capture |
| ------- | --------------- |
| Visual Theme & Atmosphere | Mood, density, design philosophy |
| Color Palette & Roles | Semantic names + hex + functional roles |
| Typography Rules | Font families, full hierarchy table |
| Component Stylings | Buttons, cards, inputs, navigation with states |
| Layout Principles | Spacing scale, grid, whitespace philosophy |
| Depth & Elevation | Shadow system, surface hierarchy |
| Do's and Don'ts | Design guardrails and anti-patterns |

### Step 3: Apply to Implementation

1. Before writing any UI code, re-read `DESIGN.md` Color and Typography sections
2. Map design tokens to code:
   - Colors → CSS variables / Tailwind config / theme object
   - Typography → font-family, font-size, font-weight, line-height, letter-spacing
   - Spacing → margin/padding scale
   - Shadows → box-shadow / elevation tokens
3. Build components using extracted tokens — never hardcode one-off values
4. Reference Component Stylings section for button/card/input exact specs

### Step 4: Verify Visual Match

- [ ] Color values match hex codes in palette
- [ ] Font stacks match Typography section
- [ ] Spacing follows the scale (don't invent new gaps)
- [ ] Component states (hover, active, disabled) match spec
- [ ] No design tokens left unused or overridden arbitrarily

---

## Verification Gates

- [ ] Gate 1: `DESIGN.md` exists in project root and is readable
- [ ] Gate 2: All colors used in UI are defined in the palette (no magic hex)
- [ ] Gate 3: Typography hierarchy matches the spec (H1–H6, body, caption, etc.)
- [ ] Gate 4: Components match the DESIGN.md Component Stylings section

---

## Anti-Patterns

| Don't | Why | Do Instead |
| ----- | --- | ---------- |
| Ignore DESIGN.md and design from scratch | Defeats the purpose — the file is the spec | Read it first, implement second |
| Hardcode colors that exist in the palette | Creates drift from the system | Use the semantic color token |
| Mix multiple DESIGN.md files without merging | Conflicting tokens break consistency | Pick one primary DESIGN.md per project |
| Skip the Do's and Don'ts section | Guards exist for a reason | Follow them explicitly |

---

## Agent Setup

### Pi

Copy this skill to Pi's skill directory:

```bash
cp -r skills/design-md ~/.pi/skills/
```

Or add to `.pi/settings.yaml`:

```yaml
skills_paths:
  - ~/.agent-skills/skills
  - ~/.mattpocock-skills
  - ./skills
```

The `./skills/` path already includes `design-md/` if it's in your project.

### OpenCode (Codex)

Add to `opencode.json` instructions or load this skill on session start.

---

## Reference

- [awesome-design-md repository](https://github.com/VoltAgent/awesome-design-md)
- [Google Stitch DESIGN.md format](https://stitch.withgoogle.com/docs/design-md/overview/)
- [getdesign.md](https://getdesign.md/)
