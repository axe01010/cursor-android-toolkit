# 🤖 Cursor AI on Android

<p align="center">
  <img src="https://img.shields.io/badge/Cursor-IDE-blue?style=for-the-badge&logo=cursor&logoColor=white" />
  <img src="https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white" />
  <img src="https://img.shields.io/badge/Termux-000000?style=for-the-badge&logo=linux&logoColor=white" />
  <img src="https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white" />
</p>

> Run **Cursor IDE** with full AI-agent capabilities directly on your Android phone — no PC required.

## ✨ Features

- 🚀 One-command installer (Termux + Ubuntu proot + Cursor CLI)
- 🤖 Full AI-agent support (Cursor agents, Composer, Chat)
- 📱 Works on rooted AND non-rooted Android devices
- 🐧 Full Ubuntu environment via proot (no root needed)
- ⚡ Optimized for ARM64 phones (Snapdragon, MediaTek, Exynos)
- 🔧 Auto-detects device specs and configures accordingly

## 📸 Demo

![Demo](demo.gif) <!-- Add a screen recording of Cursor running on your phone -->

## 🚀 Quick Start

```bash
# Clone this repo
git clone https://github.com/axe01010/cursor-android-toolkit.git
cd cursor-android-toolkit

# Run the installer
bash install.sh
```

The installer will:
1. Set up Termux packages (git, curl, wget, proot)
2. Download and configure Ubuntu 22.04 rootfs
3. Install Cursor CLI inside proot
4. Configure AI model endpoints (free models supported)
5. Launch Cursor

## 📋 Requirements

| Requirement | Details |
|-------------|---------|
| **Device** | Android 10+ (ARM64) |
| **Storage** | ~2GB free |
| **RAM** | 4GB+ recommended |
| **Termux** | Install from [F-Droid](https://f-droid.org/packages/com.termux/) (NOT Play Store) |
| **Network** | Stable internet for initial setup |

## 🛠️ Manual Setup (if installer fails)

```bash
# 1. Install Termux from F-Droid
# 2. Update packages
pkg update && pkg upgrade -y

# 3. Install dependencies
pkg install -y git curl wget proot-distro

# 4. Install Ubuntu
proot-distro install ubuntu

# 5. Login to Ubuntu
proot-distro login ubuntu

# 6. Inside Ubuntu, install Cursor CLI
curl -fsSL https://cursor.sh/install.sh | bash

# 7. Configure Cursor
cursor config
```

## 📁 Repository Structure

```
cursor-android-toolkit/
├── install.sh          # One-command installer
├── config/
│   ├── cursor.json     # Cursor configuration template
│   └── models.json     # Free model endpoints config
├── scripts/
│   ├── setup.sh        # Environment setup
│   ├── backup.sh       # Backup/restore
│   └── health-check.sh # Diagnostic tools
├── docs/
│   ├── TROUBLESHOOTING.md
│   └── ADVANCED.md
├── CONTRIBUTING.md
├── LICENSE
└── README.md
```

## 🤝 Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). Contributions welcome:
- Bug reports & fixes
- Device-specific tweaks
- New installer scripts
- Documentation improvements

## 📜 License

MIT License - see [LICENSE](LICENSE)

---

<p align="center">
  Built with ❤️ by <a href="https://github.com/axe01010">axe git</a> · Powered by Cursor AI
</p>
