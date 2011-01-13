function o -d "Open the given file or directory."
    open $argv
end

function oo -d "Open the current directory."
    open .
end

function ascii_chars -d "Print the ASCII values of each character on stdin."
    python -c 'import sys; print " ".join(map(str, map(ord, sys.stdin.read())))'
end

function strip -d "Strip whitespace from around the arguments or stdin."
    if test (count $argv) -eq 0
        python -c 'import sys; sys.stdout.write(sys.stdin.read().strip())'
    else
        echo $argv | strip
    end
end
