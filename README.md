# Cursor Android Toolkit

Scripts and docs to run **Cursor IDE** and **Cursor CLI** (`agent`) on rooted Android via **Termux + Ubuntu proot**.

## Requirements

- Android 10+ (ARM64 recommended)
- 4GB+ RAM
- Termux from [F-Droid](https://f-droid.org/en/packages/com.termux/)
- Termux:X11 for GUI (optional, for Cursor IDE)

## Quick install

```bash
# In Termux
pkg update && pkg upgrade -y
git clone https://github.com/axe01010/cursor-android-toolkit.git
cd cursor-android-toolkit
bash scripts/install-termux.sh
```

Then enter Ubuntu:

```bash
ubuntu
```

Inside Ubuntu:

```bash
bash ~/cursor-android-toolkit/scripts/setup-ubuntu.sh
```

## Scripts

| Script | Where | Purpose |
|--------|-------|---------|
| `scripts/install-termux.sh` | Termux | Install proot-distro, X11, clone toolkit |
| `scripts/setup-ubuntu.sh` | Ubuntu | Fix apt sources, install deps |
| `scripts/install-cursor-cli.sh` | Ubuntu | Install Cursor CLI (`agent`) |
| `scripts/install-cursor-gui.sh` | Ubuntu | Install Cursor desktop IDE |
| `scripts/copy-from-termux.sh` | Ubuntu | Copy files from Termux home |
| `scripts/start-x11.sh` | Termux | Start Termux:X11 display |

## Fix apt sources (Ubuntu resolute ARM)

```bash
sudo tee /etc/apt/sources.list > /dev/null <<'EOF'
deb http://ports.ubuntu.com/ubuntu-ports/ resolute main restricted universe multiverse
deb http://ports.ubuntu.com/ubuntu-ports/ resolute-updates main restricted universe multiverse
deb http://ports.ubuntu.com/ubuntu-ports/ resolute-backports main restricted universe multiverse
deb http://ports.ubuntu.com/ubuntu-ports/ resolute-security main restricted universe multiverse
EOF
sudo rm -rf /etc/apt/sources.list.d/*
sudo apt update
```

## Copy files Termux → Ubuntu

```bash
# Inside Ubuntu — NOT from Termux home via ~
cp /data/data/com.termux/files/home/<file> ~/<file>
```

## Cursor CLI

```bash
curl https://cursor.com/install -fsS | bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
agent login
```

## Cursor GUI (with X11)

```bash
# Termux: start X11
export DISPLAY=:0
termux-x11 :0 &

# Ubuntu
export DISPLAY=:0
cursor --no-sandbox
```

## Related projects

- [skills-orchestrator](https://github.com/axe01010/skills-orchestrator) — Cursor skills for Android dev
- [nothing-phone-bootloop-recovery](https://github.com/axe01010/nothing-phone-bootloop-recovery) — Android recovery guide

## License

MIT
