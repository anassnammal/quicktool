# ██████████████████████████████████████████████████████████████████████████████▌
# ▌1337.ma                                                                      ▌
# ▌▐██████▌   ▐████████▌ ▐████████▌ ▐████████▌ ▌  header.sh                     ▌
# ▌▐█▌  ▐█▌          ▐█▌        ▐█▌ ▐█▌    ▐█▌ ▌                                ▌
# ▌     ▐█▌          ▐█▌        ▐█▌        ▐█▌ ▌  anammal@student.1337.ma       ▌
# ▌     ▐█▌          ▐█▌        ▐█▌        ▐█▌ ▌                                ▌
# ▌     ▐█▌    ████████▌  ████████▌        ▐█▌ ▌  created by anammal            ▌
# ▌     ▐█▌          ▐█▌        ▐█▌        ▐█▌ ▌  |  2024/02/08 23:58:17  |     ▌
# ▌     ▐█▌          ▐█▌        ▐█▌        ▐█▌ ▌                                ▌
# ▌     ▐█▌          ▐█▌        ▐█▌        ▐█▌ ▌  updated by anammal            ▌
# ▌  ████████▌ ████████▌  ████████▌        ▐█▌ ▌  |  2024/02/09 00:02:32  |     ▌
# ▌                                                                             ▌
# ██████████████████████████████████████████████████████████████████████████████▌
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

if ! grep -q "cpp_gen" $TARGET; then
    echo "Backing up $TARGET to $TARGET.bak"
    cp $TARGET $TARGET.bak
    echo "Injecting cpp_gen and mk into $TARGET"
    echo "############CPP###STARTER##########" >> $TARGET
    echo "" >> $TARGET
    echo "alias cpp_gen=\"bash ~/.tools/cpp_starter.sh\"" >> $TARGET
    cat extended_make.sh >> $TARGET
    echo "" >> $TARGET
    echo "#################END###############" >> $TARGET
    source $TARGET 2> /dev/null
    echo "you may need to restart your terminal for the changes to take effect"
fi
