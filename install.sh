#!/bin/bash

if [[ $SHELL == *"/zsh"* ]]; then
    TARGET=~/.zshrc
elif [[ $SHELL == *"/bash"* ]]; then
    TARGET=~/.bashrc
else
    echo "Enter the path to your shell's rc file"
    read TARGET
fi

if [[ ! -f $TARGET ]]; then
    echo "The file $TARGET does not exist"
    exit 1
fi

echo "Copying cpp_starter.sh to ~/.tools"
mkdir -p ~/.tools
cp cpp_starter.sh ~/.tools

echo "Backing up $TARGET to $TARGET.bak"
cp $TARGET $TARGET.bak

echo "Injecting toots into $TARGET"
echo "############CPP###STARTER##########" >> $TARGET
echo "" >> $TARGET
echo "alias cpp_gen=\"bash ~/.tools/cpp_starter.sh\"" >> $TARGET
cat extended_make.sh >> $TARGET
echo "" >> $TARGET
echo "#################END###############" >> $TARGET

source $TARGET

echo -e "\033[32m  toots injected into $TARGET\033[0m"
echo "you may need to restart your terminal for the changes to take effect"
