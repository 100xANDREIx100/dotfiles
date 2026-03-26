# ⚙️ Dotfiles

This repository contains my personal configuration files (dotfiles) used to maintain a consistent and productive development environment across different machines.

## 🚀 Overview
The goal of this repository is to automate my workspace setup. By using symbolic links (symlinks), I can keep my system configurations synced with this Git repository, allowing for easy backups and quick deployment on new VMs or servers.

## 🗂️ Structure
- `.bashrc`: Optimized Bash shell with Git-aware prompt and QoL aliases.
- `init.lua`: Professional Neovim configuration for a lightweight IDE experience.

## 🛠️ Installation

> **Note:** Always back up your existing configurations before linking!

1. **Clone the repository:**
   ```bash
   git clone [https://github.com/100xANDREIx100/dotfiles.git](https://github.com/100xANDREIx100/dotfiles.git) ~/dotfiles
   ```
2. **Link the configurations:**
    ```bash
        # Link Bash
        ln -sf ~/dotfiles/.bashrc ~/.bashrc

        # Link Neovim
        mkdir -p ~/.config/nvim
        ln -sf ~/dotfiles/init.lua ~/.config/nvim/init.lua
    ```
3. **Apply changes**
    ```bash
        source ~/.bashrc
    ```

**📜 License
    This project is licensed under the MIT License - see the LICENSE file for details.
