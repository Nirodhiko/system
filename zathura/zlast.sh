#!/usr/bin/env bash
file=$(sqlite3 "$HOME/.local/share/zathura/bookmarks.sqlite" "SELECT file FROM fileinfo ORDER BY time DESC LIMIT 1;")
if [ -n "$file" ] && [ -f "$file" ]; then
    zathura --mode fullscreen "$file"
fi
