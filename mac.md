```bash
git clone https://github.com/szyth/dotfiles.git
cd dotfiles

# INSTALL PACKAGES
# stow git alacritty tmux nvim astronvim cargo rust-analyzer 
# install given font

# remove .DS_Store files
find . -name '.DS_Store' -print -delete

echo "source ~/.bash.mac" >> ~/.bashrc
echo "source ~/.shell.common" >> ~/.bashrc
# git clone astronvim (https://docs.astronvim.com) in ./astronvim/.config/nvim

# stow
stow hammerspoon shell alacritty tmux astronvim astroconfig
```