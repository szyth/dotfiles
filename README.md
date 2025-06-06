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
# for NVIM: only astronvim, not using any vim or nvim stow
# default shell: bash

# unlink all stow. stow -D <dir>
cd ~/dotfiles && for d in */ ; do stow -D "${d%/}"; done
```
