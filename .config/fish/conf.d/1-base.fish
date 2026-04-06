set -U fish_greeting

fish_vi_key_bindings

fish_add_path $HOME/.bun/bin
fish_add_path $HOME/Library/pnpm
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.local/bin

set -gx EDITOR nvim
set -gx VISUAL nvim
alias vim nvim

set -gx PATH "/Users/thomasforbes/.local/state/fnm_multishells/1886_1773360806649/bin" $PATH
set -gx FNM_MULTISHELL_PATH "/Users/thomasforbes/.local/state/fnm_multishells/1886_1773360806649"
set -gx FNM_VERSION_FILE_STRATEGY "local"
set -gx FNM_DIR "/Users/thomasforbes/.local/share/fnm"
set -gx FNM_LOGLEVEL "info"
set -gx FNM_NODE_DIST_MIRROR "https://nodejs.org/dist"
set -gx FNM_COREPACK_ENABLED "false"
set -gx FNM_RESOLVE_ENGINES "true"
set -gx FNM_ARCH "arm64"

set -gx BREW_PREFIX "/opt/homebrew"
eval "$($BREW_PREFIX/bin/brew shellenv)"

set -gx PNPM_HOME "/Users/thomasforbes/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
