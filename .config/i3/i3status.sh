i3status --run-once | sed -n 's/.*\[\(.*\)\].*/\1/p' | sed 's/],/\n/g' | sed 's/\[//g; s/\]//g' | sed 's/^/[/' | sed 's/$/]/' | jq -r '.[] | .full_text' | sed -E 's/CPU -?[0-9]+%/CPU '"$(top -bn1 | grep 'Cpu(s)' | sed 's/.*, *\([0-9.]*\)%* id.*/\1/' | awk "{print int(100 - \$1)}")"'%/' | paste -sd '|' -

