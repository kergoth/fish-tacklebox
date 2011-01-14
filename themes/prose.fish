set -l _c_magenta (set_color magenta)
set -l _c_normal (set_color normal)
set -l _c_yellow (set_color yellow)
set -l _c_green (set_color green)
set -l _c_grey (set_color black --bold)

set -l _hg_prompt_branch "< on $_c_magenta<branch>$_c_normal>"
set -l _hg_prompt_tags "< at $_c_yellow<tags|$_c_normal, $_c_yellow>$_c_normal>"
set -l _hg_prompt_status "$_c_green<status|modified|unknown><update>$_c_normal"
set -l _hg_prompt_patches "<\npatches: <patches|join( → )|pre_applied\($_c_yellow\)|post_applied\($_c_normal\)|pre_unapplied\($_c_black --bold\)|post_unapplied\($_c_normal\)>>"
set -g _hg_prompt_all "$_hg_prompt_branch$_hg_prompt_tags$_hg_prompt_status$_hg_prompt_patches"

function hg_prompt
    h prompt --angle-brackets "$_hg_prompt_all" | grep -v abort 2>/dev/null
end

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
    printf "%s" (hg_prompt)
    printf "\n><> "
end

