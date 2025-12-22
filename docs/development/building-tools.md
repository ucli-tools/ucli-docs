# Building UCLI Tools

This guide explains how to build, test, and distribute UCLI Tools. Whether you're developing a new tool or contributing to existing ones, this document provides the technical details you need.

## 🏗️ Build System Overview

### Makefile Structure

All UCLI Tools follow a consistent Makefile structure for building, testing, and installation:

```makefile
.PHONY: all build test install clean dev-setup

# Default target
all: build

# Build the tool
build:
	@echo "Building $(TOOL_NAME)..."
	# Build commands here

# Run tests
test:
	@echo "Running tests..."
	# Test commands here

# Install system-wide
install: build
	@echo "Installing $(TOOL_NAME)..."
	# Install commands here

# Development setup
dev-setup:
	@echo "Setting up development environment..."
	# Development setup commands

# Clean build artifacts
clean:
	@echo "Cleaning build artifacts..."
	# Clean commands here
```

### Tool Categories

#### Bash Tools (ucli, gits)
- **Build Process**: Syntax validation, shellcheck
- **Dependencies**: bash, common Unix tools
- **Installation**: Copy to `/usr/local/bin` or `~/.local/bin`
- **Packaging**: Single script distribution

#### Python Tools (mdaudiobook)
- **Build Process**: pip install, wheel building
- **Dependencies**: Python packages, virtual environments
- **Installation**: setuptools/pip installation
- **Packaging**: Python wheels and source distributions

#### Hybrid Tools (mdtexpdf)
- **Build Process**: Bash wrapper + external tools
- **Dependencies**: pandoc, LaTeX distributions
- **Installation**: Script + dependency checking
- **Packaging**: Script + documentation

## 🛠️ Development Environment Setup

### Prerequisites

#### System Requirements
- **Linux/macOS/Windows** with bash-compatible shell
- **git** for version control
- **make** for build system
- **curl/wget** for downloading dependencies

#### Tool-Specific Requirements

##### For gits
```bash
# GitHub CLI (optional, for GitHub integration)
brew install gh  # macOS
# OR download from https://cli.github.com/

# Gitea CLI (optional, for Gitea integration)
brew install gitea/tea/tea  # macOS
```

##### For mdtexpdf
```bash
# Pandoc
brew install pandoc  # macOS
sudo apt install pandoc  # Ubuntu

# LaTeX distribution
# macOS: https://www.tug.org/mactex/
# Ubuntu: sudo apt install texlive-latex-base texlive-latex-recommended
# Windows: https://miktex.org/
```

##### For mdaudiobook
```bash
# Python 3.8+
python3 --version

# FFmpeg for audio processing
brew install ffmpeg  # macOS
sudo apt install ffmpeg  # Ubuntu
```

### Development Setup Script

Each tool includes a development setup script:

```bash
# Clone repository
git clone https://github.com/ucli-tools/tool-name.git
cd tool-name

# Run development setup
make dev-setup

# Or manually
./scripts/dev-setup.sh
```

## 🔨 Building Process

### Standard Build Workflow

```bash
# 1. Clone and setup
git clone https://github.com/ucli-tools/tool-name.git
cd tool-name
make dev-setup

# 2. Make changes
# Edit source files...

# 3. Build
make build

# 4. Test
make test

# 5. Install locally for testing
make install-dev

# 6. Test manually
tool-name --help
```

### Build Targets

#### build
Compiles source code, runs linting, and prepares for installation:
```bash
make build
```

#### test
Runs the test suite:
```bash
make test
```

#### install
Installs the tool system-wide (requires sudo):
```bash
sudo make install
```

#### install-dev
Installs to user directory for development:
```bash
make install-dev
```

#### clean
Removes build artifacts:
```bash
make clean
```

### Cross-Platform Building

#### Linux
```bash
# Native Linux build
make build

# Test on different distributions
docker run -it ubuntu:20.04 bash
# Install dependencies and test
```

#### macOS
```bash
# Using Homebrew
brew install make git  # Prerequisites
make build

# Test on Intel and Apple Silicon
arch -x86_64 make test  # Intel
make test              # Apple Silicon
```

#### Windows
```bash
# Using WSL or MSYS2
pacman -S make git     # MSYS2
make build

# Or using Windows-native tools
# Use appropriate Windows build tools
```

## 🧪 Testing Strategy

### Test Categories

#### Unit Tests
- Test individual functions and modules
- Mock external dependencies
- Fast execution, high coverage

#### Integration Tests
- Test component interactions
- Use real dependencies where possible
- Validate end-to-end functionality

#### End-to-End Tests
- Test complete user workflows
- Use real external services (staging)
- Validate user experience

### Test Frameworks

#### Bash Tools
```bash
# bats-core for Bash testing
brew install bats-core
make test

# Example test file
#!/usr/bin/env bats

@test "tool shows help" {
    run tool-name --help
    [ "$status" -eq 0 ]
    [[ "$output" =~ "Usage:" ]]
}
```

#### Python Tools
```bash
# pytest for Python testing
pip install pytest pytest-cov
make test

# Example test file
import pytest
from tool_name import main

def test_basic_functionality():
    result = main(["--help"])
    assert result == 0
```

### Test Organization

