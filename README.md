```bash
git clone https://github.com/szyth/dotfiles.git
cd dotfiles

# install `stow` with brew or apt

# remove .DS_Store files
find . -name '.DS_Store' -print -delete

# stow
stow hammerspoon shell alacritty tmux astronvim

# add following in .bashrc
source ~/.shell_common
PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ " # do echo $PS1 first

# add following in .zshrc
source ~/.shell_common
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
