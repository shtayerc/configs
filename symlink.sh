#!/bin/sh
mkdir -p "$HOME"/.config/nvim
mkdir -p "$HOME"/.config/tig
mkdir -p "$HOME"/.config/fish
mkdir -p "$HOME"/.config/tmux
mkdir -p "$HOME"/.config/git

DIR="$(realpath "$(dirname "$0")")"
ln -sf "$DIR"/tmux.conf "$HOME"/.config/tmux/tmux.conf
ln -sf "$DIR"/init.vim  "$HOME"/.config/nvim/init.vim
ln -sf "$DIR"/tigrc "$HOME"/.config/tig/config
ln -sf "$DIR"/config.fish "$HOME"/.config/fish/config.fish
ln -sf "$DIR"/gitconfig "$HOME"/.config/git/config
