#!/usr/bin/env bash
# Run inside Ubuntu proot — copy files from Termux home to Ubuntu home.
set -euo pipefail

TERMUX_HOME="/data/data/com.termux/files/home"

usage() {
  echo "Usage: $0 <filename> [dest]"
  echo ""
  echo "Copies a file from Termux home to Ubuntu home."
  echo "  $0 cursor.sh"
  echo "  $0 cursor.sh ~/cursor.sh"
  exit 1
}

[ $# -lt 1 ] && usage

SRC="$TERMUX_HOME/$1"
DEST="${2:-$HOME/$(basename "$1")}"

if [ ! -f "$SRC" ]; then
  echo "Error: $SRC not found."
  echo "The file must exist in Termux home, not Ubuntu home."
  exit 1
fi

cp "$SRC" "$DEST"
chmod +x "$DEST" 2>/dev/null || true
echo "Copied: $SRC -> $DEST"
