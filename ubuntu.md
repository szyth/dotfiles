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
cd dotfiles

# git clone astronvim (https://docs.astronvim.com) in ./astronvim/.config/nvim

# stow (use -t ~ so it targets $HOME regardless of where this repo is cloned)
stow -t ~ shell alacritty tmux astronvim astroconfig gitconfig

# tmux plugin manager + plugins (or start tmux and press prefix + I to fetch them instead)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/plugins/tmux-resurrect
git clone https://github.com/tmux-plugins/tmux-continuum ~/.tmux/plugins/tmux-continuum
```

## Private/local overrides (not tracked in git)

See `mac.md` for the `~/.gitconfig.local`, `~/.gitconfig-personal.local`, and
`~/.shell.local` templates — create these once per machine.
