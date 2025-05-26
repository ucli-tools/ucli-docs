#!/bin/bash

# ANSI color codes
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
GREEN='\033[0;32m'
RED='\033[0;31m'
ORANGE='\033[38;5;208m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Function to display the manifesto
show_manifesto() {
    if [ "$1" == "--markdown" ]; then
        echo "# UCLI-TOOLS MANIFESTO"
        echo ""
        echo "## Our Vision"
        echo "UCLI-Tools is a genuine approach to making technology accessible to everyone."
        echo "We combine the power of AI and open source to democratize knowledge and practical"
        echo "technology applications, ensuring they are easy to use and available to all."
        echo ""
        echo "## Our Approach"
        echo "1.  **Simplicity**: The Uncomplicated Command Line Interface (UCLI) makes complex"
        echo "    tools accessible through simple, consistent commands."
        echo ""
        echo "2.  **Modularity**: Each tool is a standalone bash script that can be used"
        echo "    independently or as part of the larger ecosystem."
        echo ""
        echo "3.  **Standardization**: All tools follow the same pattern with help, install,"
        echo "    and uninstall functions, making them predictable and easy to learn."
        echo ""
        echo "4.  **Longevity**: We build for Ubuntu LTS releases (e.g., 2024's 5-year LTS),"
        echo "    ensuring tools remain functional and relevant for years."
        echo ""
        echo "5.  **Adaptability**: Our design makes it easy to adapt tools to new Ubuntu"
        echo "    versions as they are released."
        echo ""
        echo "## How It Works"
        echo "UCLI-Tools is built on a simple yet powerful concept:"
        echo ""
        echo "*   All applications are bash scripts, making them lightweight and portable."
        echo "*   A standard Makefile pattern is used across all tools for consistency."
        echo "*   The UCLI command serves as the central interface to build and access all tools."
        echo "*   Once built, tools are accessible directly from the command line."
        echo ""
        echo "For example, after building the 'gits' tool:"
        echo "\`\`\`bash"
        echo "ucli build gits"
        echo "\`\`\`"
        echo "You can use it directly from the command line:"
        echo "\`\`\`bash"
        echo "gits clone-all"
        echo "\`\`\`"
        echo ""
        echo "## Our Commitment"
        echo "We are committed to:"
        echo "*   Maintaining open source under the Apache 2.0 ThreeFold license"
        echo "*   Creating tools that solve real-world problems"
        echo "*   Building a community of contributors and users"
        echo "*   Continuously improving and expanding our toolkit"
        echo ""
        echo "## Get Started with UCLI"
        echo ""
        echo "1.  **Install UCLI**:"
        echo "    First, install the UCLI main script. Run these commands in your terminal one by one:"
        echo "    \`\`\`bash"
        echo "    wget https://raw.githubusercontent.com/ucli-tools/ucli/main/ucli.sh"
        echo "    bash ./ucli.sh install"
        echo "    rm ./ucli.sh"
        echo "    \`\`\`"
        echo "    This makes the \`ucli\` command available system-wide."
        echo ""
        echo "2.  **Default Login**:"
        echo "    Upon installation, UCLI is configured to access tools from the \`ucli-tools\` GitHub organization by default."
        echo "    You can add other sources later if needed."
        echo ""
        echo "3.  **Install Prerequisites**:"
        echo "    Some tools may require common prerequisite software. You can install them by running:"
        echo "    \`\`\`bash"
        echo "    ucli prereq"
        echo "    \`\`\`"
        echo ""
        echo "4.  **Build and Install Tools**:"
        echo "    To install a specific tool, for example 'gits', run:"
        echo "    \`\`\`bash"
        echo "    ucli build gits"
        echo "    \`\`\`"
        echo "    This downloads the tool and makes it available as a command (e.g., \`gits\`)."
        echo ""
        echo "5.  **Build All Available Tools**:"
        echo "    To download and install all tools available from the default \`ucli-tools\` organization:"
        echo "    \`\`\`bash"
        echo "    ucli build-all"
        echo "    \`\`\`"
        echo ""
        echo "6.  **Update Tools**:"
        echo "    Keep your tools up-to-date with the latest releases:"
        echo "    \`\`\`bash"
        echo "    ucli update"
        echo "    \`\`\`"
        echo ""
        echo "## Join Us"
        echo "UCLI-Tools is more than just software—it's a movement to make technology"
        echo "more accessible, understandable, and useful for everyone. Whether you're"
        echo "a developer, a system administrator, or just someone who wants to get"
        echo "things done efficiently, UCLI-Tools is for you."
        echo ""
        echo "Visit us at: [https://github.com/ucli-tools](https://github.com/ucli-tools)"
        echo "License: Apache 2.0 ThreeFold"
        echo ""
        echo "To learn how to create tools aligned with the UCLI vision,"
        echo "run: \`ucli-docs prompt\`."
        echo ""
        echo ""
        echo "**MAKING TECHNOLOGY FOR EVERYONE**"
        echo ""
        return
    fi

    clear
    echo -e "${BOLD}${CYAN}═══════════════════════════════════════════════════════════════════════════${NC}"
    echo -e "${BOLD}${CYAN}                        UCLI-TOOLS MANIFESTO                               ${NC}"
    echo -e "${BOLD}${CYAN}═══════════════════════════════════════════════════════════════════════════${NC}\n"

    echo -e "${BOLD}${GREEN}Our Vision${NC}"
    echo -e "UCLI-Tools is a genuine approach to making technology accessible to everyone."
    echo -e "We combine the power of AI and open source to democratize knowledge and practical"
    echo -e "technology applications, ensuring they are easy to use and available to all.\n"

    echo -e "${BOLD}${GREEN}Our Approach${NC}"
    echo -e "1. ${YELLOW}Simplicity${NC}: The Uncomplicated Command Line Interface (UCLI) makes complex"
    echo -e "   tools accessible through simple, consistent commands.\n"
    echo -e "2. ${YELLOW}Modularity${NC}: Each tool is a standalone bash script that can be used"
    echo -e "   independently or as part of the larger ecosystem.\n"
    echo -e "3. ${YELLOW}Standardization${NC}: All tools follow the same pattern with help, install,"
    echo -e "   and uninstall functions, making them predictable and easy to learn.\n"
    echo -e "4. ${YELLOW}Longevity${NC}: We build for Ubuntu LTS releases (e.g., 2024's 5-year LTS),"
    echo -e "   ensuring tools remain functional and relevant for years.\n"
    echo -e "5. ${YELLOW}Adaptability${NC}: Our design makes it easy to adapt tools to new Ubuntu"
    echo -e "   versions as they are released.\n"

    echo -e "${BOLD}${GREEN}How It Works${NC}"
    echo -e "UCLI-Tools is built on a simple yet powerful concept:\n"
    echo -e "• ${BLUE}All applications are bash scripts${NC}, making them lightweight and portable."
    echo -e "• ${BLUE}A standard Makefile pattern${NC} is used across all tools for consistency."
    echo -e "• ${BLUE}The UCLI command${NC} serves as the central interface to build and access all tools."
    echo -e "• ${BLUE}Once built${NC}, tools are accessible directly from the command line.\n"
    echo -e "For example, after building the 'gits' tool:"
    echo -e "  ${PURPLE}ucli build gits${NC}"
    echo -e "You can use it directly from the command line:"
    echo -e "  ${PURPLE}gits clone-all${NC}\n"

    echo -e "${BOLD}${GREEN}Our Commitment${NC}"
    echo -e "We are committed to:"
    echo -e "• Maintaining open source under the Apache 2.0 ThreeFold license"
    echo -e "• Creating tools that solve real-world problems"
    echo -e "• Building a community of contributors and users"
    echo -e "• Continuously improving and expanding our toolkit\n"

    echo -e "${BOLD}${GREEN}Get Started with UCLI${NC}\n"
    echo -e "1. ${YELLOW}Install UCLI:${NC}"
    echo -e "   First, install the UCLI main script. Run these commands in your terminal one by one:"
    echo -e "     ${PURPLE}wget https://raw.githubusercontent.com/ucli-tools/ucli/main/ucli.sh${NC}"
    echo -e "     ${PURPLE}bash ./ucli.sh install${NC}"
    echo -e "     ${PURPLE}rm ./ucli.sh${NC}"
    echo -e "   This makes the ${GREEN}ucli${NC} command available system-wide.\n"
    echo -e "2. ${YELLOW}Default Login:${NC}"
    echo -e "   Upon installation, UCLI is configured to access tools from the ${BLUE}ucli-tools${NC} GitHub organization by default."
    echo -e "   You can add other sources later if needed.\n"
    echo -e "3. ${YELLOW}Install Prerequisites:${NC}"
    echo -e "   Some tools may require common prerequisite software. You can install them by running:"
    echo -e "     ${PURPLE}ucli prereq${NC}\n"
    echo -e "4. ${YELLOW}Build and Install Tools:${NC}"
    echo -e "   To install a specific tool, for example 'gits', run:"
    echo -e "     ${PURPLE}ucli build gits${NC}"
    echo -e "   This downloads the tool and makes it available as a command (e.g., ${GREEN}gits${NC}).\n"
    echo -e "5. ${YELLOW}Build All Available Tools:${NC}"
    echo -e "   To download and install all tools available from the default ${BLUE}ucli-tools${NC} organization:"
    echo -e "     ${PURPLE}ucli build-all${NC}\n"
    echo -e "6. ${YELLOW}Update Tools:${NC}"
    echo -e "   Keep your tools up-to-date with the latest releases:"
    echo -e "     ${PURPLE}ucli update${NC}\n"

    echo -e "${BOLD}${GREEN}Join Us${NC}"
    echo -e "UCLI-Tools is more than just software—it's a movement to make technology"
    echo -e "more accessible, understandable, and useful for everyone. Whether you're"
    echo -e "a developer, a system administrator, or just someone who wants to get"
    echo -e "things done efficiently, UCLI-Tools is for you.\n"

    echo -e "Visit us at: ${BLUE}https://github.com/ucli-tools${NC}"
    echo -e "License: ${BLUE}Apache 2.0 ThreeFold${NC}\n"

    echo -e "${CYAN}To learn how to create tools aligned with the UCLI vision,${NC}"
    echo -e "${CYAN}run: ${GREEN}ucli-docs prompt${NC}.\n"

    echo -e "${BOLD}${CYAN}═══════════════════════════════════════════════════════════════════════════${NC}"
    echo -e "${BOLD}${CYAN}                     MAKING TECHNOLOGY FOR EVERYONE                         ${NC}"
    echo -e "${BOLD}${CYAN}═══════════════════════════════════════════════════════════════════════════${NC}\n"
}

