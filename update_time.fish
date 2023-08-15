#!/usr/bin/fish

string replace -r "Last update of this page: \d\d.\d\d.\d\d\d\d" "Last update of this page: $(date +%d.%m.%Y)" $(cat index.html) > index.html