```
tests/
├── unit/              # Unit tests
│   ├── test_cli.py
│   └── test_core.py
├── integration/       # Integration tests
│   └── test_workflow.py
├── e2e/              # End-to-end tests
│   └── test_user_flow.py
├── fixtures/         # Test data
└── utils/            # Test utilities
```

### Running Tests

```bash
# Run all tests
make test

# Run specific test categories
make test-unit
make test-integration
make test-e2e

# Run with coverage
make test-coverage

# Run specific test file
make test-file TEST_FILE=tests/unit/test_cli.py
```

### Test Requirements

- **Test Coverage**: Minimum 80% code coverage
- **CI/CD Integration**: All tests pass in CI
- **Cross-Platform**: Tests run on Linux, macOS, Windows
- **Performance**: Tests complete within reasonable time

## 📦 Distribution and Packaging

### Release Process

#### Version Management
```bash
# Update version
echo "1.2.0" > VERSION

# Create git tag
git tag -a v1.2.0 -m "Release version 1.2.0"
git push origin v1.2.0
```

#### GitHub Release
1. **Create Release**: Use GitHub web interface or CLI
2. **Upload Assets**: Include built binaries/scripts
3. **Write Changelog**: Document changes and improvements
4. **Publish**: Make release public

#### Automated Releases
```yaml
# .github/workflows/release.yml
name: Release
on:
  push:
    tags:
      - 'v*'
jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Build
        run: make build
      - name: Create Release
        uses: softprops/action-gh-release@v1
        with:
          files: dist/*
```

### Package Formats

#### Bash Scripts
- **Distribution**: Single script file
- **Installation**: Copy to PATH directory
- **Updates**: Self-updating via script

#### Python Applications
- **Distribution**: Wheel files (.whl)
- **Installation**: pip install
- **Dependencies**: requirements.txt or pyproject.toml

#### Hybrid Tools
- **Distribution**: Script + dependencies
- **Installation**: Script installer
- **Updates**: Via package manager or script

## 🚀 Deployment Strategies

### GitHub Pages (Documentation)
```yaml
# .github/workflows/docs.yml
name: Deploy Docs
on:
  push:
    branches: [main]
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Setup Python
        run: pip install mkdocs-material
      - name: Build docs
        run: mkdocs build
      - name: Deploy
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./site
```

### Homebrew (macOS)
```ruby
# Formula for Homebrew
class ToolName < Formula
  desc "Description of the tool"
  homepage "https://github.com/ucli-tools/tool-name"
  url "https://github.com/ucli-tools/tool-name/archive/v1.0.0.tar.gz"
  sha256 "checksum"

  depends_on "dependency1"
  depends_on "dependency2"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/tool-name", "--version"
  end
end
```

### Linux Package Managers

#### Debian/Ubuntu (.deb)
```bash
# Build .deb package
make package-deb

# Install
sudo dpkg -i tool-name_1.0.0_amd64.deb
```

#### Red Hat/CentOS (.rpm)
```bash
# Build .rpm package
make package-rpm

# Install
sudo rpm -i tool-name-1.0.0.x86_64.rpm
```

### Windows Distribution

#### Chocolatey
```powershell
# Chocolatey package
choco install tool-name
```

#### Scoop
```json
{
  "version": "1.0.0",
  "url": "https://github.com/ucli-tools/tool-name/releases/download/v1.0.0/tool-name-windows.zip",
  "bin": "tool-name.exe"
}
```

## 🔧 Development Tools

### Code Quality

#### Linting
```bash
# Shell scripts
brew install shellcheck
shellcheck script.sh

# Python
pip install flake8 black
flake8 src/
black src/
```

#### Formatting
```bash
# Bash
shfmt -w script.sh

# Python
black src/
isort src/
```

### Documentation

#### README Generation
```bash
# Use tools like readme-md-generator
npm install -g readme-md-generator
readme-md-generator -p ./path/to/project
```

#### API Documentation
```bash
# Python docstrings
pip install sphinx
make docs
```

### Version Control

#### Git Hooks
```bash
# Pre-commit hooks
brew install pre-commit
pre-commit install

# Example .pre-commit-config.yaml
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.4.0
    hooks:
      - id: trailing-whitespace
      - id: end-of-file-fixer
```

## 📊 Quality Assurance

### Code Review Checklist

- [ ] **Functionality**: Code works as intended
- [ ] **Tests**: Adequate test coverage
- [ ] **Documentation**: Code is well-documented
- [ ] **Style**: Follows project conventions
- [ ] **Security**: No security vulnerabilities
- [ ] **Performance**: Efficient implementation

### Release Checklist

- [ ] **Version**: Version number updated
- [ ] **Changelog**: Release notes written
- [ ] **Tests**: All tests pass
- [ ] **Documentation**: Docs updated
- [ ] **Compatibility**: Tested on supported platforms
- [ ] **Security**: Security review completed

### Maintenance Tasks

#### Regular Maintenance
- **Dependency Updates**: Keep dependencies current
- **Security Patches**: Apply security fixes promptly
- **Platform Testing**: Verify compatibility across platforms
- **Performance Monitoring**: Track and optimize performance

#### Issue Management
- **Triage**: Categorize and prioritize issues
- **Reproduction**: Create test cases for bugs
- **Fix Validation**: Verify fixes with tests
- **Documentation**: Update docs for behavior changes

This comprehensive build and development guide ensures consistent, high-quality development across all UCLI Tools.
