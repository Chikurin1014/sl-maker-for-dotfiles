#!/usr/bin/env bash

function f() {
    for file in $ORIGIN_FILES; do
        if ignore_check "$file"; then
            echo "Ignoring ${file#"$ORIGIN_ROOT/"}"
            continue
        fi
        resolve "$file"
    done
}

f
