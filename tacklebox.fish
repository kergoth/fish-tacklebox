set -g _tb $tacklebox_path

. $_tb/core/core.fish

if set -q tacklebox_theme
    . $_tb/themes/$tacklebox_theme.fish
end

for plug in $tacklebox_plugins
    for f in $_tb/plugins/$plug/*.fish
        . $f
    end
    for comp in $_tb/plugins/$plug/completions
        set fish_complete_path $comp $fish_complete_path
    end
    for func in $_tb/plugins/$plug/functions
        set fish_function_path $func $fish_function_path
    end
end
