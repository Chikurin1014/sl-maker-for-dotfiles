#!/usr/bin/env bash

ORIGIN_ROOT=""
DEST_ROOT="$HOME"
DRY_RUN=false

while getopts o:d:n flag; do
    case $flag in
        o)
            ORIGIN_ROOT="$(cd $OPTARG && pwd)"
            ;;
        d)
            DEST_ROOT="$OPTARG"
            ;;
        n)
            DRY_RUN=true
            ;;
        ?)
            echo "$SOURCE: Usage: $SOURCE [-o origin] [-d destination] [-n]"
            exit 1
            ;;
    esac
done

[[ -z $ORIGIN_ROOT ]] && echo "$SOURCE: Origin path is required" && exit 1
ORIGIN_FILES=$(find $ORIGIN_ROOT -type f)

# enum
NOTHING_EXISTS=0
LINK_EXISTS=1
FILE_EXISTS=2

# functions
function check() {
    source "functions/check.sh" $@
}
function get_dest() {
    source "functions/get_dest.sh" $@
}
function resolve() {
    source "functions/resolve.sh" $@
}
