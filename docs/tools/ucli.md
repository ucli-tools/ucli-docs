# ucli - Universal Command Line Interface Tool

[![Status: Production Ready](https://img.shields.io/badge/status-production%20ready-green.svg)](https://docs.ucli.tools)
[![License: Apache 2.0](https://img.shields.io/badge/license-Apache%202.0-blue.svg)](https://github.com/ucli-tools/ucli/blob/main/LICENSE)

The `ucli` tool is the central command-line interface for managing all UCLI Tools. It provides a unified way to install, update, and manage the entire UCLI Tools ecosystem.

## Overview

`ucli` is a bash script for Linux and macOS that builds and manages the tools listed in the UCLI registry. It provides an interactive menu and a command-line interface. Each tool is fetched at the commit pinned in the registry and built with its own `make build`.

## Key Features

- **Interactive Mode** - User-friendly menu for easy navigation and tool building
- **Command-Line Mode** - Execute specific commands programmatically
- **GitHub Integration** - Clones repositories from GitHub with makefile support
- **Organization Setting** - `ucli login` stores a GitHub organization name (default `ucli-tools`); it is a setting, not authentication
- **Error Handling** - Robust error handling with informative messages
- **Color-Coded Output** - Improved readability with ANSI color codes
- **Temporary Build Directories** - Safe cloning with automatic cleanup

## Installation

### Quick Install

```bash
# Download and install ucli
curl -fsSL https://install.ucli.tools/install.sh | bash

# Verify installation
ucli help
```

### Manual Install

```bash
git clone https://github.com/ucli-tools/ucli.git
cd ucli

# Installs to ~/.local/bin, no sudo
make build
```

If ucli is already in `/usr/local/bin`, it is updated there. `ucli install --move` moves it to `~/.local/bin`.

## Usage

### Interactive Mode

Run `ucli` without arguments to enter the interactive menu:

```bash
ucli
```

The interactive menu provides options to:

- Set your GitHub organization (login) or unset it (logout)
- Build one or more tools, or all of them (build, build-all)
- List the tools in the registry (list)
- Update installed tools (update)
- Install prerequisites (prereq)
- Show tool versions (versions)
- Show help or exit

### Command-Line Mode

`ucli` supports various command-line options for automation:

#### Core Commands

```bash
ucli install          # Install ucli to ~/.local/bin (--move: move it out of /usr/local/bin)
ucli uninstall        # Remove ucli, its settings and build cache (tools stay)
ucli remove <tool>    # Uninstall a tool with its 'make delete' target
ucli login [org]      # Set the GitHub organization (default: ucli-tools)
ucli logout           # Unset the organization
ucli list             # List official tools from the registry
ucli versions [tool]  # Show versions (--all for every installed tool)
ucli prereq           # Install prerequisites (apt, dnf, pacman, brew)
ucli help             # Show help information (also --help, -h)
ucli --version        # Print the ucli version
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

# Build every tool in the registry
ucli build-all

# Update all installed tools
ucli update

# List available tools
ucli list
```

## Organization Setting

`ucli login` does not authenticate with GitHub. It records an organization name, and building works without it (the default is `ucli-tools`).

```bash
ucli login            # prompts for a name
ucli login my-org     # sets it directly
```

The name is stored in `~/.ucli_env` and `ucli logout` deletes that file. Tool versions are always pinned by the ucli-tools registry, whatever organization is set. ucli has no support for private repositories or access tokens.

### Environment Variables

- `NO_COLOR` - Turns off colored output
- `XDG_CACHE_HOME` - Where the build directory lives (default `~/.cache`)

## Tool Building Process

When you run `ucli build <tool>`, the following happens:

1. **Validation** - Checks the organization setting, the tool name and the registry entry
2. **Fetching** - Downloads the commit pinned in the registry into a temporary directory under `~/.cache/ucli/`
3. **Contract check** - Requires a Makefile with a `build` target; otherwise nothing is run
4. **Building** - Runs `make build` in the repository root
5. **Recording** - Notes the installed commit so `ucli update` and `ucli versions` can compare it with the pin
6. **Cleanup** - Removes the temporary directory

### Example Build Process

```bash
$ ucli build gits
Building gits (v1a2b3c4d)...
Running make build in gits...
Build successful for gits!
built: gits; failed: none
```

## Prerequisites

`ucli` requires the following system tools:

- **bash** - Shell environment (most Unix-like systems)
- **git** - Version control system
- **curl** - For downloading scripts
- **make** - Build system, needed to build tools

### Installing Prerequisites

#### Ubuntu/Debian
```bash
sudo apt update
sudo apt install -y git make curl
```

Or run `ucli prereq`, which also installs `file`, `tree` and `uv` where the package manager allows.

#### macOS
```bash
brew install git make curl
```

#### Other Systems
Check your package manager for equivalent packages. On Windows, use WSL.

## Configuration

`ucli` has no configuration file. Its defaults:

- **Organization**: `ucli-tools`, changed with `ucli login`
- **Install Directory**: `~/.local/bin`, or `/usr/local/bin` if ucli was already installed there
- **Build Directory**: a temporary directory under `~/.cache/ucli/`, removed when the command ends
- **Color Output**: Only on a terminal, and never when `NO_COLOR` is set

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
# Install prerequisites
ucli prereq

# Verify git access
git ls-remote https://github.com/ucli-tools/gits

# Check disk space
df -h
```

#### Organization setting

```bash
# Show or change the organization
ucli login

# Reset it
ucli logout
```

#### Permission denied

A new `ucli install` goes to `~/.local/bin` and never needs sudo. If an old copy lives in `/usr/local/bin`, it is updated there, and `ucli install --move` moves it to `~/.local/bin`.

### Getting Help

```bash
# Show all available commands
ucli help

# Print the version
ucli --version
```

## Examples

### Complete Setup Workflow

```bash
# 1. Install ucli
curl -fsSL https://install.ucli.tools/install.sh | bash

# 2. List the available tools
ucli list

# 3. Install popular tools
ucli build gits mdtexpdf mdaudiobook

# 4. Verify installation
ucli versions --all
```

### CI/CD Integration

```bash
# Non-interactive installation
ucli build gits

# Check installation
which gits && echo "Installation successful"
```

### Development Workflow

```bash
# Update all installed tools
ucli update

# Remove a tool
ucli remove gits
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
- Keep tools updated for security patches

## Contributing

To contribute to `ucli`:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

See our [Contributing Guide](../community/contributing.md) for details.

## Support

- **Documentation**: [docs.ucli.tools](https://docs.ucli.tools)
- **Issues**: [GitHub Issues](https://github.com/ucli-tools/ucli/issues)
- **Discussions**: [Community Forums](https://github.com/ucli-tools/community/discussions)

## License

Licensed under the Apache License 2.0. See [LICENSE](https://github.com/ucli-tools/ucli/blob/main/LICENSE) for details.

---

**Ready to install tools?** Try `ucli build gits` to get started!
