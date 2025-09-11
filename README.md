# My Neovim Configuration

This repository contains my personal Neovim configuration, designed to be easily replicated on any machine using a single script.

## Features

- **Plugin Manager**: [Lazy.nvim](https://github.com/folke/lazy.nvim) for fast, declarative plugin management.
- **LSP**: Full LSP support via `mason.nvim` and `lspconfig`.
- **UI**: A modern and clean UI with `catppuccin` theme, `lualine`, `bufferline`, and `nvim-tree`.
- **Completion**: Autocompletion powered by `nvim-cmp`.
- **Telescope**: Fuzzy finding for files, buffers, and more.
- **Treesitter**: Advanced syntax highlighting and code parsing.

## Prerequisites

Before running the installation script, you need to install a **Nerd Font** to ensure all icons and symbols render correctly.

1.  Go to the [Nerd Fonts website](https://www.nerdfonts.com/font-downloads).
2.  Download a font of your choice (e.g., FiraCode Nerd Font, JetBrainsMono Nerd Font).
3.  Install the font on your system.
4.  Configure your terminal emulator to use the installed Nerd Font.

## Installation

This setup can be installed on a new machine with a single command.

1.  **Clone this repository:**

    ```bash
    git clone https://github.com/YOUR_GITHUB_USERNAME/YOUR_NVIM_CONFIG_REPO.git
    cd YOUR_NVIM_CONFIG_REPO
    ```

2.  **Run the installer script:**

    Make the script executable and run it.

    ```bash
    chmod +x install.sh
    ./install.sh
    ```

3.  **Launch Neovim:**

    Open Neovim. The plugins will be automatically installed and configured on the first launch.

    ```bash
    nvim
    ```

## How It Works

The `install.sh` script automates the following steps:

1.  **Detects Package Manager**: Identifies if the system uses `apt`, `dnf`, `pacman`, or `brew`.
2.  **Installs Dependencies**: Installs essential tools like `git`, `gcc`, `make`, `ripgrep`, `fd`, `node`, and `python`.
3.  **Installs Neovim**: Downloads the latest stable Neovim AppImage, which is a portable format that works on most Linux distributions.
4.  **Backs Up Old Config**: Safely moves any existing Neovim configuration (`~/.config/nvim`) to a backup directory.
5.  **Clones This Repository**: Clones this configuration into `~/.config/nvim`.

After the script finishes, `lazy.nvim` takes over on the first run to install all the plugins defined in the `lua/plugins/` directory.
