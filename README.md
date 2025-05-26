# ucli-docs

Welcome to `ucli-docs`, the official documentation hub for the UCLI-Tools project. This repository contains key documents outlining the vision, principles, and guidelines for UCLI-Tools. It also provides the `ucli-docs.sh` script, a convenient utility to view this documentation directly from your command line.

## What's Inside?

*   **`ucli-docs.sh`**: A shell script to easily display the documentation content (Manifesto, AI Prompt Guide) in your terminal.
*   **`docs/manifesto.md`**: The UCLI-Tools Manifesto, detailing the vision and principles of the project.
*   **`docs/prompt.md`**: The AI Prompt Guide for UCLI-Tools, offering guidelines for developing UCLI-compliant tools, especially when using AI assistance.

## Getting Started

You can access the documentation in several ways:

### 1. Using the `ucli-docs.sh` script

This is the recommended way to view the documentation via the command line.

**a) Direct Execution (without installation):**

Clone this repository or download the `ucli-docs.sh` script.
```bash
git clone https://github.com/ucli-tools/ucli-docs.git # Replace with your actual repository URL if different
cd ucli-docs
```
Then, run the script with a command:
```bash
bash ./ucli-docs.sh help         # Show help message
bash ./ucli-docs.sh manifesto   # Display the UCLI-Tools Manifesto
bash ./ucli-docs.sh prompt      # Display the AI Prompt Guide
```

**b) Installation (to use `ucli-docs` as a command):**

The `ucli-docs.sh` script can install itself for easier access.
```bash
bash ./ucli-docs.sh install
```
After installation, you can use it directly:
```bash
ucli-docs help
ucli-docs manifesto
ucli-docs prompt
ucli-docs uninstall # To remove the installed command
```

### 2. Using the Makefile (for developers)

If you have cloned the repository, you can use the Makefile:
```bash
make build    # Installs ucli-docs (equivalent to 'bash ucli-docs.sh install')
make rebuild  # Uninstalls and then reinstalls ucli-docs
make delete   # Uninstalls ucli-docs (equivalent to 'ucli-docs uninstall')
```
After `make build`, you can use `ucli-docs` as shown in section 1b.

### 3. Reading Documentation Files Directly

You can also browse the documentation files directly in the `docs` directory:

*   [UCLI-Tools Manifesto](./docs/manifesto.md) - The vision and principles of the project.
*   [AI Prompt Guide for UCLI-Tools](./docs/prompt.md) - Guidelines for developing UCLI-compliant tools, suitable for AI assistance.

## Contributing

Contributions to improve `ucli-docs` or the documentation itself are welcome! Please refer to the UCLI-Tools main project for contribution guidelines. (Note: Add a link to main project or specific contribution guidelines if available).

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](./LICENSE) file for details.
