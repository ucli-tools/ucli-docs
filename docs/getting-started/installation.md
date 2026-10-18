# Installation Guide

This guide will walk you through installing UCLI Tools on your system. The installation process is designed to be simple and reliable across different platforms.

## Quick Install (Recommended)

For most users, the quickest way to get started is using our automated installer:

```bash
# Download and run the installer
curl -fsSL https://install.ucli.tools/install.sh | bash
```

You need `curl`, `git`, `make` and `bash` installed. `ucli` is a bash script, so install bash first if you lack it.

The installer:

- Checks that `curl`, `git`, `make` and `bash` are present, and says what to install if one is missing
- Reads the commit the registry pins for `ucli` and fetches exactly that commit from github.com/ucli-tools/ucli
- Builds it with `make build` and puts `ucli` in `~/.local/bin`
- Tells you if `~/.local/bin` is not on your PATH, with the line to add for bash, zsh or fish
- Stops on native Windows and points you to WSL

A new install never asks for sudo. If `ucli` is already in `/usr/local/bin`, it is updated there, which may ask for your password. Run `ucli install --move` to move it to `~/.local/bin`.

## Manual Installation

If you prefer to install manually or need more control over the process:

### Step 1: Get the source

```bash
git clone https://github.com/ucli-tools/ucli.git
cd ucli
```

This gives you the latest `main`. The quick installer builds the commit the registry pins instead; to match it, run `git checkout <commit>` first.

### Step 2: Build and install

```bash
# Installs to ~/.local/bin (no sudo needed)
make build
```

If you already have ucli in `/usr/local/bin`, it is updated there (sudo is used only if that directory is not writable). To move it to `~/.local/bin`, run `ucli install --move`.

If `ucli` is not found afterwards, add `~/.local/bin` to your PATH (macOS does not have it there by default). ucli prints these lines when it is missing:

```bash
# bash (macOS: ~/.bash_profile)
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc

# zsh
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc

# fish
fish_add_path ~/.local/bin
```

### Step 3: Verify installation

```bash
# Check that ucli runs
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
curl -fsSL https://install.ucli.tools/install.sh | bash
```

### Linux (Fedora/CentOS/RHEL)

```bash
# Install system dependencies
sudo dnf install -y curl git make
# or for CentOS/RHEL
sudo yum install -y curl git make

# Install UCLI Tools
curl -fsSL https://install.ucli.tools/install.sh | bash
```

### Linux (Arch Linux)

```bash
# Install system dependencies
sudo pacman -S curl git make

# Install UCLI Tools
curl -fsSL https://install.ucli.tools/install.sh | bash
```

### macOS

```bash
# Install Homebrew (if not already installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install system dependencies
brew install curl git make

# Install UCLI Tools
curl -fsSL https://install.ucli.tools/install.sh | bash
```

### Windows (via WSL)

UCLI Tools work best on Windows through WSL (Windows Subsystem for Linux):

```powershell
# Enable WSL in PowerShell (run as Administrator)
wsl --install

# Then follow Linux installation instructions in WSL terminal
```

### Windows (native)

Native Windows is not supported. The installer stops and points you to WSL. Use the WSL steps above.

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

The installer does not edit your shell files. If `~/.local/bin` is not on your PATH it prints the line to add. After adding it, restart your terminal or source your shell configuration:

```bash
# For bash users
source ~/.bashrc

# For zsh users
source ~/.zshrc

# For fish users
source ~/.config/fish/config.fish
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
ls -la ~/.local/bin/ucli

# Add to PATH manually
export PATH="$HOME/.local/bin:$PATH"
```

#### Permission denied during installation

ucli installs to `~/.local/bin` and needs no sudo. Make sure the directory exists and is writable:

```bash
mkdir -p ~/.local/bin
```

A copy in `/usr/local/bin` is updated in place (with sudo). Move it with `ucli install --move`.

#### Network connectivity issues

```bash
# Check internet connection
curl -I https://install.ucli.tools

# Try alternative download method
wget -qO- https://install.ucli.tools/install.sh | bash
```

#### Old version cached

```bash
# Clear any cached versions
hash -r  # Clear command hash cache

# Reinstall if needed: run the installer again
curl -fsSL https://install.ucli.tools/install.sh | bash
```

### Getting Help

If you encounter issues:

1. **Search existing issues** - [GitHub Issues](https://github.com/ucli-tools/ucli/issues)
2. **Ask the community** - [Community Discussions](https://github.com/ucli-tools/community/discussions)

### System Requirements Check

Check that the required tools are installed:

```bash
curl --version
git --version
make --version
bash --version
```

If you already have `ucli`, `ucli prereq` installs the build prerequisites.

## Uninstalling UCLI Tools

To remove UCLI Tools from your system:

```bash
ucli remove <tool>      # for each installed tool, first
ucli uninstall          # removes ucli, ~/.ucli_env, ~/.ucli, its state and build cache
```

Tools are left in place by `uninstall`; remove them with `ucli remove` first.

An old system copy, if you still have one, can be removed with `sudo rm /usr/local/bin/ucli`.

## Next Steps

With UCLI Tools installed, you're ready to:

1. **[Explore Available Tools](../tools/ucli.md)** - See what tools are available
2. **Build your first tool** - Run `ucli build gits`

---

**Installation complete?** Continue to the [tool pages](../tools/ucli.md).
