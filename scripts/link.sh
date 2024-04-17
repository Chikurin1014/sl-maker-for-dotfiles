#!/usr/bin/env bash

for file in $ORIGIN_FILES; do
    destination_path=$(get_dest $file)
    echo "$file"
    echo "-> $destination_path"
    if [[ $DRY_RUN = false ]]; then
        ln -s "$file" "$destination_path"
    fi
done
