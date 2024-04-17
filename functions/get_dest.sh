#!/usr/bin/env bash

file="$1"

echo "$DEST_ROOT/${file#$ORIGIN_ROOT/}"
