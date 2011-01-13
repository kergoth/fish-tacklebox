set -g _tb $tacklebox_path

. $_tb/core/core.fish
. $_tb/themes/$tacklebox_theme.fish

for plug in $tacklebox_plugins
    for f in $_tb/plugins/$plug/*.fish
        . $f
    end
end
