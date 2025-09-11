#!/bin/bash
# =====================================================================================
#          NEOVIM CONFIGURATION INSTALLER FOR CARLOS'S SETUP
# =====================================================================================
#
# This script installs Neovim and replicates a specific configuration from a Git repo.
#

# --- CONFIGURATION ---
# !!! IMPORTANT !!!
# Replace this URL with the URL of your own Neovim configuration repository.
NVIM_CONFIG_REPO="https://github.com/carlosindriago/nvim-config.git"

# --- SCRIPT START ---
set -e # Exit immediately if a command exits with a non-zero status.

# --- Helper Functions ---
info() {
    echo -e "\033[1;34m[INFO]\033[0m $1"
}

success() {
    echo -e "\033[1;32m[SUCCESS]\033[0m $1"
}

fail() {
    echo -e "\033[1;31m[ERROR]\033[0m $1" >&2
    exit 1
}

# --- Dependency Installation ---
install_dependencies() {
    info "Detecting package manager..."
    local PKG_MANAGER=""
    local INSTALL_CMD=""

    if command -v apt-get &>/dev/null;
    then
        PKG_MANAGER="apt"
        INSTALL_CMD="sudo apt-get update && sudo apt-get install -y"
    elif command -v dnf &>/dev/null;
    then
        PKG_MANAGER="dnf"
        INSTALL_CMD="sudo dnf install -y"
    elif command -v pacman &>/dev/null;
    then
        PKG_MANAGER="pacman"
        INSTALL_CMD="sudo pacman -Syu --noconfirm"
    elif command -v brew &>/dev/null;
    then
        PKG_MANAGER="brew"
        INSTALL_CMD="brew install"
    else
        fail "No supported package manager found (apt, dnf, pacman, brew). Please install dependencies manually."
    fi

    info "Using $PKG_MANAGER to install dependencies."

    # List of dependencies
    # git: for cloning
    # gcc/make: for treesitter and telescope-fzf-native
    # ripgrep/fd-find: for telescope
    # curl/wget: for downloading nvim
    # python3-pip/nodejs/npm: for LSPs
    local deps="git gcc make ripgrep curl wget python3 python3-pip"

    if [[ "$PKG_MANAGER" == "apt" ]]; then
        deps="$deps fd-find nodejs npm"
    elif [[ "$PKG_MANAGER" == "dnf" ]]; then
        deps="$deps fd-find nodejs npm"
    elif [[ "$PKG_MANAGER" == "pacman" ]]; then
        deps="$deps fd nodejs npm"
    elif [[ "$PKG_MANAGER" == "brew" ]]; then
        deps="$deps fd node"
    fi

    info "Installing: $deps"
    $INSTALL_CMD $deps || fail "Failed to install dependencies."

    success "Dependencies installed."
}

# --- Neovim Installation ---
install_neovim() {
    if command -v nvim &>/dev/null;
    then
        info "Neovim is already installed."
        return
    fi

    info "Installing Neovim (latest stable)..."
    local nvim_appimage_path="$HOME/squashfs-root/usr/bin/nvim"
    if [ -f "$nvim_appimage_path" ]; then
        info "Neovim AppImage already exists."
        return
    fi

    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    chmod u+x nvim.appimage
    ./nvim.appimage --appimage-extract > /dev/null
    
    # Create a symlink for easy access
    if [ ! -d "$HOME/.local/bin" ]; then
        mkdir -p "$HOME/.local/bin"
    fi
    ln -sf "$HOME/squashfs-root/usr/bin/nvim" "$HOME/.local/bin/nvim"
    rm nvim.appimage

    info 'Please ensure "$HOME/.local/bin" is in your $PATH.'
    info 'You can add "export PATH=\"$HOME/.local/bin:$PATH\"" to your .bashrc or .zshrc'

    success "Neovim installed."
}

# --- Configuration Cloning ---
clone_config() {
    info "Backing up existing Neovim configuration..."
    local timestamp=$(date +%Y%m%d_%H%M%S)
    local nvim_config_dir="$HOME/.config/nvim"
    local nvim_data_dir="$HOME/.local/share/nvim"

    if [ -d "$nvim_config_dir" ]; then
        mv "$nvim_config_dir" "${nvim_config_dir}.bak.$timestamp"
        info "Backed up $nvim_config_dir to ${nvim_config_dir}.bak.$timestamp"
    fi
    if [ -d "$nvim_data_dir" ]; then
        mv "$nvim_data_dir" "${nvim_data_dir}.bak.$timestamp"
        info "Backed up $nvim_data_dir to ${nvim_data_dir}.bak.$timestamp"
    fi

    info "Cloning Neovim configuration from $NVIM_CONFIG_REPO..."
    git clone --depth 1 "$NVIM_CONFIG_REPO" "$nvim_config_dir" || fail "Failed to clone repository."
    success "Configuration cloned."
}

# --- Main Execution ---
main() {
    echo "------------------------------------------"
    echo "--- Neovim Setup by @carlos            --"
    echo "------------------------------------------"
    
    install_dependencies
    install_neovim
    clone_config

    echo 
    success "Installation complete!"
    info "IMPORTANT: Open Neovim (run 'nvim') to trigger the automatic plugin installation via lazy.nvim."
    info "Don't forget to install a Nerd Font for the best experience."
}

main
