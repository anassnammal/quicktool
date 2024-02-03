# Description: quick make for CPP days
# Usage     : qmk optional[target] exercise_number
# example   : qmk 1 (will make the default target for ex01 directory and copy the executable to the current directory)
# If no target is given, it will make the default target AND copy the executable to the current directory
# If a target is given, it will make that target
# If no exercise number is given, it will not do anything

mk()
{
    if [ $# -eq 1 ]; then
        make -C *$1
        cp *$1/$(grep NAME= *$1/Makefile | cut -d '=' -f2 | tr -d ' ') .
    elif [ $# -eq 2 ]; then
        make $1 -C *$2
    else
        echo "Usage: qmk optional[target] exercise_number"
    fi
}