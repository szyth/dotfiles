```bash
git clone https://github.com/szyth/dotfiles.git
cd dotfiles

# install `stow` with brew or apt

# remove .DS_Store files
find . -name '.DS_Store' -print -delete

# stow
stow hammerspoon shell alacritty tmux astronvim

# add following in .bashrc
source ~/.shell
```

Packages:
```bash
alacritty tmux nvim astronvim

# go through astronvim docs for setup and required packages (https://docs.astronvim.com)
```

Others:
```bash
# astronvim not using vim or nvim stow

# use `git status` and `git diff` to show uncommited changes and untracked files.

# unlink all stow
cd ~/dotfiles && for d in */ ; do stow -D "${d%/}"; done
```
