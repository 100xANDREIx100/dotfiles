# 🌙 Neovim Configuration

This directory contains my professional Neovim configuration, designed to provide a lightweight IDE experience. 

## ✨ Features & Plugins
This setup uses **[lazy.nvim](https://github.com/folke/lazy.nvim)** as the plugin manager and includes:
* **UI & Theming:** TokyoNight theme, Mononoki Nerd Font for UI elements, and Neo-tree for visual file exploration.
* **Fuzzy Finding:** Telescope for instant file and text searching.
* **LSP & Autocompletion:** Mason for managing language servers (configured out-of-the-box for Java via `jdtls`), and `nvim-cmp` for auto-completion.
* **Quality of Life:** `nvim-autopairs` for auto-closing brackets/quotes, and `Comment.nvim` for quick commenting.
* **Neovide Support:** Smooth cursor animations and customized GUI font rendering.

## 🧰 Prerequisites
Before linking the dotfiles, ensure the following tools are installed so Neovim and its plugins function correctly:
* **[Git](https://git-scm.com/):** Required by `lazy.nvim` to clone and update plugins.
* **[Ripgrep](https://github.com/BurntSushi/ripgrep):** Required by Telescope for the `live_grep` text search functionality.
* **[Java JDK](https://adoptium.net/):** Required to run `jdtls` (the Java Language Server) for code completion.
* **[Mononoki Nerd Font](https://www.nerdfonts.com/):** Required for Neovide and `neo-tree` to render UI and file icons correctly.

## ⌨️ Keybindings
* **Leader Key:** `Space`
* **File Explorer:** `<Ctrl-n>` (Toggle Neo-tree)
* **Find Files:** `<Leader>ff` (Telescope)
* **Search Text:** `<Leader>fg` (Telescope Live Grep)

## 🛠️ Installation

### 🐧 Linux / macOS
Remove any existing configuration and link the directory:
```bash
rm -rf ~/.config/nvim
ln -sfn ~/dotfiles/neovim/nvim ~/.config/nvim
```

### 🪟 Windows
Open Command Prompt and create a Directory Junction:
```cmd
mklink /J "%LOCALAPPDATA%\nvim" "C:\Users\<YourUsername>\dotfiles\neovim\nvim"
```
