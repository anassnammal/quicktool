#!/bin/bash

qmk()
{
    if [ $# -eq 1 ]; then
        make -C *$1
        cp *$1/$(grep NAME= *0/Makefile | cut -d '=' -f2 | tr -d ' ') .
    elif [ $# -eq 2 ]; then
        make $1 -C *$2
    else
        echo "Usage: qmk optional[target] exercise_number"
    fi
}
