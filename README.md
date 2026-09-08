# Fully compatible with Mac and Ubuntu

## Steps:
1. Clone this repo
2. Install required packages
3. Stow

Refer `ubuntu.md` and `mac.md` for detailed setup

---
## Notes:
- Default shell: Bash
- For full IDE setup use Astronvim. dont stow `vim` or `nvim`
- For Quick VM setup:
    - Dotfiles: `tmux, vim`
    - install `xclip`: for `tmux` yellow copy system-wide
    - install `neovim` only if `vim --version | grep clipboard` returns `-clipboard`, neovim has `+clipboard` required for system-wide copy
        - Then link `.vimrc` to neovim
        ```bash
        mkdir -p ~/.config/nvim && ln -s ~/.vimrc ~/.config/nvim/init.vim
        ```
    - Note: System-wide copy in (neo)vim does not work over SSH. Refer plugin `osc52`

---
## Todo:
- Export astroconfig custom keybinds to `.vimrc`
- hammerspoon: caffeine toggle - hotkey to block sleep/display-dim during builds/downloads/reading, with a menubar icon showing on/off
- hammerspoon: hs.hints window switcher - hotkey overlays a letter on every visible window; typing it jumps focus there, faster than repeated Cmd+Tab
- hammerspoon: workspace launcher - one hotkey opens a set of apps and snaps them into a preset window layout (e.g. terminal + browser side by side)
- hammerspoon: wifi-based automation - run an action automatically on network change, e.g. auto-start the mainnet/testnet ssh tunnel when joining a known wifi
- tmux: tmux-yank plugin - pro: copy-to-clipboard works over SSH via OSC52; con: auto-binds `y` in copy-mode-vi, would override the current "stay in copy-mode" binding unless configured around it

---

### Unstow package
```bash
# unlink all stow. stow -D <dir>. Run from wherever you cloned this repo.
for d in */ ; do stow -D -t ~ "${d%/}"; done
```

