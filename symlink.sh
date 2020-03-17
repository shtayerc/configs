#!/bin/sh
mkdir -p "$HOME"/.config/nvim
mkdir -p "$HOME"/.config/tig
mkdir -p "$HOME"/.config/fish

DIR="$(realpath "$(dirname "$0")")"
ln -sf "$DIR"/tmux.conf "$HOME"/.tmux.conf
ln -sf "$DIR"/init.vim  "$HOME"/.config/nvim/init.vim
ln -sf "$DIR"/tigrc "$HOME"/.config/tig/config
ln -sf "$DIR"/config.fish "$HOME"/.config/fish/config.fish
