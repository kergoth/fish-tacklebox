function wo -d "If an argument is given, workon that venv.  Otherwise workon the venv with the name contained in ./.venv"
    if test -f './.venv'
        workon (cat ./.venv)
    else
        workon $argv[1]
    end
end
