#!/bin/zsh

echo "Do you want to continue? (y/n)"
read CONTINUE

if [[ $CONTINUE == "n" ]]; then
    echo "Exiting..."
    clear
    exit 1
fi

echo "Injecting toots into ~/.zshrc"
echo "############CPP###STARTER##########" >> ~/.zshrc
echo "" >> ~/.zshrc
echo "alias cpp_gen=\"bash $(pwd)/cpp_starter.sh\"" >> ~/.zshrc
cat extended_make.sh >> ~/.zshrc
echo "" >> ~/.zshrc
echo "#################END###############" >> ~/.zshrc

source ~/.zshrc

echo -e "\033[32m  toots injected into ~/.zshrc\033[0m"
echo "you may need to restart your terminal for the changes to take effect"