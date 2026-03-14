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
