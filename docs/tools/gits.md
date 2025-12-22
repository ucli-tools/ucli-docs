# gits - Git Workflow Automation

[![Status: Production Ready](https://img.shields.io/badge/status-production%20ready-green.svg)](https://docs.ucli.tools)
[![License: Apache 2.0](https://img.shields.io/badge/license-Apache%202.0-blue.svg)](https://github.com/ucli-tools/gits/blob/main/LICENSE)

`gits` is a powerful bash script designed to streamline Git workflow automation. It combines common Git, GitHub CLI, and Gitea tea commands into quick, easy-to-use operations, supporting Forgejo, Gitea, and GitHub platforms.

## Overview

GitS provides developers with a unified interface for common Git operations across multiple platforms. Whether you're working with GitHub, Gitea, or Forgejo, `gits` offers consistent commands and intelligent automation.

## Key Features

- **Multi-Platform Support** - Works with Forgejo, Gitea, and GitHub
- **Batch Operations** - Perform actions across multiple repositories
- **AI-Powered Commits** - Integration with AI commit message generation
- **Parallel Processing** - Concurrent operations for better performance
- **Smart Conflict Detection** - Advanced merge conflict handling
- **Repository Management** - Create, clone, and manage repositories
- **Issue Management** - Fetch and save issues from repositories
- **Pull Request Workflow** - Complete PR lifecycle management

## Installation

### Via UCLI (Recommended)

```bash
# Install ucli tool manager first
curl -fsSL https://install.ucli.tools | bash

# Install gits
ucli build gits
```

### Manual Installation

```bash
# Clone and install
git clone https://github.com/ucli-tools/gits.git
cd gits
make install
```

## Prerequisites

### Required Tools

- **git** - Version control system
- **jq** - JSON processing (for Forgejo/Gitea API)
- **curl** - HTTP requests
- **gh** - GitHub CLI (for GitHub operations)
- **tea** - Gitea CLI (for Gitea operations)

### Platform-Specific Requirements

#### Ubuntu/Debian
```bash
sudo apt update
sudo apt install -y git jq curl
```

#### macOS
```bash
brew install git jq curl gh
brew install gitea/tea/tea  # For Gitea support
```

#### Authentication Setup

##### GitHub
```bash
gh auth login
```

##### Gitea/Forgejo
```bash
# Login to your instance
gits login
```

## Usage

### Basic Git Operations

#### Quick Pull (Stash, Fetch, Pull, Status)
```bash
gits pull [branch]
```
Combines: `git stash`, `git fetch`, `git pull`, `git status`

#### Rapid Push (Stage, Commit, Push)
```bash
gits push
```
Stages all changes, prompts for commit message, commits, and pushes.

#### AI-Powered Workflow
```bash
gits up
```
Executes: `git add . && pal /commit -y && git push` (requires `pal` tool)

### Repository Management

#### Clone Repositories
```bash
# Clone single repository
gits clone <repo-url>

# Clone all repositories from user/org
gits clone-all <username>

# Clone with custom server
gits clone-all <org> --server git.ourworld.tf
```

#### Initialize New Repository
```bash
gits init
```
Interactive setup for new Git repositories with platform selection.

#### Repository Operations
```bash
# Create repository
gits repo create

# Delete repository
gits repo delete
```

### Batch Operations

#### Push Changes Across Repositories
```bash
# Interactive mode
gits push-all

# Batch mode with message
gits push-all --batch -m "Update documentation"

# With AI commit messages
gits push-all -py
```

#### Status Check Across Repositories
```bash
# Show repositories needing attention
gits status-all

# Show all repositories
gits status-all --all
```

#### Pull Updates
```bash
# Pull with conflict detection
gits pull-all

# Use rebase strategy
gits pull-all --strategy rebase

# Fast-forward only
gits pull-all --strategy ff-only
```

### Branch Management

#### Create and Switch Branches
```bash
gits new <branch-name>
```

#### Delete Branches
```bash
gits delete <branch-name>
```

#### Align Branches Across Repositories
```bash
gits set-all <branch-name>
```

### Pull Request Management

#### Create Pull Request
```bash
gits pr create
```
Interactive PR creation with platform selection.

#### Close Pull Request
```bash
gits pr close
```

#### Merge Pull Request
```bash
gits pr merge
```

### Issue Management

#### Fetch Issues
```bash
# Fetch open issues
gits fetch-issues

# Fetch all issues (open/closed)
gits fetch-issues --state all

# JSON output
gits fetch-issues --format json
```

#### Save Issues to Files
```bash
# Save as markdown files
gits save-issues

# Save all issues
gits save-issues --state all

# Save as JSON
gits save-issues --format json
```

#### Batch Issue Operations
```bash
# Fetch issues from all repos
gits fetch-issues-all

# Save issues from all repos
gits save-issues-all --state all
```

### Authentication Management

#### Platform Login
```bash
gits login
```
Interactive login supporting GitHub, Gitea, and Forgejo.

#### Token Management
```bash
# List cached tokens
gits token list

# Show specific token
gits token show <server>

# Clear token
gits token clear <server>
```

## Platform-Specific Features

### GitHub Integration

- Native GitHub CLI integration
- Automatic PR merging
- Enhanced PR descriptions
- Branch cleanup after merge

### Gitea/Forgejo Support

- API-based operations (no CLI required for basic functions)
- Custom server support
- Token-based authentication
- Full repository management

### Cross-Platform Compatibility

- Consistent command interface across platforms
- Automatic platform detection
- Unified authentication flow
- Platform-specific optimizations

## Configuration

### Default Settings

`gits` uses sensible defaults but can be customized:

- **Default Branch**: `main`
- **Merge Strategy**: `merge`
- **Concurrent Operations**: 5 parallel processes
- **Conflict Handling**: Abort on first conflict

### Custom Configuration

Create `~/.config/gits/config` for custom settings:

```bash
# Example configuration
DEFAULT_BRANCH="develop"
MERGE_STRATEGY="rebase"
MAX_CONCURRENT=10
AUTO_RESOLVE_CONFLICTS=false
```

## Advanced Usage

### CI/CD Integration

#### Automated Repository Management
```bash
#!/bin/bash
# CI script for repository maintenance

# Update all repositories
gits pull-all --strategy rebase

# Run tests across repos
find . -name ".git" -type d -execdir make test \;

# Push changes with AI commits
gits push-all -py
```

#### Deployment Automation
```bash
#!/bin/bash
# Deployment script

# Ensure all repos are on main branch
gits set-all main

# Pull latest changes
gits pull-all --strategy ff-only

# Deploy applications
# ... deployment logic ...
```

### Development Workflow

#### Feature Branch Workflow
```bash
# Start new feature
gits new feature/amazing-feature

# Work across multiple repos
# ... development work ...

# Commit with AI assistance
gits push-all -py

# Create PRs
gits pr create
```

#### Repository Maintenance
```bash
# Weekly maintenance script
gits fetch-all --no-tags
gits status-all
gits clean-old-branches
```

## Troubleshooting

### Common Issues

#### Authentication Failures

**GitHub:**
```bash
gh auth login
gh auth status
```

**Gitea/Forgejo:**
```bash
gits login
gits token list
```

#### Permission Denied

```bash
# Check repository access
git remote -v
git ls-remote origin

# Verify token permissions
gits token show <server>
```

#### Merge Conflicts

```bash
# Manual resolution
gits pull  # Stop at conflict
# Resolve conflicts manually
git add <resolved-files>
git commit
```

#### Network Issues

```bash
# Check connectivity
curl -I https://api.github.com

# Use different protocol
git config --global url."https://".insteadOf git://
```

### Debug Mode

Enable verbose output:

```bash
export GITS_DEBUG=true
gits pull
```

### Performance Optimization

```bash
# Increase concurrent operations
export MAX_CONCURRENT=10

# Disable tags for faster fetches
gits fetch-all --no-tags
```

## Examples

### Complete Development Workflow

```bash
# 1. Set up workspace
mkdir ~/projects
cd ~/projects

# 2. Clone organization repositories
gits clone-all ucli-tools

# 3. Start new feature
gits set-all feature/new-feature

# 4. Make changes across repos
# ... development work ...

# 5. Commit with AI assistance
gits push-all -py

# 6. Create pull requests
find . -name ".git" -type d -execdir gits pr create \;

# 7. Monitor progress
gits status-all
```

### Repository Maintenance

```bash
#!/bin/bash
# Weekly repo maintenance

echo "🧹 Starting repository maintenance..."

# Update all repos
gits fetch-all --no-tags

# Clean old branches
gits delete-old-branches

# Update dependencies
find . -name "Makefile" -execdir make update-deps \;

# Check for issues
gits fetch-issues-all --state open

echo "✅ Maintenance complete!"
```

## Integration with Other Tools

### IDE Integration

#### VS Code
Add to `.vscode/tasks.json`:
```json
{
  "tasks": [
    {
      "label": "Git Pull All",
      "type": "shell",
      "command": "gits",
      "args": ["pull-all"],
      "group": "build"
    }
  ]
}
```

#### JetBrains IDEs
Create external tools for common `gits` commands.

### Shell Integration

Add to `~/.bashrc` or `~/.zshrc`:
```bash
# Quick git status across repos
alias gs='gits status-all'

# Fast push all
alias gpa='gits push-all -py'

# Pull everything
alias gpl='gits pull-all'
```

### CI/CD Pipelines

#### GitHub Actions
```yaml
- name: Update Repositories
  run: |
    gits pull-all --strategy rebase
    gits push-all --batch -m "CI: Update dependencies"
```

#### GitLab CI
```yaml
update-repos:
  script:
    - gits pull-all --strategy merge
    - gits push-all --batch -m "CI: Update repositories"
```

## Security Considerations

- **Token Storage**: Tokens stored securely with 600 permissions
- **HTTPS Only**: All operations use HTTPS for security
- **Audit Trail**: Command logging for accountability
- **Access Control**: Platform-specific permission validation

## Contributing

### Development Setup

```bash
# Clone repository
git clone https://github.com/ucli-tools/gits.git
cd gits

# Install development dependencies
make dev-setup

# Run tests
make test

# Install locally
make install-dev
```

### Code Style

- Follow Bash best practices
- Use descriptive variable names
- Add error handling for all operations
- Include documentation for new features

### Testing

```bash
# Run unit tests
make test-unit

# Run integration tests
make test-integration

# Run all tests
make test
```

## Changelog

### Version 2.0.0
- Multi-platform support (Forgejo, Gitea, GitHub)
- Parallel processing for batch operations
- AI-powered commit messages
- Enhanced error handling
- Improved documentation

### Version 1.5.0
- Batch repository operations
- Issue management features
- Token caching system
- Cross-platform compatibility

### Version 1.0.0
- Initial release
- Basic Git workflow automation
- Single repository operations
- Platform-specific integrations

## Support

- **Documentation**: [docs.ucli.tools/tools/gits](https://docs.ucli.tools/tools/gits)
- **Issues**: [GitHub Issues](https://github.com/ucli-tools/gits/issues)
- **Discussions**: [Community Forums](https://github.com/orgs/ucli-tools/discussions)

## License

Licensed under the Apache License 2.0. See [LICENSE](https://github.com/ucli-tools/gits/blob/main/LICENSE) for details.

---

**Ready to streamline your Git workflow?** Try `ucli build gits` to get started!
