function set_volatile
    set -gx $argv[1] $volatile_path/$argv[2]
    if test -e ~/$argv[2]
        mv ~/$argv[2] $volatile_path/
    end
end

function volatile_setup
    for var in $volatile_elements
        switch $var
            case ccache
                set_volatile CCACHE .ccache
            case viminfo
                set_volatile VIMINFO .viminfo
            case less_history
                set_volatile LESSHISTFILE .lesshst
        end
    end
end

if not set -q volatile_elements
    set -g volatile_elements ccache viminfo less_history
end

if set -q volatile_path
    volatile_setup
end
