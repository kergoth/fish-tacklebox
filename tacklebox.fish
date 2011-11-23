set -g _tb $tacklebox_path

. $_tb/core/core.fish

if set -q tacklebox_theme
    . $_tb/themes/$tacklebox_theme.fish
end

for plug in $tacklebox_plugins
    set -l plugdir $_tb/plugins/$plug

    for f in $plugdir/*.fish
        . $f
    end

    if test -e $plugdir/completions
        if not contains $plugdir/completions $fish_complete_path
            set fish_complete_path $plugdir/completions $fish_complete_path
        end
    end
    if test -e $plugdir/functions
        if not contains $plugdir/functions $fish_function_path
            set fish_function_path $plugdir/functions $fish_function_path
        end
    end
end
