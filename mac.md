```bash
# INSTALL PACKAGES
# stow git alacritty tmux nvim astronvim cargo rust-analyzer 
echo "source ~/.bash.mac" >> ~/.bashrc
echo "source ~/.shell.common" >> ~/.bashrc

# install given font

git clone https://github.com/szyth/dotfiles.git
# remove .DS_Store files
find . -name '.DS_Store' -print -delete

# git clone astronvim (https://docs.astronvim.com) in ./astronvim/.config/nvim

# stow
stow hammerspoon shell alacritty tmux astronvim astroconfig
```
