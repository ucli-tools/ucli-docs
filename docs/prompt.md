# AI PROMPT GUIDE FOR UCLI-TOOLS


This prompt can be fed to an AI. This allows AI to quickly understand the
vision and design of the UCLI tools, allowing anyone to create tools with ease.

## UCLI-Tools Design Pattern
The UCLI-Tools project follows a consistent design pattern that makes it easy
to create, build, and use command-line tools on Ubuntu systems. This guide
provides information for AI systems to understand and work with this pattern.

## Directory Structure
Each tool typically follows this structure:
```
toolname/
├── toolname.sh    - Main bash script (executable)
├── Makefile       - Standard Makefile for installation
├── LICENSE        - Apache 2.0 ThreeFold license
└── README.md      - Documentation
```

## Standard Makefile Pattern
All tools use this standard Makefile pattern:
```makefile
# Get the script name dynamically based on sole script in repo
SCRIPT_NAME := $(wildcard *.sh)
INSTALL_NAME := $(basename $(SCRIPT_NAME))

build:
	bash $(SCRIPT_NAME) install

rebuild:
	$(INSTALL_NAME) uninstall
	bash $(SCRIPT_NAME) install

delete:
	$(INSTALL_NAME) uninstall
```

## Bash Script Structure
Each tool's bash script should include these standard functions:
*   `install()`      - Installs the tool to `/usr/local/bin`
*   `uninstall()`    - Removes the tool from `/usr/local/bin`
*   `help()`         - Displays help information
*   `main()`         - Main execution logic with command handling

## UCLI Integration
Tools are designed to be built and managed through the UCLI command:
*   `ucli build toolname`    - Builds and installs the tool
*   `ucli list`              - Lists available tools
*   `ucli update`            - Updates all installed tools

## Best Practices for AI-Generated Tools
1.  Follow the standard directory structure.
2.  Use the standard Makefile pattern exactly as shown.
3.  Include all required functions in the bash script.
4.  Use consistent color coding for terminal output (as demonstrated in ucli-docs.sh).
5.  Include comprehensive help documentation.
6.  Follow the Apache 2.0 ThreeFold license.

## Example: Creating a New UCLI Tool ('mytool')
Follow these steps to develop and integrate your own tool, for example, one named 'mytool':

  **Part 1: Local Tool Development**
  1.  **Create Project Directory**: Make a directory for your tool: `mkdir mytool && cd mytool`
  2.  **Develop Bash Script**: Create your main tool script, e.g., `mytool.sh`.
      Ensure it includes the standard `install()`, `uninstall()`, `help()`, and `main()` functions.
  3.  **Add Standard Makefile**: Create a file named `Makefile` in your `mytool/` directory.
      Copy the exact content of the 'Standard Makefile Pattern' (shown above) into this file.
  4.  **Include License**: Create a `LICENSE` file in `mytool/` with the Apache 2.0 ThreeFold license text.
  5.  **Write Documentation**: Create a `README.md` file in `mytool/` explaining how to use your tool.

  **Part 2: GitHub Integration and UCLI Build**
  6.  **Create GitHub Repository**:
      *   Create a new public GitHub repository. The repository name **must match** your tool's script name (e.g., `mytool` for `mytool.sh`).
      *   This repository can be under your personal GitHub account or an organization.
      *   Push your `mytool.sh`, `Makefile`, `LICENSE`, and `README.md` files to this repository.
  7.  **Configure UCLI Access**:
      *   If your repository is not under the default `ucli-tools` organization, you'll need to tell UCLI about your GitHub username or organization.
      *   Use the command: `ucli login <your_github_username_or_org>`
  8.  **Build with UCLI**:
      *   Now, you (or others) can build and install your tool using UCLI:
          ```bash
          ucli build mytool
          ```

This process ensures your tool is discoverable and manageable through the UCLI ecosystem.


**CREATING CONSISTENT UCLI TOOLS**

