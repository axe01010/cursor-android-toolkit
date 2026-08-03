#!/usr/bin/env bash
# Run in Termux — starts Termux:X11 display server.
set -euo pipefail

export DISPLAY=:0

if ! pgrep -f "termux-x11" >/dev/null 2>&1; then
  echo "==> Starting Termux:X11 on DISPLAY=:0"
  termux-x11 :0 &
  sleep 2
else
  echo "Termux:X11 already running."
fi

echo "DISPLAY=:0 is ready."
echo "Open Termux:X11 app on your phone, then in Ubuntu run:"
echo "  export DISPLAY=:0"
echo "  cursor --no-sandbox"
