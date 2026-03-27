# 🐚 Bash Configuration

This directory contains my `.bashrc` configuration, engineered to create a safer, more informative, and highly efficient terminal experience.

## ✨ Features

### Professional History Management
* Retains a massive history (50,000 commands).
* Automatically ignores duplicate commands and lines starting with a space to keep the history clean.
* Adds timestamps to the `history` command output.

### Git-Aware Prompt
* Features a custom, color-coded terminal prompt.
* Automatically parses and displays the current Git branch when navigating inside a repository.

### Shortcuts & Aliases
* **Safety Nets:** `rm`, `cp`, and `mv` are aliased to `-i` to prompt for confirmation before overwriting/deleting.
* **Navigation:** Quick aliases like `..`, `...`, `ll`, `la`, and `l`.
* **Git:** Fast shortcuts for daily workflows (`gs` for status, `ga` for add, `gc` for commit, `gp` for push, and `gl` for a clean history graph).
* **System:** Shortcuts like `myip` (fetches public IP) and `ports` (displays active network ports).
* **Neovim:** Routes `vi`, `vim`, and `v` directly to `nvim`.

## 🛠️ Installation (Linux / macOS)
To apply this configuration, create a symbolic link pointing to your home directory:

```bash
ln -sfn ~/dotfiles/bash/.bashrc ~/.bashrc
```

Once linked, reload your shell to apply the changes:
```bash
source ~/.bashrc
```
