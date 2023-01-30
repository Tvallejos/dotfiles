#!/bin/bash

sudo apt install vim

# install zsh oh-my-zsh and powerline
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# install zulip
sudo curl -fL -o /etc/apt/trusted.gpg.d/zulip-desktop.asc \\n    https://download.zulip.com/desktop/apt/zulip-desktop.asc\necho "deb https://download.zulip.com/desktop/apt stable main" | \\n    sudo tee /etc/apt/sources.list.d/zulip-desktop.list\nsudo apt update\nsudo apt install zulip

# create ssh-key
ssh-keygen -t ed25519 -C ""
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub

# install some dep
sudo apt install gcc make bubblewrap

# install emacs then spacemacs
sudo apt build-dep emacs
curl -XGET -O https://ftp.gnu.org/pub/gnu/emacs/emacs-27.1.tar.xz 
tar -axvf emacs-27.1.tar.xz
cd emacs-27.1/
./configure
make
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

# install opam create switch with coq 8.14.0 and mathcomp
bash -c "sh <(curl -fsSL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)"
opam init
opam switch create coq-4.15 4.12.0
eval $(opam env)

opam pin add coq 8.14.0
opam repo add coq-released https://coq.inria.fr/opam/released\nopam install coq-mathcomp-ssreflect
