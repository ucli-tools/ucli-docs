# Contributing to UCLI Tools

[![GitHub contributors](https://img.shields.io/github/contributors/ucli-tools/ucli)](https://github.com/ucli-tools/ucli/graphs/contributors)
[![GitHub issues](https://img.shields.io/github/issues/ucli-tools/ucli)](https://github.com/ucli-tools/ucli/issues)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/ucli-tools/ucli/pulls)

We welcome contributions from everyone! UCLI Tools is an open-source project that thrives on community involvement. Whether you're fixing bugs, adding features, improving documentation, or helping with testing, your contributions are valuable.

## Ways to Contribute

### 🐛 **Report Bugs**
Found a bug? Help us improve by reporting it:

1. Check if the issue already exists in [GitHub Issues](https://github.com/ucli-tools/ucli/issues)
2. If not, create a new issue with:
   - Clear title describing the problem
   - Steps to reproduce
   - Expected vs actual behavior
   - Your environment (OS, shell, tool versions)

### 💡 **Suggest Features**
Have an idea for a new tool or feature?

1. Check existing [Discussions](https://github.com/ucli-tools/community/discussions) and issues
2. Start a [Discussion](https://github.com/ucli-tools/community/discussions/new?category=ideas) to gather feedback
3. If well-received, create a feature request issue

### 🛠️ **Code Contributions**

#### Development Setup

```bash
# Fork the repository you want to contribute to
# Clone your fork
git clone https://github.com/your-username/tool-name.git
cd tool-name

# Create a feature branch
git checkout -b feature/amazing-improvement

# Set up development environment
make dev-setup  # or follow tool-specific setup instructions

# Make your changes
# Write tests
# Test thoroughly

# Commit with clear message
git commit -m "Add amazing feature

- What it does
- Why it's needed
- How to use it"

# Push and create PR
git push origin feature/amazing-improvement
```

#### Pull Request Process

1. **Fork** the repository
2. **Create** a feature branch from `main`
3. **Make** your changes with tests
4. **Test** thoroughly (see [Testing](#testing) section)
5. **Update** documentation if needed
6. **Commit** with clear, descriptive messages
7. **Push** to your fork
8. **Create** a Pull Request with:
   - Clear title and description
   - Reference to any related issues
   - Screenshots/videos for UI changes
   - Test results

#### Code Standards

- **Shell Scripts**: Follow [Google Shell Style Guide](https://google.github.io/styleguide/shellguide.html)
- **Python**: Follow [PEP 8](https://pep8.org/) with [Black](https://black.readthedocs.io/) formatting
- **Documentation**: Clear, concise, and comprehensive
- **Commits**: Use [Conventional Commits](https://conventionalcommits.org/)

### 📚 **Documentation Improvements**

- Fix typos or unclear explanations
- Add missing examples
- Create tutorials or guides
- Translate documentation
- Improve navigation or structure

### 🧪 **Testing**

Help ensure quality by:

- Writing unit tests for new features
- Testing on different platforms (Linux, macOS, Windows)
- Reporting compatibility issues
- Improving test coverage

### 🎨 **Design & UX**

- Improve user interfaces
- Create better error messages
- Enhance command-line help
- Design logos or graphics

## Tool-Specific Contribution Guides

### ucli (Tool Manager)
- Focus on cross-platform compatibility
- Improve error handling and user feedback
- Add support for new package managers
- Enhance security and sandboxing

### gits (Git Workflow)
- Add support for new Git hosting platforms
- Improve batch operation performance
- Enhance AI commit message generation
- Add new workflow automations

### mdtexpdf (PDF Generation)
- Support new LaTeX packages
- Improve template system
- Add new output formats
- Enhance math equation rendering

### mdaudiobook (Text-to-Speech)
- Add new TTS engines
- Improve voice quality
- Support more languages
- Enhance audio processing

## Development Workflow

### 1. Choose an Issue
- Look for [good first issues](https://github.com/ucli-tools/ucli/labels/good%20first%20issue)
- Check [help wanted](https://github.com/ucli-tools/ucli/labels/help%20wanted) labels
- Comment on issues you're interested in

### 2. Set Up Development Environment
Each tool has its own setup requirements. Check the tool's README.md or CONTRIBUTING.md file.

### 3. Make Changes
- Write clear, focused commits
- Include tests for new functionality
- Update documentation
- Follow the existing code style

### 4. Test Thoroughly
- Run existing tests
- Test on multiple platforms if possible
- Check for regressions
- Verify documentation builds

### 5. Submit Pull Request
- Reference related issues
- Provide clear description of changes
- Include before/after examples
- Request review from maintainers

## Getting Help

### Communication Channels

- **GitHub Issues**: Bug reports and feature requests
- **GitHub Discussions**: General questions and ideas
- **Community Chat**: Real-time discussion (if available)

### Finding Mentors

- Look for issues labeled `good first issue` or `help wanted`
- Ask questions in GitHub Discussions
- Join community meetings or calls

### Documentation Resources

- [Main Documentation](https://docs.ucli.tools)
- [Development Guides](../development/)
- [API References](../reference/)
- [Community Guidelines](code-of-conduct.md)

## Recognition

Contributors are recognized through:

- **GitHub Contributors**: Listed in repository insights
- **Changelog Credits**: Mentioned in release notes
- **Community Recognition**: Featured in community updates
- **Maintainer Status**: Active contributors may become maintainers

## Code of Conduct

Please review and follow our [Code of Conduct](code-of-conduct.md) in all interactions.

## License

By contributing to UCLI Tools, you agree that your contributions will be licensed under the same license as the project (Apache 2.0).

## Questions?

- Check existing [Discussions](https://github.com/ucli-tools/community/discussions)
- Search [Issues](https://github.com/ucli-tools/ucli/issues)
- Ask in the community chat

We're excited to have you contribute to UCLI Tools! 🚀
