#!/bin/bash

backup() {
  target=$1
  if [ -e "$target" ]; then           # Does the config file already exist?
    if [ ! -L "$target" ]; then       # as a pure file?
      mv "$target" "$target.backup"   # Then backup it
      echo "-----> Moved your old $target config file to $target.backup"
    fi
  fi
}

#!/bin/zsh 
# translate this to bash
#for name in *; do
#  if [ ! -d "$name" ]; then
#    target="$HOME/.$name"
#    if [[ ! "$name" =~ '\.sh$' ]] && [ "$name" != 'README.md' ] && [[ ! "$name" =~ '\.sublime-settings$' ]]; then
#      backup $target
#
#      if [ ! -e "$target" ]; then
#        echo "-----> Symlinking your new $target"
#        ln -s "$PWD/$name" "$target"
#      fi
#    fi
#  fi
#done

#install git
sudo apt -y install git
#setup git
# call git_install.sh
. ./git_install.sh

chsh -s $()

#install zsh
sudo apt -y install zsh
#install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#install vim
sudo apt -y install vim

#install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

#install plugins

#vim_pluguins = [
#  haskell-vim,
#  nerdtree,
#  syntastic,
#  vim-markdown-preview,
#  vim-ocaml,
#  vim-racket,
#  vim-scribble,
#  Vundle.vim,
#  ]