# Function to install the script
install() {
    echo
    echo -e "${GREEN}Installing UCLI-Docs...${NC}"
    if sudo -v; then
        sudo cp "$0" /usr/local/bin/ucli-docs
        sudo chown root:root /usr/local/bin/ucli-docs
        sudo chmod 755 /usr/local/bin/ucli-docs

        echo
        echo -e "${PURPLE}UCLI-Docs has been installed successfully.${NC}"
        echo -e "You can now use ${GREEN}ucli-docs${NC} command from anywhere."
        echo
        echo -e "Use ${BLUE}ucli-docs help${NC} to see the commands."
        echo
    else
        echo -e "${RED}Error: Failed to obtain sudo privileges. Installation aborted.${NC}"
        exit 1
    fi
}

# Function to uninstall the script
uninstall() {
    echo
    echo -e "${GREEN}Uninstalling UCLI-Docs...${NC}"
    if sudo -v; then
        sudo rm -f /usr/local/bin/ucli-docs
        echo -e "${PURPLE}UCLI-Docs has been uninstalled successfully.${NC}"
        echo
    else
        echo -e "${RED}Error: Failed to obtain sudo privileges. Uninstallation aborted.${NC}"
        exit 1
    fi
}

# Help function
help() {
    echo -e "\n${ORANGE}═══════════════════════════════════════════${NC}"
    echo -e "${ORANGE}              UCLI-Docs                    ${NC}"
    echo -e "${ORANGE}═══════════════════════════════════════════${NC}\n"

    echo -e "${PURPLE}Description:${NC} UCLI-Docs displays the UCLI-Tools manifesto and mission statement."
    echo -e "${PURPLE}Usage:${NC}       ucli-docs [command]"
    echo -e "${PURPLE}License:${NC}     Apache 2.0 ThreeFold"
    echo -e "${PURPLE}Code:${NC}        https://github.com/ucli-tools/home\n"

    echo -e "${BOLD}${GREEN}Get Started with UCLI${NC}\\\\n"
    echo -e "1. ${YELLOW}Install UCLI:${NC}"
    echo -e "   First, install the UCLI main script. Run these commands in your terminal one by one:"
    echo -e "     ${PURPLE}wget https://raw.githubusercontent.com/ucli-tools/ucli/main/ucli.sh${NC}"
    echo -e "     ${PURPLE}bash ./ucli.sh install${NC}"
    echo -e "     ${PURPLE}rm ./ucli.sh${NC}"
    echo -e "   This makes the ${GREEN}ucli${NC} command available system-wide.\\\\n"
    echo -e "2. ${YELLOW}Default Login:${NC}"
    echo -e "   Upon installation, UCLI is configured to access tools from the ${BLUE}ucli-tools${NC} GitHub organization by default."
    echo -e "   You can add other sources later if needed.\\\\n"
    echo -e "3. ${YELLOW}Install Prerequisites:${NC}"
    echo -e "   Some tools may require common prerequisite software. You can install them by running:"
    echo -e "     ${PURPLE}ucli prereq${NC}\\\\n"
    echo -e "4. ${YELLOW}Build and Install Tools:${NC}"
    echo -e "   To install a specific tool, for example 'gits', run:"
    echo -e "     ${PURPLE}ucli build gits${NC}"
    echo -e "   This downloads the tool and makes it available as a command (e.g., ${GREEN}gits${NC}).\\\\n"
    echo -e "5. ${YELLOW}Build All Available Tools:${NC}"
    echo -e "   To download and install all tools available from the default ${BLUE}ucli-tools${NC} organization:"
    echo -e "     ${PURPLE}ucli build-all${NC}\\\\n"
    echo -e "6. ${YELLOW}Update Tools:${NC}"
    echo -e "   Keep your tools up-to-date with the latest releases:"
    echo -e "     ${PURPLE}ucli update${NC}\\\\n"

    echo -e "${CYAN}To learn how to create tools aligned with the UCLI vision,${NC}"
    echo -e "${CYAN}run: ${GREEN}ucli-docs prompt${NC}\\\\n"

    echo -e "${PURPLE}Commands:${NC}"
    echo -e "  ${GREEN}(no command)${NC}"
    echo -e "                  ${BLUE}Actions:${NC} Display the UCLI-Tools manifesto"
    echo -e "                  ${BLUE}Example:${NC} ucli-docs\n"

    echo -e "  ${GREEN}prompt${NC}"
    echo -e "                  ${BLUE}Actions:${NC} Display AI prompt information for working with ucli-tools"
    echo -e "                  ${BLUE}Example:${NC} ucli-docs prompt\n"

    echo -e "  ${GREEN}install${NC}"
    echo -e "                  ${BLUE}Actions:${NC} Install ucli-docs to /usr/local/bin"
    echo -e "                  ${BLUE}Example:${NC} ucli-docs install\n"

    echo -e "  ${GREEN}uninstall${NC}"
    echo -e "                  ${BLUE}Actions:${NC} Remove ucli-docs from /usr/local/bin"
    echo -e "                  ${BLUE}Example:${NC} ucli-docs uninstall\n"

    echo -e "  ${GREEN}help${NC}"
    echo -e "                  ${BLUE}Actions:${NC} Display this help message"
    echo -e "                  ${BLUE}Example:${NC} ucli-docs help\n"

    echo -e "  ${GREEN}docs${NC}"
    echo -e "                  ${BLUE}Actions:${NC} Export embedded manifesto and AI prompt guide to Markdown files"
    echo -e "                           (./docs/manifesto.md and ./docs/prompt.md relative to script's current location)."
    echo -e "                           ${YELLOW}This command is for developers to update docs in a local repository clone.${NC}"
    echo -e "                           It will not run if 'ucli-docs' is executed from a system-wide install path."
    echo -e "                  ${BLUE}Example:${NC} ./ucli-docs.sh docs  (Run from the script's directory in your local repository)\\\\n"
}

