function pretty_man -d "Open the specified manual page as a PDF in Preview."
    man $argv -t | open -f -a Preview
end

function quicklook -d "Open the given file in Quick Look.  Ctrl+C to quit."
    qlmanage -p $argv ^/dev/null
end
