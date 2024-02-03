#!/bin/zsh

clear
echo "  This script is a quick tool for 1337 students"
echo "  It will install a set of tools that are useful for cpp projects"

echo "  This script will install the following tools:"
echo "   - Cpp project generator   (cpp_gen)"
echo "   - Cpp class generator     (class_gen)"
echo "   - Quick make tool         (mk)"
echo
echo "  Do you want to continue? (y/n)"
read CONTINUE

if [[ $CONTINUE == "n" ]]; then
    echo "  Exiting..."
    clear
    exit 1
fi

echo "  Injecting toots into ~/.zshrc"
echo "##    injected by leetQuickTool.sh" >> ~/.zshrc
echo "" >> ~/.zshrc
cat cpp_starter.sh >> ~/.zshrc
cat ClassGen.sh >> ~/.zshrc
cat extended_make.sh >> ~/.zshrc
echo "" >> ~/.zshrc
echo "#################END###############" >> ~/.zshrc

source ~/.zshrc

echo -e "\033[32m  toots injected into ~/.zshrc\033[0m"
echo "you may need to restart your terminal for the changes to take effect"