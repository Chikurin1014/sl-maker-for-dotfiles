#!/usr/bin/env bash

set -e

SOURCE="${BASH_SOURCE:-$0}"

source "scripts/define.sh" $@

echo "==== Running staus ===="
echo "Origin: $ORIGIN_ROOT/"
echo "Destination: $DEST_ROOT/"
$DRY_RUN && echo "Mode: Dry run" || echo "Mode: Run"
echo "======================="
echo ""

echo "==== Resolve destination files ===="
source "scripts/resolve.sh" $@
echo "==================================="
echo ""

echo "==== Link files ===="
source "scripts/link.sh" $@
echo "===================="
echo ""

echo "All done!"
