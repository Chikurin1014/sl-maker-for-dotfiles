#!/usr/bin/env bash

set -e

SOURCE="${BASH_SOURCE:-$0}"
SOURCE_DIR=$(dirname "$SOURCE")

source "$SOURCE_DIR/scripts/define.sh" "$@"

echo "==== Running staus ===="
echo "Origin: $ORIGIN_ROOT/"
echo "Destination: $DEST_ROOT/"
$DRY_RUN && echo "Mode: Dry run" || echo "Mode: Run"
echo "======================="
echo ""

echo "==== Resolve destination files ===="
source "$SOURCE_DIR/scripts/resolve.sh" "$@"
echo "==================================="
echo ""

echo "==== Link files ===="
source "$SOURCE_DIR/scripts/link.sh" "$@"
echo "===================="
echo ""

echo "All done!"
