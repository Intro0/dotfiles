# AGENTS.md - Neovim Configuration Guidelines

## Commands
- **Format code**: `stylua .` (formats all Lua files)
- **Check syntax**: No dedicated linter configured
- **Run tests**: No test framework configured

## Code Style
- **Language**: Lua
- **Formatting**: 2-space indentation, 120 column width (via stylua.toml)
- **Imports**: Use `require()` for modules
- **Naming**: snake_case for variables/functions, PascalCase for modules
- **Tables**: Use consistent formatting with proper indentation
- **Comments**: Minimal comments, prefer self-documenting code
- **Error handling**: Use `vim.notify()` for user-facing errors, `error()` for fatal issues
- **Plugin specs**: Return table from plugin files, use `opts` for configuration