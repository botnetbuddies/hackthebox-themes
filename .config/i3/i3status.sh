 i3status --run-once | sed -n 's/.*\[\(.*\)\].*/\1/p' | sed  's/],/\n/g' | sed 's/\[//g; s/\]//g' | sed 's/^/[/' | sed 's/$/]/' | jq  -r '.[] | .full_text' | paste -sd '|' -
