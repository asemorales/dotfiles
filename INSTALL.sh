#!/bin/bash

set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

do_link() {
  src="$1"
  target="$2"
  BOLD_CYN="\033[1;36m"
  BOLD_GRN="\033[1;32m"
  BOLD_YLW="\033[1;33m"
  BOLD_RED="\033[1;31m"
  RESET="\033[0m"
  mkdir -p "$(dirname "$target")"
  if [ -L "$target" ] && [ "$(readlink "$target")" = "$src" ]; then
    return
  elif [ -L "$target" ]; then
    echo -e "${BOLD_CYN}UPDATED:${RESET} Repointed symlink:    $target"
    ln -sfn "$src" "$target"
  elif [ ! -e "$target" ]; then
    echo -e "${BOLD_GRN}CREATED:${RESET} New symlink created:  $target"
    ln -s "$src" "$target"
  elif [ -f "$target" ] && cmp -s "$src" "$target"; then
    echo -e "${BOLD_YLW}REPLACED:${RESET} Identical file:      $target"
    ln -sf "$src" "$target"
  else
    echo -e "${BOLD_RED}WARNING:${RESET} Real file in the way: $target"
  fi
}

link_dot_path() {
  do_link "$REPO/dot/$1" "$HOME/.$1"
}

link_config_path() {
  do_link "$REPO/config/$1" "$HOME/.config/$1"
}

link_claude_path() {
  do_link "$REPO/claude/$1" "$HOME/.claude/$1"
}

link_dot_path bashrc
link_dot_path bash_profile
link_dot_path bash_logout
link_dot_path profile
link_dot_path zshrc
link_dot_path gitconfig
link_dot_path dmrc
link_dot_path ssh/config

link_config_path fish/conf.d/uv.env.fish
link_config_path git/ignore
link_config_path gtk-3.0/bookmarks
link_config_path mimeapps.list
link_config_path neofetch/config.conf
link_config_path systemd/user/appimaged.service
link_config_path user-dirs.dirs
link_config_path VSCodium/User/keybindings.json
link_config_path VSCodium/User/settings.json
link_config_path xdg-terminals.list
link_config_path xfce4/terminal/terminalrc

link_claude_path settings.json
link_claude_path skills/rewrite-natural
link_claude_path skills/rewrite-paper
link_claude_path skills/suggest-paper-figs
