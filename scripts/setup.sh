#!/usr/bin/env bash
# setup.sh — Bootstrap your minimal agentic workflow
# Run: source setup.sh (or ./setup.sh if executable)

set -e

echo "============================================"
echo "  Minimal Agentic Workflow — Setup"
echo "============================================"
echo ""

# --- Colors ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

info()  { echo -e "${BLUE}[INFO]${NC} $1"; }
ok()    { echo -e "${GREEN}[OK]${NC} $1"; }
warn()  { echo -e "${YELLOW}[WARN]${NC} $1"; }
err()   { echo -e "${RED}[ERR]${NC} $1"; }

# --- Check prerequisites ---
echo "--- Checking prerequisites ---"

# Git
if command -v git &> /dev/null; then
    ok "git found: $(git --version | head -1)"
else
    err "git is required. Install from https://git-scm.com"
    exit 1
fi

# Node.js (for pi, npm packages)
if command -v node &> /dev/null; then
    ok "node found: $(node --version)"
else
    warn "node not found — some tools may not work"
    warn "Install from https://nodejs.org (v18+)"
fi

# npm
if command -v npm &> /dev/null; then
    ok "npm found: $(npm --version)"
else
    warn "npm not found"
fi

echo ""

# --- Step 1: Install Pi (coding agent) ---
echo "--- Step 1: Coding Agent ---"
echo ""
echo "Choose your coding agent:"
echo "  [1] Pi (pi-mono) — TUI, multi-agent support, extensible"
echo "  [2] OpenCode — CLI, LSP-enabled, desktop app available"
echo "  [3] Skip — I already have one"
echo ""

read -p "Choice [1-3]: " agent_choice

case $agent_choice in
    1)
        info "Installing Pi coding agent..."
        if command -v npm &> /dev/null; then
            npm install -g @mariozechner/pi-coding-agent && ok "Pi installed"
        else
            err "npm is required to install Pi"
        fi
        ;;
    2)
        info "Visit https://opencode.ai to download OpenCode for your platform"
        info "Available as: terminal CLI, desktop app, and IDE extension"
        ;;
    3)
        info "Skipping agent install"
        ;;
    *)
        warn "Invalid choice, skipping"
        ;;
esac

echo ""

# --- Step 2: Install Skills ---
echo "--- Step 2: Skills ---"
echo ""

info "Cloning agent-skills (addyosmani)..."
if [ -d "$HOME/.agent-skills" ]; then
    warn "~/.agent-skills already exists, skipping"
else
    git clone https://github.com/addyosmani/agent-skills.git "$HOME/.agent-skills" && \
        ok "agent-skills installed to ~/.agent-skills"
fi

info "Installing mattpocock/skills..."
if command -v npx &> /dev/null; then
    npx skills@latest add mattpocock/skills && \
        ok "mattpocock/skills installed"
else
    warn "npx not found. Clone manually:"
    warn "  git clone https://github.com/mattpocock/skills.git ~/.mattpocock-skills"
fi

echo ""

# --- Step 3: Install agent-pi (multi-agent) ---
echo "--- Step 3: Multi-Agent Extensions (agent-pi) ---"
echo ""

if command -v pi &> /dev/null; then
    info "Installing agent-pi extensions for Pi..."
    pi install git:github.com/ruizrica/agent-pi && \
        ok "agent-pi installed"
else
    warn "Pi not found. Install Pi first, then run:"
    warn "  pi install git:github.com/ruizrica/agent-pi"
fi

echo ""

# --- Step 4: Project-level config ---
echo "--- Step 4: Project Configuration ---"
echo ""

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Copy AGENTS.md template to current project if not exists
if [ -f "AGENTS.md" ]; then
    warn "AGENTS.md already exists in current directory"
else
    if [ -f "$SCRIPT_DIR/configs/AGENTS.md" ]; then
        cp "$SCRIPT_DIR/configs/AGENTS.md" ./AGENTS.md
        ok "AGENTS.md created — edit it with your project details"
    fi
fi

# Create .context directory
if [ ! -d ".context" ]; then
    mkdir -p .context
    ok ".context/ directory created"
fi

# Copy CONTEXT.md template
if [ ! -f ".context/CONTEXT.md" ]; then
    if [ -f "$SCRIPT_DIR/configs/CONTEXT.md" ]; then
        cp "$SCRIPT_DIR/configs/CONTEXT.md" .context/CONTEXT.md
        ok ".context/CONTEXT.md created — edit with your project's shared language"
    fi
fi

echo ""

# --- Step 5: LLM Configuration ---
echo "--- Step 5: LLM Provider ---"
echo ""

echo "Set up your LLM access. Options:"
echo ""
echo "  [1] GitHub Copilot — \$10/mo, best value"
echo "    → Log in with GitHub in Pi or OpenCode"
echo ""
echo "  [2] Anthropic API — pay-as-you-go"
echo "    → export ANTHROPIC_API_KEY='sk-ant-...'"
echo ""
echo "  [3] OpenAI API — pay-as-you-go"
echo "    → export OPENAI_API_KEY='sk-...'"
echo ""
echo "  [4] Google Gemini — free tier available"
echo "    → export GOOGLE_API_KEY='...'"
echo ""
echo "  [5] Ollama (local) — completely free"
echo "    → Install from https://ollama.com"
echo "    → ollama pull qwen2.5-coder:7b"
echo ""

read -p "Which provider? [1-5, or Enter to skip]: " llm_choice

case $llm_choice in
    1) info "Use 'pi --auth' or opencode login to connect GitHub Copilot" ;;
    2) info "Set your key: export ANTHROPIC_API_KEY='sk-ant-...'" ;;
    3) info "Set your key: export OPENAI_API_KEY='sk-...'" ;;
    4) info "Set your key: export GOOGLE_API_KEY='...'" ;;
    5) info "Install Ollama: https://ollama.com" ;;
    *) info "Skipping LLM setup — configure later" ;;
esac

echo ""

# --- Done ---
echo "============================================"
echo -e "${GREEN}  Setup Complete!${NC}"
echo "============================================"
echo ""
echo "Next steps:"
echo "  1. Edit AGENTS.md with your project details"
echo "  2. Edit .context/CONTEXT.md with your shared language"
echo "  3. Start your agent:  pi   or   opencode"
echo "  4. Run /grill-me on your first task"
echo ""
echo "Docs: https://github.com/YOU/minimal-agentic-workflow"
echo ""
