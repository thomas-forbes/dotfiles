set -U fish_greeting

fish_add_path $HOME/.bun/bin
fish_add_path $HOME/Library/pnpm
fish_add_path $HOME/.cargo/bin

set -x BREW_PREFIX "/opt/homebrew"
eval "$($BREW_PREFIX/bin/brew shellenv)"

function fish_prompt
    set_color red
    if git rev-parse --is-inside-work-tree >/dev/null 2>/dev/null
        set -l branch (git branch --show-current 2>/dev/null)
        if test -n "$branch"
            set_color magenta
            echo -n " [$branch] "
        end
    end

    set_color cyan
    echo -n (prompt_pwd)

    if test $status -eq 0
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
    abbr -a zedc "zed .; exit"
    abbr -a lg lazygit
    abbr -a gh-repo-push "gh repo create --source=. --private --push"

    yadm status -s
end
