function md
    mkdir -p $argv
end

function l1
    tree --dirsfirst -ChFL 1
end
function l2
    tree --dirsfirst -ChFL 2
end
function l3
    tree --dirsfirst -ChFL 3
end

function ll1
    tree --dirsfirst -ChFupDaL 1
end
function ll2
    tree --dirsfirst -ChFupDaL 2
end
function ll3
    tree --dirsfirst -ChFupDaL 3
end

function l
    l1
end
function ll
    ll1
end

function ..
    builtin cd ..
end
function ...
    builtin cd ../..
end
function ....
    builtin cd ../../..
end
function .....
    builtin cd ../../../..
end
