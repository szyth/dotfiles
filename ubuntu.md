```bash
# on a fresh ubuntu
sudo apt install git curl stow tmux xclip ripgrep fd-find -y
sudo snap install alacritty --classic
sudo snap install nvim --classic
curl https://sh.rustup.rs -sSf | sh
echo "source ~/.bash.ubuntu" >> ~/.bashrc
echo "source ~/.shell.common" >> ~/.bashrc

# install Font

git clone https://github.com/szyth/dotfiles.git  

# git clone astronvim (https://docs.astronvim.com) in ./astronvim/.config/nvim

stow shell alacritty tmux astronvim astroconfig
```
