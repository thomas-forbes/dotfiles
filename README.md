# Setup

## App Store

- [dark mode wallpaper switcher](https://apps.apple.com/us/app/dark-mode-wallpaper-switcher/id1488154568?mt=12)
- [rcmd](https://apps.apple.com/us/app/rcmd-app-switcher/id1596283165?mt=12)
- [horo](https://apps.apple.com/us/app/horo-timer-for-menu-bar/id1437226581?mt=12)
- [narrly](https://apps.apple.com/us/app/narrly-read-aloud-pdf-text/id6495368857)
- [drafts](https://apps.apple.com/us/app/drafts/id1435957248?mt=12)

## Misc

```fish
curl -fsSL https://bun.com/install | bash
```

## Brew

[install homebrew](https://brew.sh/)
```sh
brew install fish
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish
```

```fish
# programs
set HB_PKGS go
set -a HB_PKGS gh
set -a HB_PKGS lazygit
set -a HB_PKGS cmatrix
set -a HB_PKGS fnm
set -a HB_PKGS jq
set -a HB_PKGS uv
set -a HB_PKGS fzf
set -a HB_PKGS yadm
set -a HB_PKGS rustup
set -a HB_PKGS neovim
set -a HB_PKGS zoxide

brew install $HB_PKGS

# apps
set HB_CASKS zed
set -a HB_CASKS helium-browser
set -a HB_CASKS raycast
set -a HB_CASKS beeper
set -a HB_CASKS yaak
set -a HB_CASKS boop
set -a HB_CASKS keyboardcleantool
set -a HB_CASKS ghostty
set -a HB_CASKS tableplus
set -a HB_CASKS 1password
set -a HB_CASKS karabiner-elements
set -a HB_CASKS spotify
set -a HB_CASKS iina
set -a HB_CASKS alt-tab
set -a HB_CASKS steam
# set -a HB_CASKS sikarugir
# utils
set -a HB_CASKS rectangle
set -a HB_CASKS jordanbaird-ice
set -a HB_CASKS font-zed-mono
set -a HB_CASKS shottr

brew install --cask $HB_CASKS
```

## Cargo

```fish
set CARGO_PKGS quick-commit
set -a CARGO_PKGS tokei

cargo install $CARGO_PKGS
```
