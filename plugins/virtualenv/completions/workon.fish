complete -f -c workon -a "(command ls -d $WORKON_HOME/* 2>/dev/null | sed 's,.*/,,')"
