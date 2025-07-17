```bash
# on a fresh mac
# install firefox, brew

brew install stow alarcitty tmux nvim hammerspoon ripgrep
curl https://sh.rustup.rs -sSf | sh
echo "source ~/.bash.mac" >> ~/.bash_profile
echo "source ~/.shell.common" >> ~/.bash_profile

# install given font

git clone https://github.com/szyth/dotfiles.git

# remove .DS_Store files
find . -name '.DS_Store' -print -delete

# git clone astronvim (https://docs.astronvim.com) in $HOME/dotfiles/astronvim/.config/nvim

# stow
stow hammerspoon shell alacritty tmux astronvim astroconfig
```
