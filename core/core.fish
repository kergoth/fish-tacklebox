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
        for p in (ls $tb/plugins)
            if not contains $p $tacklebox_plugins
                echo "    $p"
            end
        end
    echo
end

function _tacklebox_help
    if test (count $argv) -eq 0
        _tacklebox_help_generic
        return
    end

    if not contains $argv[1] (ls $tb/plugins)
        printf "Unknown plugin '%s'\n" $argv[1] >&2
        return 1
    else
        echo HALP
    end
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
