#!/usr/bin/env bash

for file in $ORIGIN_FILES; do
    echo "Checking ${file#"$ORIGIN_ROOT/"}"
    destination_path=$(get_dest "$file")

    mkdir -p "$(dirname "$destination_path")"
    status=$(check "$destination_path")

    if [[ $status = "$LINK_EXISTS" ]]; then
        echo "  Unlink $destination_path"
        if [[ $DRY_RUN = false ]]; then
            unlink "$destination_path"
        fi
    elif [[ $status = "$FILE_EXISTS" ]]; then
        echo "  Move $destination_path to $destination_path.old (if $destination_path.old already exists, remove old one)"
        if [[ $DRY_RUN = false ]]; then
            [[ -e "$destination_path.old" ]] && rm "$destination_path.old"
            mv "$destination_path" "$destination_path.old"
        fi
    fi
done
