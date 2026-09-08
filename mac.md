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

# stow (use -t ~ so it targets $HOME regardless of where this repo is cloned)
stow -t ~ hammerspoon shell alacritty tmux astronvim astroconfig gitconfig
```

## Private/local overrides (not tracked in git)

The tracked `gitconfig/.gitconfig` and `shell/.shell.common` only reference local
files that live outside this repo — create them once per machine:

`~/.gitconfig.local` (default/work identity):
```gitconfig
[user]
	name = your name
	email = you@example.com
[core]
	sshCommand = "ssh -i ~/.ssh/id_ed25519 -o IdentitiesOnly=yes"
```

`~/.gitconfig-personal.local` (used only for repos under `~/Downloads/self/`):
```gitconfig
[user]
	name = your personal name
	email = you@personal-example.com
[core]
	sshCommand = "ssh -i ~/.ssh/id_ed25519_personal -o IdentitiesOnly=yes"
```

`~/.shell.local` (private/company-specific aliases, sourced automatically if present):
```bash
alias myproj='cd $HOME/path/to/project'
```
