complete -f -c workon -a "(cd $WORKON_HOME 2>/dev/null; and command ls -p | sed -n 's,/\$,,p')"
