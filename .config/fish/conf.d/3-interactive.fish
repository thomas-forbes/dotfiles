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
