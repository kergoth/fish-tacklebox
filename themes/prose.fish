function fish_prompt
    emit prompt

    set -l cwd (prompt_pwd)
    if test -z $cwd
        set cwd "/"
    end

    printf "\n"
    printf "%s%s%s " (set_color magenta) (whoami) (set_color normal)
    printf "at %s%s%s " (set_color yellow) (hostname|cut -d . -f 1) (set_color normal)
    printf "in %s$cwd%s" (set_color green) (set_color normal)
    printf "\n><> "
end

