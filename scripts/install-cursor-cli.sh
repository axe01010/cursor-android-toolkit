#!/usr/bin/env bash
# Run inside Ubuntu proot — installs Cursor CLI (agent command).
set -euo pipefail

echo "==> Installing Cursor CLI"
curl https://cursor.com/install -fsS | bash

if ! grep -q 'HOME/.local/bin' "$HOME/.bashrc" 2>/dev/null; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
fi

export PATH="$HOME/.local/bin:$PATH"

echo ""
echo "==> Verifying installation"
if command -v agent >/dev/null 2>&1; then
  agent --version || true
else
  echo "Warning: 'agent' not found in PATH. Run: source ~/.bashrc"
fi

echo ""
echo "Done. Run: agent login"
