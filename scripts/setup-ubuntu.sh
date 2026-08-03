#!/usr/bin/env bash
# Run inside Ubuntu proot — fixes apt sources and installs base dependencies.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOOLKIT_DIR="$(dirname "$SCRIPT_DIR")"

echo "==> Fixing apt sources for Ubuntu ARM (resolute)"
sudo tee /etc/apt/sources.list > /dev/null <<'EOF'
deb http://ports.ubuntu.com/ubuntu-ports/ resolute main restricted universe multiverse
deb http://ports.ubuntu.com/ubuntu-ports/ resolute-updates main restricted universe multiverse
deb http://ports.ubuntu.com/ubuntu-ports/ resolute-backports main restricted universe multiverse
deb http://ports.ubuntu.com/ubuntu-ports/ resolute-security main restricted universe multiverse
EOF

# Remove broken third-party sources (e.g. old Mozilla PPA, Debian buster)
sudo rm -rf /etc/apt/sources.list.d/*

echo "==> Updating package lists"
sudo apt update

echo "==> Installing base dependencies"
sudo apt install -y \
  curl wget git ca-certificates \
  libgtk-3-0 libnotify4 libnss3 libxss1 libasound2 \
  libxtst6 libdrm2 libgbm1 libx11-xcb1 libxcb-dri3-0 \
  xdg-utils

echo ""
echo "Done. Next steps:"
echo "  CLI:  bash $TOOLKIT_DIR/scripts/install-cursor-cli.sh"
echo "  GUI:  bash $TOOLKIT_DIR/scripts/install-cursor-gui.sh  (requires Termux:X11)"
