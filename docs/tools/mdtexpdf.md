# mdtexpdf - Markdown to PDF Converter

[![Status: Production Ready](https://img.shields.io/badge/status-production%20ready-green.svg)](https://docs.ucli.tools)
[![License: Apache 2.0](https://img.shields.io/badge/license-Apache%202.0-blue.svg)](https://github.com/ucli-tools/mdtexpdf/blob/main/LICENSE)

`mdtexpdf` is a professional command-line tool that converts Markdown documents to beautifully formatted PDF files using LaTeX. It combines the simplicity of Markdown with the power of LaTeX typesetting for high-quality document generation.

## Overview

mdtexpdf bridges the gap between simple Markdown writing and professional PDF output. Whether you need academic papers, technical documentation, reports, or books, mdtexpdf provides the tools to create publication-ready documents with mathematical equations, code syntax highlighting, and professional formatting.

## Key Features

- **LaTeX-Powered Output** - Professional typesetting quality
- **Mathematical Equations** - Full LaTeX math support (inline and display)
- **Code Highlighting** - Syntax highlighting for code blocks
- **Custom Templates** - Flexible document styling
- **YAML Frontmatter** - Document metadata and configuration
- **Multi-Format Support** - Articles, books, and custom layouts
- **Unicode Support** - Full CJK character support
- **Header/Footer Control** - Three-tier policy system
- **Cross-Platform** - Works on Linux, macOS, and Windows

## Installation

### Via UCLI (Recommended)

```bash
# Install ucli tool manager first
curl -fsSL https://install.ucli.tools | bash

# Install mdtexpdf
ucli build mdtexpdf
```

### Manual Installation

```bash
# Clone and install
git clone https://github.com/ucli-tools/mdtexpdf.git
cd mdtexpdf
make install
```

## Prerequisites

### Required Software

- **Pandoc** - Document conversion engine
- **LaTeX Distribution** - TeXLive, MacTeX, or MiKTeX
- **Required LaTeX Packages** - Automatically checked by mdtexpdf

### Installation by Platform

#### Ubuntu/Debian
```bash
# Install prerequisites
sudo apt update
sudo apt install -y pandoc texlive-latex-base texlive-latex-recommended texlive-latex-extra texlive-science

# For CJK support (optional)
sudo apt install -y fonts-noto-cjk
```

#### macOS
```bash
# Install MacTeX (large download)
brew install --cask mactex

# Or BasicTeX (smaller)
brew install --cask basictex

# Install pandoc
brew install pandoc
```

#### Windows
```bash
# Install MiKTeX
# Download from: https://miktex.org/download

# Install pandoc
# Download from: https://pandoc.org/installing.html
```

## Usage

### Basic Conversion

#### Convert Markdown to PDF
```bash
mdtexpdf convert document.md
```

#### Specify Output File
```bash
mdtexpdf convert document.md output.pdf
```

#### Convert with Metadata
```bash
mdtexpdf convert -t "My Document" -a "Author Name" document.md
```

### Command-Line Options

#### Document Information
```bash
-t, --title TITLE        # Set document title
-a, --author AUTHOR      # Set document author
-d, --date DATE          # Set document date
-f, --footer TEXT        # Set custom footer text
```

#### Document Structure
```bash
--no-numbers             # Disable section numbering
--toc                    # Enable table of contents
--toc-depth N            # TOC depth (1-5, default: 2)
```

#### Layout Control
```bash
--header-footer-policy POLICY  # Header/footer policy (default/partial/all)
--no-footer                    # Disable footer completely
--format FORMAT               # Document format (article/book)
```

### Interactive Mode

Run without arguments for interactive mode:
```bash
mdtexpdf
```

The interactive mode will prompt for:
- Document title and author
- Template selection
- Output filename
- Additional options

### Creating New Documents

#### Generate Template Document
```bash
mdtexpdf create new-document.md
```

#### Create with Metadata
```bash
mdtexpdf create new-document.md "Document Title" "Author Name"
```

This creates a new Markdown file with:
- YAML frontmatter template
- Sample content sections
- LaTeX math examples
- Code block examples

## Document Configuration

### YAML Frontmatter

Add metadata to your Markdown documents:

```yaml
---
title: "Advanced Research Paper"
author: "Dr. Jane Smith"
date: "2025-12-22"
subtitle: "A Comprehensive Study"
email: "jane.smith@university.edu"

# Document structure
format: "article"                   # "article" or "book"
toc: true                           # Enable table of contents
toc_depth: 3                        # TOC depth
section_numbers: true               # Enable section numbering

# Headers and footers
header_footer_policy: "all"         # "default", "partial", or "all"
footer: "© 2025 University. All rights reserved."
pageof: true                        # "Page X of Y" format
date_footer: true                   # Include date in footer
---
```

### Header/Footer Policies

#### Default Policy
- No headers/footers on title, part, or chapter pages
- Headers/footers on regular content pages

#### Partial Policy
- Headers/footers on part and chapter pages
- No headers/footers on title page

#### All Policy
- Headers/footers on ALL pages including title page

### Document Formats

#### Article Format
- Clean academic paper layout
- Title page with author information
- Suitable for papers, reports, and technical documentation

#### Book Format
- Full-page title layout
- Chapter-based organization
- Enhanced typography
- Suitable for books, theses, and long documents

## LaTeX Integration

### Mathematical Equations

#### Inline Math
```latex
The equation $E = mc^2$ is fundamental to relativity.
```

#### Display Math
```latex
The Pythagorean theorem states:
\[
a^2 + b^2 = c^2
\]

For a right triangle with legs $a$ and $b$, and hypotenuse $c$.
```

#### Equation Environments
```latex
\begin{equation}
\frac{d}{dx} \int_a^x f(t) \, dt = f(x)
\label{eq:fundamental-theorem}
\end{equation}
```

### Code Highlighting

#### Syntax Highlighted Code Blocks
```python
def fibonacci(n):
    """Generate Fibonacci sequence up to n terms."""
    if n <= 0:
        return []
    elif n == 1:
        return [0]
    elif n == 2:
        return [0, 1]

    sequence = [0, 1]
    for i in range(2, n):
        sequence.append(sequence[i-1] + sequence[i-2])

    return sequence
```

#### Inline Code
Use `backticks` for inline code formatting.

### Tables

Markdown tables are automatically converted to LaTeX tables:

```markdown
| Method | Accuracy | Time (s) |
|--------|----------|----------|
| Linear | 85.2%    | 0.12     |
| SVM    | 91.7%    | 2.34     |
| Neural | 94.1%    | 45.67    |
```

### Lists and Structure

- **Numbered lists** convert to LaTeX enumerations
- **Bullet lists** convert to LaTeX itemizations
- **Headings** create document structure
- **Links and references** are preserved

## Advanced Features

### Custom Templates

#### Using Custom Templates
```bash
# Specify template file
mdtexpdf convert --template custom.tex document.md
```

#### Template Structure
Templates should include:
- Document class definition
- Package imports
- Page layout settings
- Custom commands and environments

### Batch Processing

#### Convert Multiple Files
```bash
# Convert all .md files in directory
for file in *.md; do
    mdtexpdf convert "$file"
done
```

#### Automation Scripts
```bash
#!/bin/bash
# Batch convert with consistent settings

OPTIONS="-t 'Research Papers' -a 'Research Team' --header-footer-policy all"

for file in papers/*.md; do
    output="${file%.md}.pdf"
    mdtexpdf convert $OPTIONS "$file" "$output"
done
```

### CI/CD Integration

#### GitHub Actions Example
```yaml
- name: Generate Documentation PDF
  run: |
    mdtexpdf convert README.md docs.pdf \
      -t "Project Documentation" \
      -a "Development Team" \
      --toc \
      --header-footer-policy all
```

## Customization

### Template Customization

#### Modifying Default Template
1. Locate installed template: `/usr/local/share/mdtexpdf/template.tex`
2. Copy to custom location
3. Modify LaTeX settings
4. Use with `--template` option

#### Common Customizations
- Change fonts and font sizes
- Adjust margins and page layout
- Add custom LaTeX packages
- Modify header/footer styles
- Add institutional branding

### Color Schemes

While the default is black and white for print, you can add color:

```latex
\usepackage{xcolor}
\definecolor{accent}{HTML}{EA580C}  % Orange accent color
```

### Institutional Styles

For universities or companies:

```yaml
---
title: "Thesis Title"
author: "Student Name"
institution: "University Name"
department: "Department of Computer Science"
degree: "Master of Science"
---
```

## Troubleshooting

### Common Issues

#### LaTeX Package Missing
```bash
# Ubuntu/Debian
sudo apt install texlive-latex-extra

# Check for specific packages
apt search texlive- | grep <package-name>
```

#### Pandoc Version Issues
```bash
# Check pandoc version
pandoc --version

# Update pandoc if needed
# Ubuntu: sudo apt install pandoc
# macOS: brew install pandoc
```

#### Unicode/Encoding Problems
```bash
# Ensure UTF-8 encoding
file document.md

# Convert if needed
iconv -f latin1 -t utf8 document.md > document_utf8.md
```

#### Long Equations Breaking
The tool automatically handles long equations, but for manual control:

```latex
\begin{multline}
    \frac{\partial}{\partial x} \left( \frac{\partial u}{\partial y} \right)
    + \frac{\partial}{\partial y} \left( \frac{\partial u}{\partial x} \right) \\
    = \frac{\partial^2 u}{\partial x \partial y} + \frac{\partial^2 u}{\partial y \partial x}
    = \nabla^2 u
\end{multline}
```

### Performance Optimization

#### Large Documents
```bash
# Use faster LaTeX engines
mdtexpdf convert --latex-engine xelatex document.md

# Or LuaLaTeX for better Unicode support
mdtexpdf convert --latex-engine lualatex document.md
```

#### Batch Processing
```bash
# Parallel processing for multiple documents
parallel mdtexpdf convert {} {.}.pdf ::: *.md
```

### Debug Mode

Enable verbose output:
```bash
mdtexpdf convert --verbose document.md
```

## Examples

### Academic Paper

```markdown
---
title: "Deep Learning Approaches for Natural Language Processing"
author: "Dr. Sarah Johnson"
date: "2025-12-22"
format: "article"
toc: true
toc_depth: 2
header_footer_policy: "default"
---

# Introduction

Natural Language Processing (NLP) has seen remarkable advances...

## Background

The field of NLP encompasses several key areas:

- **Syntax Analysis**: Understanding grammatical structure
- **Semantic Analysis**: Extracting meaning from text
- **Discourse Analysis**: Understanding context and relationships

## Methodology

We employed several deep learning architectures:

### Transformer Architecture

The transformer model revolutionized NLP with self-attention:

$$ \text{Attention}(Q, K, V) = \softmax\left(\frac{QK^T}{\sqrt{d_k}}\right)V $$

Where $Q$, $K$, and $V$ represent queries, keys, and values respectively.
```

### Technical Documentation

```markdown
---
title: "API Reference Guide"
author: "Development Team"
format: "article"
toc: true
toc_depth: 3
header_footer_policy: "all"
footer: "© 2025 Company Name. All rights reserved."
---

# Authentication

## Bearer Token Authentication

```bash
curl -H "Authorization: Bearer YOUR_TOKEN" \
     https://api.example.com/endpoint
```

## API Key Authentication

```bash
curl -H "X-API-Key: YOUR_API_KEY" \
     https://api.example.com/endpoint
```

## Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `api_key` | string | Yes | Your API key |
| `format` | string | No | Response format (json/xml) |
| `limit` | integer | No | Maximum results (1-100) |
```

### Book Format

```markdown
---
title: "Mastering DevOps"
author: "Jane Smith"
subtitle: "A Comprehensive Guide"
email: "jane@techbooks.com"
format: "book"
toc: true
toc_depth: 2
header_footer_policy: "all"
---

# Part I: Foundations

# Chapter 1: Introduction to DevOps

DevOps represents a cultural and technical movement...

## The DevOps Culture

DevOps is not just about tools; it's about culture...

## Key Principles

- **Collaboration**: Breaking down silos between development and operations
- **Automation**: Reducing manual processes and human error
- **Continuous Improvement**: Learning from failures and successes
- **Customer Focus**: Delivering value to end users
```

## Integration with Other Tools

### Documentation Workflows

#### GitBook Alternative
```bash
# Convert GitBook-style markdown to PDF
mdtexpdf convert --format book README.md handbook.pdf
```

#### Sphinx Integration
```bash
# Convert Sphinx RST to Markdown first, then to PDF
pandoc -f rst -t markdown input.rst | mdtexpdf convert - output.pdf
```

### Academic Writing

#### LaTeX-Compatible Output
mdtexpdf generates standard LaTeX that can be further customized:

```bash
# Generate LaTeX intermediate file
mdtexpdf convert --keep-tex document.md

# Then manually edit document.tex
# Finally compile with pdflatex
pdflatex document.tex
```

#### Bibliography Support
```latex
% Add to custom template
\usepackage[style=apa]{biblatex}
\addbibresource{references.bib}
```

### CI/CD Integration

#### Automated Documentation
```yaml
# .github/workflows/docs.yml
name: Build Documentation
on: [push, pull_request]

jobs:
  docs:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Setup LaTeX
        run: |
          sudo apt-get update
          sudo apt-get install texlive-latex-base texlive-latex-recommended
      - name: Install mdtexpdf
        run: |
          pip install pandoc
          # Install mdtexpdf via ucli or direct download
      - name: Generate PDF
        run: mdtexpdf convert README.md docs.pdf --toc
      - name: Upload artifact
        uses: actions/upload-artifact@v3
        with:
          name: documentation-pdf
          path: docs.pdf
```

## Contributing

### Development Setup

```bash
# Clone repository
git clone https://github.com/ucli-tools/mdtexpdf.git
cd mdtexpdf

# Install development dependencies
make dev-setup

# Run tests
make test

# Install locally for testing
make install-dev
```

### Adding Features

1. **Template Changes**: Modify `templates/template.tex`
2. **Script Updates**: Edit `mdtexpdf.sh`
3. **Testing**: Add test cases for new features
4. **Documentation**: Update this guide

### Template Development

Templates use standard LaTeX with placeholders:

- `$title$` - Document title
- `$author$` - Document author
- `$date$` - Document date
- `$footer$` - Custom footer text
- `$content$` - Converted Markdown content

## Changelog

### Version 2.0.0
- Multi-format support (article/book)
- Header/footer policy system
- Enhanced Unicode support
- YAML frontmatter configuration
- Improved error handling

### Version 1.5.0
- LaTeX math equation support
- Custom template system
- Code syntax highlighting
- Table of contents generation

### Version 1.0.0
- Initial release
- Basic Markdown to PDF conversion
- Template-based formatting
- Cross-platform support

## Support

- **Documentation**: [docs.ucli.tools/tools/mdtexpdf](https://docs.ucli.tools/tools/mdtexpdf)
- **Issues**: [GitHub Issues](https://github.com/ucli-tools/mdtexpdf/issues)
- **Discussions**: [Community Forums](https://github.com/ucli-tools/community/discussions)

## License

Licensed under the Apache License 2.0. See [LICENSE](https://github.com/ucli-tools/mdtexpdf/blob/main/LICENSE) for details.

---

**Ready to create beautiful PDFs?** Try `ucli build mdtexpdf` to get started!
