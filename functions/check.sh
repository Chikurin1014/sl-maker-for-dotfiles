#!/usr/bin/env bash

destination_path="$1"

if   [ -L "$destination_path" ]; then
    echo $LINK_EXISTS
elif [ -f "$destination_path" ]; then
    echo $FILE_EXISTS
else
    echo $NOTHING_EXISTS
fi
