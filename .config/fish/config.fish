set -U fish_greeting

# path
fish_add_path $HOME/.bun/bin
fish_add_path $HOME/Library/pnpm
fish_add_path $HOME/.cargo/bin

# nvim
set -gx EDITOR nvim
set -gx VISUAL nvim
alias vim nvim

# node
set -gx PATH "/Users/thomasforbes/.local/state/fnm_multishells/1886_1773360806649/bin" $PATH;
set -gx FNM_MULTISHELL_PATH "/Users/thomasforbes/.local/state/fnm_multishells/1886_1773360806649";
set -gx FNM_VERSION_FILE_STRATEGY "local";
set -gx FNM_DIR "/Users/thomasforbes/.local/share/fnm";
set -gx FNM_LOGLEVEL "info";
set -gx FNM_NODE_DIST_MIRROR "https://nodejs.org/dist";
set -gx FNM_COREPACK_ENABLED "false";
set -gx FNM_RESOLVE_ENGINES "true";
set -gx FNM_ARCH "arm64";

# brew
set -x BREW_PREFIX "/opt/homebrew"
eval "$($BREW_PREFIX/bin/brew shellenv)"

function fish_prompt
    set -l last_status $status

    set_color red
    if git rev-parse --is-inside-work-tree >/dev/null 2>/dev/null
        set -l branch (git branch --show-current 2>/dev/null)
        if test -n "$branch"
            set_color magenta
            echo -n "[$branch] "
            if test -n "$(git status --porcelain 2>/dev/null)"
                set_color yellow
                echo -n "• "
            end
        end
    end

    set_color cyan
    echo -n (prompt_pwd)

    if test $last_status -eq 0
        set_color green
        echo -n ' > '
    else
        set_color red
        echo -n ' > '
    end

    set_color normal
end

function fish_right_prompt
    set_color brblack
    echo -n (date "+%H:%M:%S")
    set_color normal
end

if status is-interactive
    abbr -a c clear
    abbr -a e exit
    abbr -a l "ls -la"
    abbr -a zc "zed .; exit"
    abbr -a zn "zed -n"
    abbr -a lg lazygit
    abbr -a gh-repo-push "gh repo create --source=. --private --push"

    yadm status -s
end
