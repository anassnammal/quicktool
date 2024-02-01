#!/bin/bash

_CLASS=()
_MAKEFILE=0
_MAINCPP=0
_INITGIT=0
_GITIGNORE=0

while getopts 'Mmcfgs:' flag; do
    case "${flag}" in
        e) make -C "*${OPTARG}";;
        *) echo "Error!"
            exit 1 ;;
    esac
done