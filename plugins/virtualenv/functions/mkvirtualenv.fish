function mkvirtualenv -d 'Create a virtualenv in WORKON_HOME and activate it'
    set -l requirements
    set -l packages
    set -l opts
    set -l position

    eval set opts (getopt hr:i: $argv)
    for i in (seq 1 (count $opts))
        set -l arg $opts[$i]
        switch $arg
            case -r
                set i (expr $i + 1)
                set requirements $requirements $opts[$i]
            case -i
                set i (expr $i + 1)
                set packages $packages $opts[$i]
            case '\-h'
                return 1
            case --
                set position $i
                break
        end
        set position $i
    end

    set -l remaining (expr (count $opts) - $position)
    if test $remaining -ne 1
        echo >&2 Usage: mkvirtualenv [-i package] [-r requirement] ENVNAME
        return 2
    end

    set -l envname $opts[(expr $position + 1)]
    mkdir -p $WORKON_HOME
    cd $WORKON_HOME
    virtualenv --distribute $envname
    if test $status -ne 0
        return $status
    end

    # Now activate the new environment
    workon $envname

    if test ! -z "$requirements"
        pip install -r $requirements
    end

    for package in $packages
        pip install $package
    end

    return 0
end
