function _tacklebox_help_generic
    echo "tacklebox"
    echo "Copyright 2011 Steve Losh and contributors"
    echo

    echo "Use 'tacklebox help PLUGIN' for more information about a plugin."
    echo

    echo "Enabled plugins:"
        for p in $tacklebox_plugins
            echo "    $p"
        end
    echo

    echo "Disabled plugins:"
        for p in (ls $_tb/plugins)
            if not contains $p $tacklebox_plugins
                echo "    $p"
            end
        end
    echo
end

function _tacklebox_help_contents
    printf "tacklebox/%s/%s\n\n" $argv[1] $argv[2]
    echo (functions $argv | strip | head -1 | sed -e 's/.*--description //' | strip | strip_quotes | strip )
end

function _tacklebox_help_plugin
    if not contains $argv[1] (ls $_tb/plugins)
        printf "Unknown plugin '%s'\n" $argv[1] >&2
        return 1
    else
        if test (count $argv) -gt 1
            _tacklebox_help_contents $argv
        else
            set -l plugin_help $_tb/plugins/$argv[1]/help.txt
            if test -f $plugin_help
                printf "tacklebox/%s\n\n" $argv[1]
                cat $plugin_help
                printf "\nRun 'tacklebox help %s ITEM' for more information about an item.\n" $argv[1]
            else
                echo "Sorry, no help is available for the" $argv[1] "plugin." >&2
                return 1
            end
        end
    end
end
function _tacklebox_help
    if test (count $argv) -eq 0
        _tacklebox_help_generic
        return
    end

    _tacklebox_help_plugin $argv
end

function tacklebox
    if test (count $argv) -eq 0
        _tacklebox_help_generic
        return
    end

    switch $argv[1]
        case -- "help"
            set -e argv[1]
            _tacklebox_help $argv
            return
    end
end