# Function to export docs to Markdown
export_docs() {
    local SCRIPT_DIR
{{ ... }}
    SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

    # Check if the script is being run from a typical system installation path
    if [[ "$SCRIPT_DIR" == "/usr/local/bin" || "$SCRIPT_DIR" == "/usr/bin" || "$SCRIPT_DIR" == "/bin" || "$SCRIPT_DIR" == "/sbin" ]]; then
        echo -e "${RED}Error: The 'docs' command is intended for updating documentation files within a local repository checkout.${NC}"
        echo -e "${YELLOW}It should not be run from an installed system location like '$SCRIPT_DIR'.${NC}"
        echo -e "${CYAN}To update repository docs, navigate to the script's directory in your local repository and run: bash ./ucli-docs.sh docs${NC}"
        exit 1
    fi

    local DOCS_DIR="$SCRIPT_DIR/docs"

    echo -e "${GREEN}Exporting documentation to Markdown files...${NC}"
    echo -e "${BLUE}Target directory: $DOCS_DIR${NC}" # Added for clarity

    if mkdir -p "$DOCS_DIR"; then
        echo -e "${BLUE}Ensured directory exists: $DOCS_DIR${NC}"
    else
        echo -e "${RED}Error: Could not create directory $DOCS_DIR${NC}"
        exit 1
    fi

    if show_manifesto --markdown > "$DOCS_DIR/manifesto.md"; then
        echo -e "${GREEN}Successfully exported manifesto to: $DOCS_DIR/manifesto.md${NC}"
    else
        echo -e "${RED}Error: Failed to export manifesto.${NC}"
    fi

    if show_prompt_info --markdown > "$DOCS_DIR/prompt.md"; then
        echo -e "${GREEN}Successfully exported AI prompt guide to: $DOCS_DIR/prompt.md${NC}"
    else
        echo -e "${RED}Error: Failed to export AI prompt guide.${NC}"
    fi
    echo
    echo -e "${PURPLE}Documentation export complete.${NC}"
    echo -e "${YELLOW}Make sure to commit any changes to the docs/ directory if you are managing this in a git repository.${NC}"
}

