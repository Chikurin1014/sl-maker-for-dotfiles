#!/usr/bin/env bash

function get_dest() {
    local -r file="$1"
    local result=${file//$ORIGIN_ROOT/$DEST_ROOT}
    for replace_str in "${REPLACE_LIST[@]}"; do
        # shellcheck disable=SC2206
        local replace_pair=(${replace_str// -> / })
        local replace_before="${replace_pair[0]}"
        local replace_after="${replace_pair[1]}"
        result=${result//$replace_before/$replace_after}
    done
    echo "$result"
}
