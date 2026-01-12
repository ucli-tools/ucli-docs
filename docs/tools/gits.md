# gits - Git Workflow Automation

[![Status: Production Ready](https://img.shields.io/badge/status-production%20ready-green.svg)](https://docs.ucli.tools)
[![License: Apache 2.0](https://img.shields.io/badge/license-Apache%202.0-blue.svg)](https://github.com/ucli-tools/gits/blob/main/LICENSE)

`gits` is a powerful bash script designed to streamline Git workflow automation. It combines common Git, GitHub CLI, and Gitea tea commands into quick, easy-to-use operations, supporting Forgejo, Gitea, and GitHub platforms.

## Overview

GitS provides developers with a unified interface for common Git operations across multiple platforms. Whether you're working with GitHub, Gitea, or Forgejo, `gits` offers consistent commands and intelligent automation.

**Manage 10+ repositories in seconds** - From feature branches to merged PRs with just a few commands.

## Key Features

- **Multi-Platform Support** - Works with Forgejo, Gitea, and GitHub
- **Batch Operations** - Perform actions across multiple repositories simultaneously
- **PR Batch Management** - Create and merge pull requests across all repositories with smart diff detection
- **AI-Powered Commits** - Integration with [Pal](https://github.com/scottyeager/Pal/) for intelligent commit message generation
- **Parallel Processing** - Concurrent operations for better performance
- **Smart Diff Detection** - Only acts on repositories with actual changes
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

### Optional Tools

- **pal** - AI-powered commit message generation ([Pal by Scott Yeager](https://github.com/scottyeager/Pal/))

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
Executes: `git add . && pal /commit -y && git push` (requires [Pal](https://github.com/scottyeager/Pal/))

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

# With AI commit messages (via Pal)
gits push-all -py
```

!!! tip "AI-Powered Commits with Pal"
    The `-py` flag uses [Pal by Scott Yeager](https://github.com/scottyeager/Pal/) to automatically generate meaningful commit messages based on your changes. This is the fastest way to commit across multiple repositories.

#### Status Check Across Repositories
```bash
# Show repositories needing attention
gits status-all

# Show all repositories
gits status-all --all

# List repos with branch info
gits list-all
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

#### Compare Branches Across Repositories
```bash
# Compare branches
gits diff-all main feature-branch

# Use suffix mode (auto-detect default branches)
gits diff-all --suffix -feature

# Quiet mode - only show repos with differences
gits diff-all main develop --quiet
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
# Set all repos to same branch
gits set-all <branch-name>

# Rename branches with suffix
gits set-all --suffix -feature
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

#### Create PRs Across All Repositories
```bash
# Dry run to preview what would be created
gits pr create-all --title "Feature X" --base main --dry-run

# Create PRs using suffix mode (e.g., main-qr → main)
gits pr create-all --title "QR Feature" --base main --suffix -qr

# Create PRs with explicit head branch
gits pr create-all --title "Update" --base main --head feature-branch

# Create PRs with description
gits pr create-all --title "Fix" --base main --body "Bug fixes and improvements"
```

!!! info "Smart Diff Detection"
    `pr create-all` only creates PRs for repositories that have actual differences between the head and base branches. Repositories without changes are automatically skipped.

!!! tip "Why Use `--suffix` Mode?"
    The `--suffix` mode is powerful when working with repositories that have **different default branches**. For example:
    
    - `repo-backend` uses `main` as default → creates PR from `main-feature` → `main`
    - `repo-frontend` uses `development` as default → creates PR from `development-feature` → `development`
    - `repo-docs` uses `main` as default → creates PR from `main-feature` → `main`
    
    With `--suffix -feature`, GitS **auto-detects each repo's default branch** and applies the suffix. You don't need to worry about which repos use `main` vs `development` vs `master` - it just works!
    
    ```bash
    # This handles mixed default branches automatically
    gits pr create-all --title "Feature" --suffix -feature
    
    # Equivalent to manually running in each repo:
    # repo-backend:  PR main-feature → main
    # repo-frontend: PR development-feature → development  
    # repo-docs:     PR main-feature → main
    ```

**Options:**

| Option | Description |
|--------|-------------|
| `--title` | PR title (required) |
| `--base` | Target branch to merge into (omit when using `--suffix` for auto-detection) |
| `--suffix` | Branch suffix mode - auto-detects default branch per repo (e.g., `-qr`, `-feature`) |
| `--head` | Explicit head branch name (use instead of `--suffix` for same branch across all repos) |
| `--body` | PR description |
| `--dry-run` | Preview without creating PRs |

#### Merge PRs Across All Repositories
```bash
# Dry run to preview
gits pr merge-all --dry-run

# Merge all open PRs
gits pr merge-all

# Merge and delete branches after
gits pr merge-all --delete-branch
```

**Options:**

| Option | Description |
|--------|-------------|
| `--delete-branch`, `-d` | Delete head branch after merge |
| `--dry-run` | Preview without merging |

#### Get Latest PR Number
```bash
gits pr-latest
```
Returns the latest PR number for the current repository. Useful for scripting:
```bash
gits pr merge --pr-number $(gits pr-latest)
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

## AI-Powered Commits with Pal

GitS integrates with [**Pal**](https://github.com/scottyeager/Pal/) by Scott Yeager for AI-powered commit message generation. This integration makes committing changes across multiple repositories incredibly fast and meaningful.

### How It Works

When you use the `-p` or `-py` flags, GitS invokes Pal to analyze your staged changes and generate a descriptive commit message:

```bash
# Interactive mode - review commit message before committing
gits push-all -p

# Auto-commit mode - generate and commit immediately
gits push-all -py

# Quick workflow with AI
gits up  # Equivalent to: git add . && pal /commit -y && git push
```

### Installing Pal

To use AI-powered commits, install Pal:

```bash
# See installation instructions at:
# https://github.com/scottyeager/Pal/
```

### Example Workflow

```bash
# Make changes across multiple repos
# ...

# Push all with AI-generated commit messages
gits push-all -py

# Output:
# 📁 ./backend - Analyzing changes...
#    ✅ Committed: "Add user authentication middleware with JWT validation"
# 📁 ./frontend - Analyzing changes...
#    ✅ Committed: "Update login form with validation and error handling"
# 📁 ./docs - Analyzing changes...
#    ✅ Committed: "Document authentication flow and API endpoints"
```

## Complete Workflow Examples

### Multi-Repository Feature Development

A complete workflow from feature branch to merged PRs across an entire organization:

```bash
# 1. Clone all organization repositories
gits clone-all myorg

# 2. Create feature branch across all repos (using suffix)
gits set-all --suffix -feature
# This creates: main-feature, development-feature, etc. based on each repo's default

# 3. Make changes in each repository
# ... development work ...

# 4. Push all changes with AI-generated commits (via Pal)
gits push-all -py

# 5. Preview PR creation (suffix auto-detects default branches)
gits pr create-all --title "New Feature" --suffix -feature --dry-run
# Shows: repo-api (main-feature → main), repo-web (development-feature → development), etc.

# 6. Create PRs across all repos with differences
gits pr create-all --title "New Feature" --suffix -feature
# Each PR targets the correct default branch automatically!

# 7. After code review, merge all PRs
gits pr merge-all --delete-branch

# 8. Switch back to default branches
gits set-all --suffix ""  # or manually: gits set-all main
```

!!! tip "The Power of `--suffix`"
    Notice we use `--suffix -feature` throughout. This means:
    
    - Repos with `main` as default: work on `main-feature`, PR to `main`
    - Repos with `development` as default: work on `development-feature`, PR to `development`
    - Repos with `master` as default: work on `master-feature`, PR to `master`
    
    **One command, any mix of default branches. No manual tracking needed.**

### Daily Development Routine

```bash
# Morning: Pull latest changes
gits pull-all

# Check status across repos
gits status-all

# Work on features...

# End of day: Push changes with AI commits
gits push-all -py
```

### Repository Maintenance

```bash
#!/bin/bash
# Weekly repo maintenance

echo "🧹 Starting repository maintenance..."

# Fetch all updates
gits fetch-all --no-tags

# Check status
gits status-all

# Check for open issues
gits fetch-issues-all --state open

echo "✅ Maintenance complete!"
```

### Microservices Dependency Update

```bash
# Update a shared dependency across 20 microservices

# 1. Ensure all repos are clean
gits status-all

# 2. Create update branch
gits set-all deps-update

# 3. Update dependencies in each repo
# ... run update scripts ...

# 4. Commit all with descriptive message
gits push-all --batch -m "chore: bump shared-lib to v2.0.0"

# 5. Create PRs
gits pr create-all --title "Bump shared-lib to v2.0.0" --base main

# 6. After CI passes, merge all
gits pr merge-all --delete-branch
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

### Debug Mode

Enable verbose output:

```bash
export GITS_DEBUG=true
gits pull
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
    },
    {
      "label": "Git Push All (AI)",
      "type": "shell",
      "command": "gits",
      "args": ["push-all", "-py"],
      "group": "build"
    }
  ]
}
```

### Shell Integration

Add to `~/.bashrc` or `~/.zshrc`:
```bash
# Quick git status across repos
alias gs='gits status-all'

# Fast push all with AI commits
alias gpa='gits push-all -py'

# Pull everything
alias gpl='gits pull-all'

# Create PRs across repos
alias gpr='gits pr create-all'
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

- **Token Storage**: Tokens stored securely with 600 permissions in `~/.config/gits/tokens.conf`
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

## Changelog

### Version 2.1.0
- **PR Batch Management**: New `pr create-all` and `pr merge-all` commands
- **Smart Diff Detection**: Only creates PRs for repos with actual changes
- **Suffix Mode**: Support for branch suffix patterns in PR operations
- **Dry Run Support**: Preview batch operations before executing

### Version 2.0.0
- Multi-platform support (Forgejo, Gitea, GitHub)
- Parallel processing for batch operations
- AI-powered commit messages via Pal integration
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
- **Discussions**: [Community Forums](https://github.com/ucli-tools/community/discussions)

## Credits

- **Pal** by [Scott Yeager](https://github.com/scottyeager/Pal/) - AI-powered commit message generation

## License

Licensed under the Apache License 2.0. See [LICENSE](https://github.com/ucli-tools/gits/blob/main/LICENSE) for details.

---

**Ready to streamline your Git workflow?** Try `ucli build gits` to get started!
