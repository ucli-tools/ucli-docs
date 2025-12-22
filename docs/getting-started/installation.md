# Installation Guide

This guide will walk you through installing UCLI Tools on your system. The installation process is designed to be simple and reliable across different platforms.

## Quick Install (Recommended)

For most users, the quickest way to get started is using our automated installer:

```bash
# Download and run the installer
curl -fsSL https://install.ucli.tools | bash
```

This will:
- Detect your operating system
- Install the `ucli` tool manager
- Set up the necessary directories
- Configure your PATH

## Manual Installation

If you prefer to install manually or need more control over the process:

### Step 1: Download the ucli script

```bash
# Download the main ucli script
wget https://raw.githubusercontent.com/ucli-tools/ucli/main/ucli.sh
# or
curl -O https://raw.githubusercontent.com/ucli-tools/ucli/main/ucli.sh
```

### Step 2: Make it executable

```bash
chmod +x ucli.sh
```

### Step 3: Install system-wide

```bash
# Install to /usr/local/bin (requires sudo)
sudo ./ucli.sh install

# Or install to user directory
./ucli.sh install --user
```

### Step 4: Verify installation

```bash
# Check if ucli is available
ucli --version

# Display help
ucli help
```

## Platform-Specific Instructions

### Linux (Ubuntu/Debian)

```bash
# Install system dependencies
sudo apt update
sudo apt install -y curl git make

# Install UCLI Tools
curl -fsSL https://install.ucli.tools | bash
```

### Linux (Fedora/CentOS/RHEL)

```bash
# Install system dependencies
sudo dnf install -y curl git make
# or for CentOS/RHEL
sudo yum install -y curl git make

# Install UCLI Tools
curl -fsSL https://install.ucli.tools | bash
```

### Linux (Arch Linux)

```bash
# Install system dependencies
sudo pacman -S curl git make

# Install UCLI Tools
curl -fsSL https://install.ucli.tools | bash
```

### macOS

```bash
# Install Homebrew (if not already installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install system dependencies
brew install curl git make

# Install UCLI Tools
curl -fsSL https://install.ucli.tools | bash
```

### Windows (via WSL)

UCLI Tools work best on Windows through WSL (Windows Subsystem for Linux):

```powershell
# Enable WSL in PowerShell (run as Administrator)
wsl --install

# Then follow Linux installation instructions in WSL terminal
```

### Windows (Native - Experimental)

Native Windows support is experimental. We recommend using WSL for the best experience.

```powershell
# Install prerequisites (using Chocolatey or manual install)
# Note: Native Windows support is limited
```

## Post-Installation Setup

### Verify Installation

```bash
# Check ucli version
ucli --version

# List available commands
ucli help

# Check for available tools
ucli list
```

### Environment Configuration

The installer automatically configures your PATH, but you may need to restart your terminal or source your shell configuration:

```bash
# For bash users
source ~/.bashrc

# For zsh users
source ~/.zshrc

# For fish users
source ~/.config/fish/config.fish
```

### Optional: Enable Shell Completion

Some tools support shell completion. Enable it for better productivity:

```bash
# For bash
echo 'source <(ucli completion bash)' >> ~/.bashrc

# For zsh
echo 'source <(ucli completion zsh)' >> ~/.zshrc

# For fish
echo 'ucli completion fish > ~/.config/fish/completions/ucli.fish' >> ~/.config/fish/config.fish
```

## Installing Individual Tools

Once `ucli` is installed, you can install individual tools:

```bash
# Install popular tools
ucli build gits mdtexpdf mdaudiobook

# Install specific tool
ucli build gits

# Install multiple tools at once
ucli build gits mdtexpdf

# List all available tools
ucli list
```

## Troubleshooting Installation

### Common Issues

#### Command not found after installation

```bash
# Check if ucli is in PATH
which ucli

# If not found, check installation directory
ls -la /usr/local/bin/ucli

# Add to PATH manually
export PATH="/usr/local/bin:$PATH"
```

#### Permission denied during installation

```bash
# The installer needs sudo access for system-wide installation
# Run with sudo if needed
sudo curl -fsSL https://install.ucli.tools | bash
```

#### Network connectivity issues

```bash
# Check internet connection
curl -I https://install.ucli.tools

# Try alternative download method
wget -qO- https://install.ucli.tools | bash
```

#### Old version cached

```bash
# Clear any cached versions
hash -r  # Clear command hash cache

# Reinstall if needed
ucli self-update
```

### Getting Help

If you encounter issues:

1. **Check the troubleshooting guide** - [Common Issues](../guides/troubleshooting.md)
2. **Search existing issues** - [GitHub Issues](https://github.com/ucli-tools/ucli/issues)
3. **Ask the community** - [Community Discussions](https://github.com/orgs/ucli-tools/discussions)

### System Requirements Check

Run our requirements checker:

```bash
# Check system compatibility
ucli check-requirements

# Or manually verify
curl --version
git --version
make --version
```

## Uninstalling UCLI Tools

To remove UCLI Tools from your system:

```bash
# Uninstall ucli (removes tool manager)
ucli uninstall

# Or manual removal
sudo rm /usr/local/bin/ucli
sudo rm -rf /usr/local/share/ucli
```

Note: Individual tools are installed separately and may need to be removed individually.

## Next Steps

With UCLI Tools installed, you're ready to:

1. **[Explore Available Tools](../tools/)** - See what tools are available
2. **[Quick Start Guide](quickstart.md)** - Get up and running quickly
3. **[Configuration Guide](../reference/configuration.md)** - Customize your setup

---

**Installation complete?** Continue to the [Quick Start Guide](quickstart.md).
