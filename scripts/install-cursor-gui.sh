#!/usr/bin/env bash
# Run inside Ubuntu proot — installs Cursor desktop IDE (requires Termux:X11).
set -euo pipefail

echo "==> Installing Cursor desktop IDE"
curl https://cursor.com/install -fsS | bash

if ! grep -q 'HOME/.local/bin' "$HOME/.bashrc" 2>/dev/null; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
fi

export PATH="$HOME/.local/bin:$PATH"

echo ""
echo "==> GUI setup"
echo "Before launching Cursor GUI:"
echo "  1. In Termux, run: bash ~/cursor-android-toolkit/scripts/start-x11.sh"
echo "  2. In Ubuntu, set: export DISPLAY=:0"
echo "  3. Launch: cursor --no-sandbox"
