# MkDocs Documentation Makefile (using uv)

.PHONY: serve build clean install deploy help

# Default target
help:
	@echo "UCLI Docs - MkDocs Commands"
	@echo ""
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  install   Install MkDocs and dependencies via uv"
	@echo "  serve     Start local development server (http://127.0.0.1:8000)"
	@echo "  build     Build static site to ./site directory"
	@echo "  clean     Remove built site directory"
	@echo "  deploy    Deploy to GitHub Pages"
	@echo "  help      Show this help message"

# Install dependencies with uv
install:
	uv pip install mkdocs mkdocs-material

# Serve locally with live reload
serve:
	uv run mkdocs serve

# Build static site
build:
	uv run mkdocs build

# Build with strict mode (catches broken links)
build-strict:
	uv run mkdocs build --strict

# Clean build directory
clean:
	rm -rf site/

# Deploy to GitHub Pages
deploy:
	uv run mkdocs gh-deploy

# Rebuild (clean + build)
rebuild: clean build
