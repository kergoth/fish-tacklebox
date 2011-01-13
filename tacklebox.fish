set -g tb $tacklebox_path

. $tb/core/core.fish
. $tb/themes/$tacklebox_theme.fish

for plug in $tacklebox_plugins
    for f in $tb/plugins/$plug/*.fish
        . $f
    end
end
