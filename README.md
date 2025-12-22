# UCLI Docs

Official documentation site for UCLI Tools - Professional CLI utilities for developers. Built with [MkDocs Material](https://squidfunk.github.io/mkdocs-material/) and automatically deployed to [docs.ucli.tools](https://docs.ucli.tools).

## 🚀 Quick Start

### View Live Documentation
Visit [docs.ucli.tools](https://docs.ucli.tools) for the live documentation site.

### Test Locally (Development)

#### Prerequisites
- Python 3.8+
- pip

#### Local Development Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/ucli-tools/ucli-docs.git
   cd ucli-docs
   ```

2. **Install MkDocs and dependencies:**
   ```bash
   pip install mkdocs-material mkdocs-minify-plugin
   ```

3. **Start the development server:**
   ```bash
   mkdocs serve
   ```

4. **Open your browser** to `http://127.0.0.1:8000`

The development server supports live reloading - changes to documentation files will automatically refresh the browser.

## 📁 Project Structure

```
ucli-docs/
├── docs/                          # Documentation source files
│   ├── assets/                   # Images, logos, and static assets
│   ├── getting-started/          # Installation and setup guides
│   ├── tools/                    # Individual tool documentation
│   ├── community/                # Contributing and community resources
│   ├── development/              # Technical docs and architecture
│   └── index.md                  # Home page
├── overrides/                     # MkDocs theme customizations
│   ├── main.html                # Custom HTML template
│   └── partials/                 # Reusable HTML components
│       └── ecosystem.html       # UCLI ecosystem footer
├── .github/
│   └── workflows/
│       └── deploy-docs.yml       # GitHub Pages deployment
├── mkdocs.yml                    # MkDocs configuration
└── README.md                     # This file
```

## 🛠️ Development Commands

### Build Documentation
```bash
mkdocs build
```
Builds the static site to the `site/` directory.

### Serve Locally with Live Reload
```bash
mkdocs serve
```
Starts development server with hot reload at `http://127.0.0.1:8000`.

### Clean Build
```bash
mkdocs build --clean
```
Removes old build artifacts before building.

### Validate Links
```bash
mkdocs build --strict
```
Fails the build if there are broken links or references.

## 🎨 Customization

### Theme and Branding
The documentation uses a custom MkDocs Material theme with UCLI Tools branding:
- **Primary Color**: Orange (`#ea580c`)
- **Logo**: Terminal icon with orange accent
- **Dark Mode**: Slate theme optimized for developer experience

### Custom Components
- **Ecosystem Footer**: Links to all UCLI Tools sites
- **Code Highlighting**: Enhanced syntax highlighting
- **Navigation**: Custom sidebar with organized sections

## 🚀 Deployment

### Automatic Deployment
Documentation is automatically deployed to GitHub Pages when changes are pushed to the `main` branch via the `.github/workflows/deploy-docs.yml` workflow.

### Manual Deployment
```bash
# Build and deploy manually
mkdocs gh-deploy
```

The site will be available at `https://ucli-tools.github.io/ucli-docs/` or custom domain if configured.

## 📝 Writing Documentation

### File Structure
- Use Markdown (`.md`) files in the `docs/` directory
- Organize content in subdirectories for logical grouping
- Front matter is supported for advanced features

### MkDocs Features
- **Admonitions**: Notes, warnings, tips (`!!! note`)
- **Code blocks**: Syntax highlighting with language tags
- **Tables**: Standard Markdown tables
- **Links**: Automatic cross-references
- **Images**: Place in `docs/assets/` directory

### Example Document Structure
```markdown
# Page Title

Brief introduction paragraph.

## Section Header

Content with [links](reference/cli-commands.md) and `inline code`.

!!! tip "Pro Tip"
    Helpful advice for users.

## Code Examples

```bash
# Terminal commands
ucli build gits
```

| Feature | Status |
|---------|--------|
| Basic usage | ✅ |
| Advanced features | 🚧 |
```

## 🤝 Contributing

### Content Contributions
1. Fork the repository
2. Create a feature branch: `git checkout -b add-new-guide`
3. Make your changes to `.md` files in `docs/`
4. Test locally: `mkdocs serve`
5. Commit and push your changes
6. Submit a pull request

### Technical Contributions
- Theme customizations in `overrides/`
- MkDocs configuration in `mkdocs.yml`
- CI/CD improvements in `.github/workflows/`

### Guidelines
- Use clear, concise language
- Include practical examples
- Test all links and commands
- Follow existing documentation patterns
- Update the navigation in `mkdocs.yml` if adding new sections

## 🔍 Troubleshooting

### Common Issues

**Build fails with link errors:**
```bash
mkdocs build --strict  # Identify broken links
```

**Theme not loading correctly:**
```bash
pip install --upgrade mkdocs-material
```

**Local server not starting:**
```bash
# Check if port 8000 is available
lsof -i :8000
# Or use a different port
mkdocs serve --dev-addr=127.0.0.1:8001
```

**Assets not loading:**
- Ensure images are in `docs/assets/`
- Check file paths in Markdown
- Clear browser cache

### Getting Help
- [MkDocs Documentation](https://www.mkdocs.org/)
- [Material Theme Guide](https://squidfunk.github.io/mkdocs-material/)
- [GitHub Issues](https://github.com/ucli-tools/ucli-docs/issues)
- [Community Discussions](https://github.com/orgs/ucli-tools/discussions)

## 📄 License

Licensed under the Apache License 2.0. See [LICENSE](LICENSE) for details.

---

**Ready to contribute?** Check out our [Contributing Guide](community/contributing.md) or start by running `mkdocs serve` locally!
