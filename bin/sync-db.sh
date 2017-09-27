#!/bin/bash

source_db_host=192.168.6.222
source_db_user=root
source_db_pass=
source_db_name=$1
target_file=$2
mysqldump_bin=$(which mysqldump)
usage="Usage: sync-db.sh <source_db_name> <target_file>"
now=$(date +"%Y-%m-%d %H:%M:%S")

function show_usage() {
    echo $usage && exit 1
}

function commit_changes() {
    exec git status $target_file --short
    if [[ -z $(git status $target_file --short) ]]; then
        echo "no changes detected"
    else
        exec git add $target_file
        exec git commit -m "New schema dump - $now"
        exec git push origin master
        echo "changes pushed"
    fi
}

function dump() {
    exec $mysqldump_bin \
        --host=$source_db_host \
        --user=$source_db_user \
        --password=$source_db_pass \
        $source_db_name > $target_file
}

function run() {
    dump
    commit_changes
}

if [ $# == 0 ]; then
    show_usage
fi

if [[ -z $mysqldump_bin ]]; then
    echo "mysqldump not found" && show_usage
fi

if [[ -z $source_db_name ]]; then
    echo "input source_db_name" && show_usage
fi

if [[ -z $target_file ]]; then
    echo "choose target file" && show_usage
fi

run