# Dotfiles

Personal macOS development environment configuration files.

## Contents

### Shell & Terminal
- `.zshrc` - Zsh shell configuration
- `.zprofile` - Zsh profile (sets up Homebrew, Python PATH)
- `.wezterm.lua` - WezTerm terminal emulator config
- `.tmux.conf` - tmux terminal multiplexer config
- `starship.toml` - Starship prompt configuration
- `warp/` - Warp terminal keybindings and themes

### Git
- `.gitconfig` - Git configuration
- `.gitignore_global` - Global gitignore patterns

### Editors & IDEs
- `nvim/` - Neovim editor configuration
- `cursor/custom.css` - Cursor editor custom CSS
- `cursor/cli-config.json` - Cursor CLI configuration
- `cursor/commands/` - Cursor slash commands
- `zed/settings.json` - Zed editor settings
- `zed/keymap.json` - Zed keyboard shortcuts

> **Note**: Cursor stores some settings per-project. The global settings here include CSS, CLI config, and custom commands.

### System Tools
- `karabiner/` - Karabiner keyboard customization
- `borders/bordersrc` - JankyBorders window border config
- `Brewfile` - Homebrew package list for easy app installation

## Installation

### Quick Setup

```bash
# Clone this repository
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles

# Run the installation script
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

The install script will:
- Backup any existing configuration files
- Create symlinks from your home directory to the dotfiles
- Preserve your original files in a timestamped backup folder

### Manual Installation

You can also manually symlink individual files:

```bash
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
# ... etc
```

## Post-Installation

1. **Restart your terminal** or run `source ~/.zshrc`

2. **Install Homebrew** (if not already installed):
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

3. **Install applications and tools** using the Brewfile:
   ```bash
   cd ~/dotfiles
   # Edit Brewfile first to uncomment the apps you want
   brew bundle install
   ```

   The Brewfile includes:
   - Development tools (git, neovim, node, python, rust, etc.)
   - Applications (browsers, editors, productivity tools)
   - Uncomment the ones you want before running `brew bundle install`

4. **Optional: Generate a Brewfile from your current system**:
   ```bash
   brew bundle dump --file=~/dotfiles/Brewfile --force
   ```
   This will create a Brewfile with all your currently installed packages

## Customization

Feel free to modify any configuration files for your needs. After changes:

```bash
cd ~/dotfiles
git add .
git commit -m "Update configurations"
git push
```

## Fresh macOS Setup

When setting up a new Mac:

1. Install Xcode Command Line Tools: `xcode-select --install`
2. Clone this repo: `git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles`
3. Run install script: `cd ~/dotfiles && ./install.sh`
4. Install Homebrew and restore packages (see Brewfile if you create one)
5. Configure system preferences and install applications

## What to Backup Separately

These dotfiles cover configuration, but you should also backup:

- **Documents** - `~/Documents`, `~/Desktop`
- **Projects** - `~/repos`, `~/school`, etc.
- **Application Data** - App-specific data not in dotfiles
- **SSH Keys** - `~/.ssh` (store securely, don't commit to git!)
- **API Keys/Tokens** - Any credentials or secrets
- **Browser Data** - Bookmarks, extensions, passwords
- **Notes** - Obsidian vault, notes apps
- **Photos/Media** - `~/Pictures`, `~/Movies`, etc.

## Security Note

⚠️ **Never commit sensitive information to this repository:**
- SSH private keys
- API keys or tokens
- Passwords or credentials
- Company/proprietary code

Review all files before committing to ensure no secrets are included.
