#!/usr/bin/env bash
# Run in Termux — installs proot-distro, Termux:X11, and clones this toolkit.
set -euo pipefail

TOOLKIT_REPO="${TOOLKIT_REPO:-https://github.com/axe01010/cursor-android-toolkit.git}"
TOOLKIT_DIR="${TOOLKIT_DIR:-$HOME/cursor-android-toolkit}"

echo "==> Updating Termux packages"
pkg update && pkg upgrade -y

echo "==> Installing dependencies"
pkg install -y git curl wget proot-distro x11-repo termux-x11-nightly

echo "==> Installing Ubuntu via proot-distro"
if ! proot-distro list | grep -q "ubuntu"; then
  proot-distro install ubuntu
fi

echo "==> Cloning cursor-android-toolkit"
if [ -d "$TOOLKIT_DIR/.git" ]; then
  git -C "$TOOLKIT_DIR" pull --ff-only
else
  git clone "$TOOLKIT_REPO" "$TOOLKIT_DIR"
fi

echo ""
echo "Done. Next steps:"
echo "  1. Run: ubuntu"
echo "  2. Inside Ubuntu: bash ~/cursor-android-toolkit/scripts/setup-ubuntu.sh"
