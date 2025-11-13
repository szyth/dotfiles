# Fully compatible with Mac and Ubuntu

## Steps:
1. Clone this repo
2. Install required packages
3. Stow

Refer `ubuntu.md` and `mac.md` for detailed setup

---
## Todo:
- Export astroconfig custom keybinds to `.vimrc`

---
## Notes:
- Default shell: Bash
- For full IDE setup use Astronvim. dont stow `vim` or `nvim`
- For Quick VM setup:
    - Dotfiles: `tmux, vim`
    - install `xclip`: for `tmux` yellow copy system-wide
    - install `neovim` only if `vim --version | grep clipboard` returns `-clipboard`, neovim has `+clipboard` required for system-wide copy
        - Then link `.vimrc` to neovim
        ```bash
        mkdir -p ~/.config/nvim && ln -s ~/.vimrc ~/.config/nvim/init.vim
        ```
    - Note: System-wide copy in (neo)vim does not work over SSH. Refer plugin `osc52`

---

### Unstow package
```bash
# unlink all stow. stow -D <dir>
cd ~/dotfiles && for d in */ ; do stow -D "${d%/}"; done
```

