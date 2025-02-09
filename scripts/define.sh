#!/usr/bin/env bash

ORIGIN_ROOT=""
DEST_ROOT="$HOME"
DRY_RUN=false
REPLACE_LIST=()
IGNORE_LIST=()

while getopts o:d:r:i:n flag; do
    case $flag in
        o)
            ORIGIN_ROOT="$(cd "$OPTARG" && pwd)"
            ;;
        d)
            # this variable is used in other scripts
            # shellcheck disable=SC2034
            DEST_ROOT="$(cd "$OPTARG" && pwd)"
            ;;
        r)
            REPLACE_LIST+=("$OPTARG")
            ;;
        i)
            IGNORE_LIST+=("$OPTARG")
            ;;
        n)
            # this variable is used in other scripts
            # shellcheck disable=SC2034
            DRY_RUN=true
            ;;
        ?)
            echo "$SOURCE: Usage: $SOURCE [-o origin] [-d destination] [-r \"original file name 1 -> new file name 1\" ..] [-n]"
            exit 1
            ;;
    esac
done

readonly ORIGIN_ROOT
# this variable is used in other scripts
# shellcheck disable=SC2034
readonly DEST_ROOT
# this variable is used in other scripts
# shellcheck disable=SC2034
readonly DRY_RUN

[[ -z $ORIGIN_ROOT ]] && echo "$SOURCE: Origin path is required" && exit 1

ORIGIN_FILES=$(find "$ORIGIN_ROOT" -type f)
# this variable is used in other scripts
# shellcheck disable=SC2034
readonly ORIGIN_FILES

# enum

# this variable is used in other scripts
# shellcheck disable=SC2034
readonly NOTHING_EXISTS=0
# this variable is used in other scripts
# shellcheck disable=SC2034
readonly LINK_EXISTS=1
# this variable is used in other scripts
# shellcheck disable=SC2034
readonly FILE_EXISTS=2

# functions
for file in "$SOURCE_DIR"/functions/*.sh; do
    # shellcheck disable=SC1090
    source "$file"
done
