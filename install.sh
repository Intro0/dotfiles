#!/bin/bash

# Dotfiles installation script
# This script creates symlinks from home directory to dotfiles

set -e

DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

echo "Installing dotfiles..."

# Create backup directory
mkdir -p "$BACKUP_DIR"

# Function to backup and symlink
backup_and_link() {
    local file=$1
    local target=$2

    if [ -e "$target" ] && [ ! -L "$target" ]; then
        echo "Backing up existing $target"
        mv "$target" "$BACKUP_DIR/"
    elif [ -L "$target" ]; then
        echo "Removing existing symlink $target"
        rm "$target"
    fi

    echo "Creating symlink: $target -> $file"
    ln -s "$file" "$target"
}

# Symlink shell configuration files
backup_and_link "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
backup_and_link "$DOTFILES_DIR/.zprofile" "$HOME/.zprofile"

# Symlink git configuration
backup_and_link "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
backup_and_link "$DOTFILES_DIR/.gitignore_global" "$HOME/.gitignore_global"

# Symlink terminal configs
backup_and_link "$DOTFILES_DIR/.wezterm.lua" "$HOME/.wezterm.lua"
[ -f "$DOTFILES_DIR/.tmux.conf" ] && backup_and_link "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"

# Symlink .config directories
mkdir -p "$HOME/.config"
[ -f "$DOTFILES_DIR/starship.toml" ] && backup_and_link "$DOTFILES_DIR/starship.toml" "$HOME/.config/starship.toml"
[ -d "$DOTFILES_DIR/nvim" ] && backup_and_link "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
[ -d "$DOTFILES_DIR/karabiner" ] && backup_and_link "$DOTFILES_DIR/karabiner" "$HOME/.config/karabiner"
[ -d "$DOTFILES_DIR/borders" ] && backup_and_link "$DOTFILES_DIR/borders" "$HOME/.config/borders"

# Symlink editor configs
mkdir -p "$HOME/.config/cursor" "$HOME/.config/zed" "$HOME/.cursor/commands"
[ -f "$DOTFILES_DIR/cursor/custom.css" ] && backup_and_link "$DOTFILES_DIR/cursor/custom.css" "$HOME/.config/cursor/custom.css"
[ -f "$DOTFILES_DIR/cursor/cli-config.json" ] && backup_and_link "$DOTFILES_DIR/cursor/cli-config.json" "$HOME/.cursor/cli-config.json"
[ -d "$DOTFILES_DIR/cursor/commands" ] && {
    for cmd in "$DOTFILES_DIR/cursor/commands"/*.md; do
        [ -f "$cmd" ] && backup_and_link "$cmd" "$HOME/.cursor/commands/$(basename "$cmd")"
    done
}
[ -f "$DOTFILES_DIR/zed/settings.json" ] && backup_and_link "$DOTFILES_DIR/zed/settings.json" "$HOME/.config/zed/settings.json"
[ -f "$DOTFILES_DIR/zed/keymap.json" ] && backup_and_link "$DOTFILES_DIR/zed/keymap.json" "$HOME/.config/zed/keymap.json"

# Symlink Warp terminal configs
mkdir -p "$HOME/.warp"
[ -f "$DOTFILES_DIR/warp/keybindings.yaml" ] && backup_and_link "$DOTFILES_DIR/warp/keybindings.yaml" "$HOME/.warp/keybindings.yaml"
[ -d "$DOTFILES_DIR/warp/themes" ] && backup_and_link "$DOTFILES_DIR/warp/themes" "$HOME/.warp/themes"

# Note: Raycast config contains API tokens and is not included in dotfiles
# You'll need to reconfigure Raycast on new machines

echo "✓ Dotfiles installed successfully!"
echo "Backups saved to: $BACKUP_DIR"
echo ""
echo "Next steps:"
echo "1. Restart your terminal or run: source ~/.zshrc"
echo "2. Install Homebrew: /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
echo "3. Review and customize your configurations"
