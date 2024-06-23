#!/usr/bin/env bash

function link() {
    local -r file="$1"

    echo "Linking ${file#"$ORIGIN_ROOT/"}"
    local -r destination_path=$(get_dest "$file")
    echo "  $file"
    echo "  -> $destination_path"
    if [[ $DRY_RUN = false ]]; then
        ln -s "$file" "$destination_path"
    fi
}