# Function to display AI prompt information
show_prompt_info() {
    if [ "$1" == "--markdown" ]; then
        echo "# AI PROMPT GUIDE FOR UCLI-TOOLS"
        echo ""
        echo ""
        echo "This prompt can be fed to an AI. This allows AI to quickly understand the"
        echo "vision and design of the UCLI tools, allowing anyone to create tools with ease."
        echo ""
        echo "## UCLI-Tools Design Pattern"
        echo "The UCLI-Tools project follows a consistent design pattern that makes it easy"
        echo "to create, build, and use command-line tools on Ubuntu systems. This guide"
        echo "provides information for AI systems to understand and work with this pattern."
        echo ""
        echo "## Directory Structure"
        echo "Each tool typically follows this structure:"
        echo "\`\`\`"
        echo "toolname/"
        echo "├── toolname.sh    - Main bash script (executable)"
        echo "├── Makefile       - Standard Makefile for installation"
        echo "├── LICENSE        - Apache 2.0 ThreeFold license"
        echo "└── README.md      - Documentation"
        echo "\`\`\`"
        echo ""
        echo "## Standard Makefile Pattern"
        echo "All tools use this standard Makefile pattern:"
        echo "\`\`\`makefile"
        echo "# Get the script name dynamically based on sole script in repo"
        echo "SCRIPT_NAME := \$(wildcard *.sh)"
        echo "INSTALL_NAME := \$(basename \$(SCRIPT_NAME))"
        echo ""
        echo "build:"
        echo "	bash \$(SCRIPT_NAME) install"
        echo ""
        echo "rebuild:"
        echo "	\$(INSTALL_NAME) uninstall"
        echo "	bash \$(SCRIPT_NAME) install"
        echo ""
        echo "delete:"
        echo "	\$(INSTALL_NAME) uninstall"
        echo "\`\`\`"
        echo ""
        echo "## Bash Script Structure"
        echo "Each tool's bash script should include these standard functions:"
        echo "*   \`install()\`      - Installs the tool to \`/usr/local/bin\`"
        echo "*   \`uninstall()\`    - Removes the tool from \`/usr/local/bin\`"
        echo "*   \`help()\`         - Displays help information"
        echo "*   \`main()\`         - Main execution logic with command handling"
        echo ""
        echo "## UCLI Integration"
        echo "Tools are designed to be built and managed through the UCLI command:"
        echo "*   \`ucli build toolname\`    - Builds and installs the tool"
        echo "*   \`ucli list\`              - Lists available tools"
        echo "*   \`ucli update\`            - Updates all installed tools"
        echo ""
        echo "## Best Practices for AI-Generated Tools"
        echo "1.  Follow the standard directory structure."
        echo "2.  Use the standard Makefile pattern exactly as shown."
        echo "3.  Include all required functions in the bash script."
        echo "4.  Use consistent color coding for terminal output (as demonstrated in ucli-docs.sh)."
        echo "5.  Include comprehensive help documentation."
        echo "6.  Follow the Apache 2.0 ThreeFold license."
        echo ""
        echo "## Example: Creating a New UCLI Tool ('mytool')"
        echo "Follow these steps to develop and integrate your own tool, for example, one named 'mytool':"
        echo ""
        echo "  **Part 1: Local Tool Development**"
        echo "  1.  **Create Project Directory**: Make a directory for your tool: \`mkdir mytool && cd mytool\`"
        echo "  2.  **Develop Bash Script**: Create your main tool script, e.g., \`mytool.sh\`."
        echo "      Ensure it includes the standard \`install()\`, \`uninstall()\`, \`help()\`, and \`main()\` functions."
        echo "  3.  **Add Standard Makefile**: Create a file named \`Makefile\` in your \`mytool/\` directory."
        echo "      Copy the exact content of the 'Standard Makefile Pattern' (shown above) into this file."
        echo "  4.  **Include License**: Create a \`LICENSE\` file in \`mytool/\` with the Apache 2.0 ThreeFold license text."
        echo "  5.  **Write Documentation**: Create a \`README.md\` file in \`mytool/\` explaining how to use your tool."
        echo ""
        echo "  **Part 2: GitHub Integration and UCLI Build**"
        echo "  6.  **Create GitHub Repository**:"
        echo "      *   Create a new public GitHub repository. The repository name **must match** your tool's script name (e.g., \`mytool\` for \`mytool.sh\`)."
        echo "      *   This repository can be under your personal GitHub account or an organization."
        echo "      *   Push your \`mytool.sh\`, \`Makefile\`, \`LICENSE\`, and \`README.md\` files to this repository."
        echo "  7.  **Configure UCLI Access**:"
        echo "      *   If your repository is not under the default \`ucli-tools\` organization, you'll need to tell UCLI about your GitHub username or organization."
        echo "      *   Use the command: \`ucli login <your_github_username_or_org>\`"
        echo "  8.  **Build with UCLI**:"
        echo "      *   Now, you (or others) can build and install your tool using UCLI:"
        echo "          \`\`\`bash"
        echo "          ucli build mytool"
        echo "          \`\`\`"
        echo ""
        echo "This process ensures your tool is discoverable and manageable through the UCLI ecosystem."
        echo ""
        echo ""
        echo "**CREATING CONSISTENT UCLI TOOLS**"
        echo ""
        return
    fi

    clear
    echo -e "${BOLD}${CYAN}═══════════════════════════════════════════════════════════════════════════${NC}"
    echo -e "${BOLD}${CYAN}                  AI PROMPT GUIDE FOR UCLI-TOOLS                           ${NC}"
    echo -e "${BOLD}${CYAN}═══════════════════════════════════════════════════════════════════════════${NC}\n"

    echo -e "This prompt can be fed to an AI. This allows AI to quickly understand the"
    echo -e "vision and design of the UCLI tools, allowing anyone to create tools with ease.\n"

    echo -e "${BOLD}${GREEN}UCLI-Tools Design Pattern${NC}"
    echo -e "The UCLI-Tools project follows a consistent design pattern that makes it easy"
    echo -e "to create, build, and use command-line tools on Ubuntu systems. This guide"
    echo -e "provides information for AI systems to understand and work with this pattern.\n"

    echo -e "${BOLD}${GREEN}Directory Structure${NC}"
    echo -e "Each tool typically follows this structure:"
    echo -e "  ${BLUE}toolname/${NC}          - Main directory for the tool"
    echo -e "  ${BLUE}├── toolname.sh${NC}    - Main bash script (executable)"
    echo -e "  ${BLUE}├── Makefile${NC}       - Standard Makefile for installation"
    echo -e "  ${BLUE}├── LICENSE${NC}        - Apache 2.0 ThreeFold license"
    echo -e "  ${BLUE}└── README.md${NC}      - Documentation\n"

    echo -e "${BOLD}${GREEN}Standard Makefile Pattern${NC}"
    echo -e "All tools use this standard Makefile pattern:"
    echo -e "${YELLOW}# Get the script name dynamically based on sole script in repo"
    echo -e "SCRIPT_NAME := \$(wildcard *.sh)"
    echo -e "INSTALL_NAME := \$(basename \$(SCRIPT_NAME))"
    echo -e ""
    echo -e "build:"
    echo -e "\tbash \$(SCRIPT_NAME) install"
    echo -e ""
    echo -e "rebuild:"
    echo -e "\t\$(INSTALL_NAME) uninstall"
    echo -e "\tbash \$(SCRIPT_NAME) install"
    echo -e ""
    echo -e "delete:"
    echo -e "\t\$(INSTALL_NAME) uninstall${NC}\n"

    echo -e "${BOLD}${GREEN}Bash Script Structure${NC}"
    echo -e "Each tool's bash script should include these standard functions:"
    echo -e "  ${BLUE}install()${NC}      - Installs the tool to /usr/local/bin"
    echo -e "  ${BLUE}uninstall()${NC}    - Removes the tool from /usr/local/bin"
    echo -e "  ${BLUE}help()${NC}         - Displays help information"
    echo -e "  ${BLUE}main()${NC}         - Main execution logic with command handling\n"

    echo -e "${BOLD}${GREEN}UCLI Integration${NC}"
    echo -e "Tools are designed to be built and managed through the UCLI command:"
    echo -e "  ${PURPLE}ucli build toolname${NC}    - Builds and installs the tool"
    echo -e "  ${PURPLE}ucli list${NC}              - Lists available tools"
    echo -e "  ${PURPLE}ucli update${NC}            - Updates all installed tools\n"

    echo -e "${BOLD}${GREEN}Best Practices for AI-Generated Tools${NC}"
    echo -e "1. ${YELLOW}Follow the standard directory structure${NC}"
    echo -e "2. ${YELLOW}Use the standard Makefile pattern exactly as shown${NC}"
    echo -e "3. ${YELLOW}Include all required functions in the bash script${NC}"
    echo -e "4. ${YELLOW}Use consistent color coding for terminal output${NC} (as demonstrated in ucli-docs.sh)"
    echo -e "5. ${YELLOW}Include comprehensive help documentation${NC}"
    echo -e "6. ${YELLOW}Follow the Apache 2.0 ThreeFold license${NC}\n"

    echo -e "${BOLD}${GREEN}Example: Creating a New UCLI Tool ('mytool')${NC}"
    echo -e "Follow these steps to develop and integrate your own tool, for example, one named 'mytool':\n"

    echo -e "  ${YELLOW}Part 1: Local Tool Development${NC}"
    echo -e "  1. ${CYAN}Create Project Directory:${NC} Make a directory for your tool: ${BLUE}mkdir mytool && cd mytool${NC}"
    echo -e "  2. ${CYAN}Develop Bash Script:${NC} Create your main tool script, e.g., ${BLUE}mytool.sh${NC}."
    echo -e "     Ensure it includes the standard ${BLUE}install(), uninstall(), help(),${NC} and ${BLUE}main()${NC} functions."
    echo -e "  3. ${CYAN}Add Standard Makefile:${NC} Create a file named ${BLUE}Makefile${NC} in your ${BLUE}mytool/${NC} directory."
    echo -e "     Copy the exact content of the 'Standard Makefile Pattern' (shown above) into this file."
    echo -e "  4. ${CYAN}Include License:${NC} Create a ${BLUE}LICENSE${NC} file in ${BLUE}mytool/${NC} with the Apache 2.0 ThreeFold license text."
    echo -e "  5. ${CYAN}Write Documentation:${NC} Create a ${BLUE}README.md${NC} file in ${BLUE}mytool/${NC} explaining how to use your tool.\n"

    echo -e "  ${YELLOW}Part 2: GitHub Integration and UCLI Build${NC}"
    echo -e "  6. ${CYAN}Create GitHub Repository:${NC}"
    echo -e "     - Create a new public GitHub repository. The repository name ${BOLD}must match${NC} your tool's script name (e.g., ${BLUE}mytool${NC} for ${BLUE}mytool.sh${NC})."
    echo -e "     - This repository can be under your personal GitHub account or an organization."
    echo -e "     - Push your ${BLUE}mytool.sh, Makefile, LICENSE,${NC} and ${BLUE}README.md${NC} files to this repository."
    echo -e "  7. ${CYAN}Configure UCLI Access:${NC}"
    echo -e "     - If your repository is not under the default ${BLUE}ucli-tools${NC} organization, you'll need to tell UCLI about your GitHub username or organization."
    echo -e "     - Use the command: ${PURPLE}ucli login <your_github_username_or_org>${NC}"
    echo -e "  8. ${CYAN}Build with UCLI:${NC}"
    echo -e "     - Now, you (or others) can build and install your tool using UCLI:"
    echo -e "       ${PURPLE}ucli build mytool${NC}\n"

    echo -e "This process ensures your tool is discoverable and manageable through the UCLI ecosystem.\n"

    echo -e "${BOLD}${CYAN}═══════════════════════════════════════════════════════════════════════════${NC}"
    echo -e "${BOLD}${CYAN}                  CREATING CONSISTENT UCLI TOOLS                           ${NC}"
    echo -e "${BOLD}${CYAN}═══════════════════════════════════════════════════════════════════════════${NC}\n"
}

# Main execution logic
main() {
    if [ $# -eq 0 ]; then
        show_manifesto
        exit 0
    fi

    case "$1" in
        install)
            install
            ;;
        uninstall)
            uninstall
            ;;
        prompt)
            show_prompt_info
            ;;
        docs)
            export_docs
            ;;
        help)
            help
            ;;
        *)
            echo -e "${RED}Error: Command '$1' not found in ucli-docs${NC}"
            echo -e "Run '${GREEN}ucli-docs help${NC}' for usage information."
            exit 1
            ;;
    esac
}

# Run the main function
main "$@"
