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

# As the function path is persistent, we need to ensure that plugins that were
# enabled, but no longer are, get their paths removed.
for plug in $_tb/plugins/*/functions
    set -l plugname (basename (dirname $plug))
    if contains $plug $fish_function_path
        if not contains $plugname $tacklebox_plugins
            for i in (seq 1 (count $fish_function_path))
                if test $fish_function_path[$i] = $plug
                    set -e fish_function_path[$i]
                    break
                end
            end
        end
    end
end

# Same for completions
for plug in $_tb/plugins/*/completions
    set -l plugname (basename (dirname $plug))
    if contains $plug $fish_complete_path
        if not contains $plugname $tacklebox_plugins
            for i in (seq 1 (count $fish_complete_path))
                if test $fish_complete_path[$i] = $plug
                    set -e fish_complete_path[$i]
                    break
                end
            end
        end
    end
end
