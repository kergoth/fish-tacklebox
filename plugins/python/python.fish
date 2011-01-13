function cdp -d "Change directory to the location of the specified Python module."
    cd (python -c "import os.path as _, $argv[1]; print _.dirname(_.realpath($argv[1].__file__[:-1]))")
end
