# ucli - Universal Command Line Interface Tool

[![Status: Production Ready](https://img.shields.io/badge/status-production%20ready-green.svg)](https://docs.ucli.tools)
[![License: Apache 2.0](https://img.shields.io/badge/license-Apache%202.0-blue.svg)](https://github.com/ucli-tools/ucli/blob/main/LICENSE)

The `ucli` tool is the central command-line interface for managing all UCLI Tools. It provides a unified way to install, update, and manage the entire UCLI Tools ecosystem.

## Overview

`ucli` is a bash script designed for Ubuntu (and compatible systems) to simplify the process of building and managing tools from the UCLI Tools organization on GitHub. It provides an interactive menu and command-line interface with authentication via environment variables.

## Key Features

- **Interactive Mode** - User-friendly menu for easy navigation and tool building
- **Command-Line Mode** - Execute specific commands programmatically
- **GitHub Integration** - Clones repositories from GitHub with makefile support
- **Authentication** - Supports GitHub organization authentication
- **Error Handling** - Robust error handling with informative messages
- **Color-Coded Output** - Improved readability with ANSI color codes
- **Temporary Directories** - Safe cloning with automatic cleanup

## Installation

### Quick Install

```bash
# Download and install ucli
curl -fsSL https://install.ucli.tools | bash

# Verify installation
ucli --version
```

### Manual Install

```bash
# Download the script
wget https://raw.githubusercontent.com/ucli-tools/ucli/main/ucli.sh
chmod +x ucli.sh

# Install system-wide
sudo ./ucli.sh install

# Or install to user directory
./ucli.sh install --user
```

## Usage

### Interactive Mode

Run `ucli` without arguments to enter the interactive menu:

```bash
ucli
```

The interactive menu provides options to:
- Login to your GitHub organization
- Build and install tools
- Logout from your organization
- Exit the tool

### Command-Line Mode

`ucli` supports various command-line options for automation:

#### Core Commands

```bash
ucli install          # Install ucli system-wide
ucli uninstall        # Remove ucli from system
ucli login            # Login to GitHub organization
ucli logout           # Logout from organization
ucli list             # List public repos in organization
ucli help             # Show help information
ucli build <repo>     # Build specific repository
```

#### Tool Management

```bash
# Install individual tools
ucli build gits
ucli build mdtexpdf
ucli build mdaudiobook

# Install multiple tools
ucli build gits mdtexpdf mdaudiobook

# Update all tools
ucli update

# List available tools
ucli list
```

## Authentication Setup

### Organization Login

Before building tools, you need to authenticate with your GitHub organization:

```bash
ucli login
```

This will:
1. Prompt for your GitHub organization name
2. Store the organization in the `ORG` environment variable
3. Enable access to private repositories (if applicable)

### Environment Variables

`ucli` uses the following environment variables:

- `ORG` - Your GitHub organization name (set by `ucli login`)
- `GITHUB_TOKEN` - Optional GitHub personal access token for private repos

## Tool Building Process

When you run `ucli build <tool>`, the following happens:

1. **Validation** - Checks if you're logged in and tool exists
2. **Cloning** - Downloads the repository to `/tmp/code/github.com/<org>/<repo>`
3. **Dependencies** - Checks for required build tools (make, gcc, etc.)
4. **Building** - Runs `make` in the repository root
5. **Installation** - Installs the tool system-wide
6. **Cleanup** - Removes temporary files

### Example Build Process

```bash
$ ucli build gits
🔍 Checking prerequisites...
✅ Git is available
✅ Make is available
🔄 Cloning repository...
📁 Cloning ucli-tools/gits to /tmp/code/github.com/ucli-tools/gits
✅ Repository cloned successfully
🔨 Building tool...
📦 Running make install...
✅ Tool built and installed successfully
🧹 Cleaning up temporary files...
✅ Build complete! Tool 'gits' is ready to use.
```

## Prerequisites

`ucli` requires the following system tools:

- **bash** - Shell environment (most Unix-like systems)
- **git** - Version control system
- **curl** or **wget** - For downloading scripts
- **make** - Build system (optional, for building tools)

### Installing Prerequisites

#### Ubuntu/Debian
```bash
sudo apt update
sudo apt install -y git make curl
```

#### macOS
```bash
brew install git make curl
```

#### Other Systems
Check your package manager for equivalent packages.

## Configuration

### Default Settings

`ucli` uses sensible defaults but can be configured:

- **Organization**: Set via `ucli login`
- **Install Directory**: `/usr/local/bin` (system) or `~/.local/bin` (user)
- **Temp Directory**: `/tmp/code/github.com/`
- **Color Output**: Enabled by default

### Custom Configuration

Create a configuration file at `~/.config/ucli/config`:

```bash
# Example configuration
INSTALL_DIR="/usr/local/bin"
TEMP_DIR="/tmp/ucli-builds"
ENABLE_COLORS=true
DEFAULT_ORG="ucli-tools"
```

## Troubleshooting

### Common Issues

#### "Command not found" after installation

```bash
# Check if ucli is in PATH
which ucli

# Add to PATH manually
export PATH="/usr/local/bin:$PATH"

# Or restart your terminal
```

#### Build failures

```bash
# Check prerequisites
ucli check-prereqs

# Verify git access
git ls-remote https://github.com/ucli-tools/gits

# Check disk space
df -h
```

#### Authentication issues

```bash
# Re-login to organization
ucli logout
ucli login

# Check organization setting
echo $ORG
```

#### Permission denied

```bash
# For system-wide installation, use sudo
sudo ucli install

# Or install to user directory
ucli install --user
```

### Debug Mode

Enable verbose output for troubleshooting:

```bash
ucli --verbose build gits
```

### Getting Help

```bash
# Show all available commands
ucli help

# Get help for specific command
ucli build --help
```

## Examples

### Complete Setup Workflow

```bash
# 1. Install ucli
curl -fsSL https://install.ucli.tools | bash

# 2. Login to organization
ucli login
# Enter: ucli-tools

# 3. Install popular tools
ucli build gits mdtexpdf mdaudiobook

# 4. Verify installation
gits --version
mdtexpdf --version
mdaudiobook --version

# 5. List all available tools
ucli list
```

### CI/CD Integration

```bash
# Non-interactive installation
echo "ucli-tools" | ucli login
ucli build gits --quiet

# Check installation
which gits && echo "Installation successful"
```

### Development Workflow

```bash
# Update all tools
ucli update

# Rebuild specific tool after changes
ucli build gits --force

# Clean old builds
ucli clean
```

## Integration with Other Tools

### Shell Integration

Add to your shell configuration for convenience:

```bash
# ~/.bashrc or ~/.zshrc
alias ucli-tools="ucli"
alias install-tool="ucli build"
```

### IDE Integration

Many IDEs can be configured to use `ucli` commands:

- **VS Code**: Add tasks in `.vscode/tasks.json`
- **JetBrains IDEs**: Create external tools
- **Vim/Neovim**: Create custom commands

## Security Considerations

- `ucli` clones and builds code from GitHub
- Only install from trusted repositories
- Review makefiles before building
- Use GitHub tokens for private repositories
- Keep tools updated for security patches

## Contributing

To contribute to `ucli`:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

See our [Contributing Guide](../community/contributing.md) for details.

## Changelog

### Version 1.0.0
- Initial release
- Basic tool building functionality
- Interactive and command-line modes
- GitHub integration

### Version 1.1.0
- Added multi-tool installation
- Improved error handling
- Added color output
- Enhanced documentation

## Support

- **Documentation**: [docs.ucli.tools](https://docs.ucli.tools)
- **Issues**: [GitHub Issues](https://github.com/ucli-tools/ucli/issues)
- **Discussions**: [Community Forums](https://github.com/orgs/ucli-tools/discussions)

## License

Licensed under the Apache License 2.0. See [LICENSE](https://github.com/ucli-tools/ucli/blob/main/LICENSE) for details.

---

**Ready to install tools?** Try `ucli build gits` to get started!
