#!/usr/bin/env bash

ORIGIN_ROOT=""
DEST_ROOT="$HOME"
DRY_RUN=false

while getopts o:d:n flag; do
    case $flag in
        o)
            ORIGIN_ROOT="$(cd "$OPTARG" && pwd)"
            ;;
        d)
            # this variable is used in other scripts
            # shellcheck disable=SC2034
            DEST_ROOT="$OPTARG"
            ;;
        n)
            # this variable is used in other scripts
            # shellcheck disable=SC2034
            DRY_RUN=true
            ;;
        ?)
            echo "$SOURCE: Usage: $SOURCE [-o origin] [-d destination] [-n]"
            exit 1
            ;;
    esac
done

[[ -z $ORIGIN_ROOT ]] && echo "$SOURCE: Origin path is required" && exit 1
# this variable is used in other scripts
# shellcheck disable=SC2034
ORIGIN_FILES=$(find "$ORIGIN_ROOT" -type f)

# enum

# this variable is used in other scripts
# shellcheck disable=SC2034
NOTHING_EXISTS=0
# this variable is used in other scripts
# shellcheck disable=SC2034
LINK_EXISTS=1
# this variable is used in other scripts
# shellcheck disable=SC2034
FILE_EXISTS=2

# functions

function check() {
    # file exists
    # shellcheck disable=SC1091
    source "$SOURCE_DIR/functions/check.sh" "$@"
}
function get_dest() {
    # file exists
    # shellcheck disable=SC1091
    source "$SOURCE_DIR/functions/get_dest.sh" "$@"
}
function resolve() {
    # file exists
    # shellcheck disable=SC1091
    source "$SOURCE_DIR/functions/resolve.sh" "$@"
}
