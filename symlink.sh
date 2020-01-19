#! /bin/sh
mkdir -p $HOME/.config/nvim
mkdir -p $HOME/.config/tig
mkdir -p $HOME/.config/fish

ln -sf $PWD/tmux.conf $HOME/.tmux.conf
ln -sf $PWD/init.vim  $HOME/.config/nvim/init.vim
ln -sf $PWD/tigrc $HOME/.config/tig/tigrc
ln -sf $PWD/config.fish $HOME/.config/fish/config.fish
