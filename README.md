# Fully compatible with Mac and Ubuntu

```bash
git clone https://github.com/szyth/dotfiles.git
cd dotfiles

# INSTALL PACKAGES
# stow git alacritty tmux nvim astronvim cargo rust-analyzer xclip(only required for linux)
# go through astronvim docs for setup and required packages (https://docs.astronvim.com)
# install given font

# remove .DS_Store files, in Mac
find . -name '.DS_Store' -print -delete

# stow
stow hammerspoon shell alacritty tmux astronvim

# add following in .bashrc
source ~/.shell
```

Others:
```bash
# unlink all stow. stow -D <dir>
cd ~/dotfiles && for d in */ ; do stow -D "${d%/}"; done
```

Notes:
- Default shell: Bash
- For full IDE setup use Astronvim. dont stow `vim` or `nvim`
- For VM setup:
    - Dotfiles: `tmux, vim`
    - install `xclip`: for `tmux` yellow copy system-wide
    - install `neovim` only if `vim --version | grep clipboard` returns `-clipboard`, neovim has `+clipboard` required for system-wide copy
        - Then link `.vimrc` to neovim
        ```bash
        mkdir -p ~/.config/nvim
        ln -s ~/.vimrc ~/.config/nvim/init.vim
        ```
    - Note: System-wide copy in (neo)vim does not work in SSH.