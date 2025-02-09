#!/usr/bin/env bash

function ignore_check() {
    local -r file="$1"

    for ignore in "${IGNORE_LIST[@]}"; do
        if [[ $file =~ "$ignore" ]]; then
            return 0
        fi
    done

    return 1
}
