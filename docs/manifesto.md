# UCLI-TOOLS MANIFESTO

## Our Vision
UCLI-Tools is a genuine approach to making technology accessible to everyone.
We combine the power of AI and open source to democratize knowledge and practical
technology applications, ensuring they are easy to use and available to all.

## Our Approach
1.  **Simplicity**: The Uncomplicated Command Line Interface (UCLI) makes complex
    tools accessible through simple, consistent commands.

2.  **Modularity**: Each tool is a standalone bash script that can be used
    independently or as part of the larger ecosystem.

3.  **Standardization**: All tools follow the same pattern with help, install,
    and uninstall functions, making them predictable and easy to learn.

4.  **Longevity**: We build for Ubuntu LTS releases (e.g., 2024's 5-year LTS),
    ensuring tools remain functional and relevant for years.

5.  **Adaptability**: Our design makes it easy to adapt tools to new Ubuntu
    versions as they are released.

## How It Works
UCLI-Tools is built on a simple yet powerful concept:

*   All applications are bash scripts, making them lightweight and portable.
*   A standard Makefile pattern is used across all tools for consistency.
*   The UCLI command serves as the central interface to build and access all tools.
*   Once built, tools are accessible directly from the command line.

For example, after building the 'gits' tool:
```bash
ucli build gits
```
You can use it directly from the command line:
```bash
gits clone-all
```

## Our Commitment
We are committed to:
*   Maintaining open source under the Apache 2.0 ThreeFold license
*   Creating tools that solve real-world problems
*   Building a community of contributors and users
*   Continuously improving and expanding our toolkit

## Get Started with UCLI

1.  **Install UCLI**:
    First, install the UCLI main script. Run these commands in your terminal one by one:
    ```bash
    wget https://raw.githubusercontent.com/ucli-tools/ucli/main/ucli.sh
    bash ./ucli.sh install
    rm ./ucli.sh
    ```
    This makes the `ucli` command available system-wide.

2.  **Default Login**:
    Upon installation, UCLI is configured to access tools from the `ucli-tools` GitHub organization by default.
    You can add other sources later if needed.

3.  **Install Prerequisites**:
    Some tools may require common prerequisite software. You can install them by running:
    ```bash
    ucli prereq
    ```

4.  **Build and Install Tools**:
    To install a specific tool, for example 'gits', run:
    ```bash
    ucli build gits
    ```
    This downloads the tool and makes it available as a command (e.g., `gits`).

5.  **Build All Available Tools**:
    To download and install all tools available from the default `ucli-tools` organization:
    ```bash
    ucli build-all
    ```

6.  **Update Tools**:
    Keep your tools up-to-date with the latest releases:
    ```bash
    ucli update
    ```

## Join Us
UCLI-Tools is more than just software—it's a movement to make technology
more accessible, understandable, and useful for everyone. Whether you're
a developer, a system administrator, or just someone who wants to get
things done efficiently, UCLI-Tools is for you.

Visit us at: [https://github.com/ucli-tools](https://github.com/ucli-tools)
License: Apache 2.0 ThreeFold

To learn how to create tools aligned with the UCLI vision,
run: `ucli-docs prompt`.


**MAKING TECHNOLOGY FOR EVERYONE**

