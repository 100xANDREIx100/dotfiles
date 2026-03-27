# ⚙️ Dotfiles

This repository contains my personal configuration files (dotfiles) used to maintain a consistent and productive development environment across different machines.

## 🚀 Overview
The goal of this repository is to automate my workspace setup. By using symbolic links (symlinks), I can keep my system configurations synced with this Git repository, allowing for easy backups and quick deployment on new VMs or servers.

## 🗂️ Structure
This repository is modular. You can install the entire suite or pick and choose the configurations you need:

* **[Neovim (`neovim/`)](./neovim/README.md)**: A professional, lightweight IDE configuration powered by `lazy.nvim`.
* **[Bash (`bash/`)](./bash/README.md)**: An optimized Bash shell environment with a Git-aware prompt and quality-of-life aliases.

## 🛠️ General Usage
> **Note:** Always back up your existing configurations before linking!

First, clone the repository to your machine:
```bash
git clone https://github.com/100xANDREIx100/dotfiles.git ~/dotfiles
```

Once cloned, navigate to the specific directories to view their dedicated setup instructions and prerequisites.

## 📜 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
