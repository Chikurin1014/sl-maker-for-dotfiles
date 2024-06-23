#!/usr/bin/env bash

function f() {
    for file in $ORIGIN_FILES; do
        resolve "$file"
    done
}

f
