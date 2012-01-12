functions fish_prompt | grep -q '~/.lastdir'
if [ $status -gt 0 ]
	functions fish_prompt | sed -e '$ i\\
	echo -n "$PWD" > ~/.lastdir' | .
end

if test -e ~/.lastdir
    cd (cat ~/.lastdir)
end
