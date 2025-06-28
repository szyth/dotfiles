```bash
# on a fresh ubuntu
sudo apt install git curl  -y

sudo apt install stow tmux xclip -y
sudo snap install alacritty --classic
sudo snap install nvim --classic
curl https://sh.rustup.rs -sSf | sh
echo "source ~/.bash.ubuntu" >> .bashrc
echo "source ~/.shell.common" >> .bashrc

# todo ripgrep

# git clone astronvim (https://docs.astronvim.com) in ./astronvim/.config/nvim
stow shell alacritty tmux astronvim astroconfig
```
