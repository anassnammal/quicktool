#!/bin/bash

      #########.
     ########",#:
   #########',##".
  ##'##'## .##',##.
   ## ## ## # ##",#.
    ## ## ## ## ##'
     ## ## ## :##
      ## ## ##."

ROOT="$HOME/goinfre"
BREW="brew"
BREWDIR="$ROOT/.$BREW"

if ! $ROOT"/".*$BREW* 2>/dev/null; then
  echo "Homebrew is already installed"
  read -p "rinstall it ? [y/n]" -n 1 -r
  echo
  if [[ $REPLY =~ ^[Nn]$ ]]; then
    exit 0
  else
    rm -rf .brew .brew*
  fi
fi
git clone --depth=1 https://github.com/Homebrew/brew $BREWDIR

# Create .brewconfig script in home directory 
cat > $ROOT/.brewconfig.zsh <<EOL
# HOMEBREW CONFIG

# Add brew to path
ln -s $BREWDIR/bin $HOME/.extras/bin 2>/dev/null
BIN_DIR=\$HOME/.extras/bin
mkdir -m 711 -p \$BIN_DIR
export PATH=\$HOME/.extras/bin:\$PATH

# Add brew lib to path
LIB_DIR=\$HOME/.extras/lib
mkdir -m 711 -p \$LIB_DIR
ln "\$(brew --prefix)/lib" \$ LIB_DIR 2>/dev/null
export LIBRARY_PATH=\$HOME/.extras/lib:\$LIBRARY_PATH
export LD_LIBRARY_PATH=\$HOME/.extras/lib:\$LD_LIBRARY_PATH
export DYLD_LIBRARY_PATH=\$HOME/.extras/lib:\$DYLD_LIBRARY_PATH
export DYLD_FALLBACK_LIBRARY_PATH=\$HOME/.extras/lib:\$DYLD_FALLBACK_LIBRARY_PATH

# Add brew include to path
INCLUDE_DIR=\$HOME/.extras/include
mkdir -m 711 -p \$INCLUDE_DIR
ln "\$BREWDIR/include" \$INCLUDE_DIR 2>/dev/null
export CPATH=\$HOME/.extras/include:\$CPATH
export C_INCLUDE_PATH=\$HOME/.extras/include:\$C_INCLUDE_PATH


#add brew to manpage path
MANDIR=\$HOME/.extras/share/man:\$MANDIR
mkdir -m 711 -p \$MANDIR
export MANPATH=\$MANDIR:\$MANPATH

#add homebrew to manpath
which brew 1>/dev/null 2>&1 && eval \$(brew shellenv)

# Set Homebrew temporary folders
export HOMEBREW_CACHE=\$HOME/goinfre/Homebrew/Caches
export HOMEBREW_TEMP=\$HOME/goinfre/Homebrew/Temp

mkdir -m 711 -p \$HOMEBREW_CACHE
mkdir -m 711 -p \$HOMEBREW_TEMP

# If NFS session
# Symlink Locks folder in /tmp
if df -T autofs,nfs \$HOME 1>/dev/null
then
  HOMEBREW_LOCKS_TARGET=\$HOME/goinfre/Homebrew/Locks
  HOMEBREW_LOCKS_FOLDER=\$HOME/goinfre/.brew/var/homebrew

  mkdir -m 711 -p \$HOMEBREW_LOCKS_TARGET
  mkdir -m 711 -p \$HOMEBREW_LOCKS_FOLDER

  # Symlink to Locks target folders
  # If not already a symlink
  if ! [[ -L \$HOMEBREW_LOCKS_FOLDER && -d \$HOMEBREW_LOCKS_FOLDER ]]
  then
     echo "Creating symlink for Locks folder"
     rm -rf \$HOMEBREW_LOCKS_FOLDER
     ln -s \$HOMEBREW_LOCKS_TARGET \$HOMEBREW_LOCKS_FOLDER
  fi
fi
EOL

if ! grep -q "# Load Homebrew config script" $HOME/.zshrc
then
cat >> $HOME/.zshrc <<EOL

# Load Homebrew zsh completions
FPATH="/usr/share/zsh/site-functions:${FPATH}"
brew update --force --quiet
chmod -R go-w "$BREWDIR/share/zsh"
rm -f ~/.zcompdump; compinit
# Load Homebrew config script
source \$HOME/goinfre/.brewconfig.zsh

EOL
fi

(zsh -c "source $HOME/.zshrc" && zsh -c "rehash") && brew update && echo "\ninstalled sccessfully"; exit 0
echo "failed to install"
exit 1
