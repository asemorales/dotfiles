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

link_theme_path() {
  do_link "$REPO/themes/$1" "$HOME/.themes/$1"
}

link_local_path() {
  do_link "$REPO/local/$1" "$HOME/.local/$1"
}

mozilla_profile() {
  awk -F= '/^\[Install/ { s = 1; next } /^\[/ { s = 0 } s && $1 == "Default" { print $2; exit }' \
    "$1/profiles.ini" 2>/dev/null || true
}

link_thunderbird_path() {
  local profile
  profile="$(mozilla_profile "$HOME/.thunderbird")"
  [ -n "$profile" ] || return 0
  do_link "$REPO/thunderbird/$1" "$HOME/.thunderbird/$profile/$1"
}

# bierstadt-mode writes chrome/userContent.css.
link_firefox_path() {
  local profile
  profile="$(mozilla_profile "$HOME/.mozilla/firefox")"
  [ -n "$profile" ] || return 0
  do_link "$REPO/firefox/$1" "$HOME/.mozilla/firefox/$profile/$1"
}

link_dot_path bashrc
link_dot_path bash_profile
link_dot_path bash_logout
link_dot_path profile
link_dot_path zshrc
link_dot_path gitconfig
link_dot_path dmrc
link_dot_path xsessionrc
link_dot_path ssh/config

link_config_path autostart/bierstadt-bar.desktop
link_config_path autostart/bierstadt-caption.desktop
link_config_path autostart/kitty.desktop
link_config_path fish/conf.d/uv.env.fish
link_config_path bierstadt/wall.yml
link_config_path btop/themes
link_config_path eww
link_config_path git/ignore
link_config_path gtk-3.0/bookmarks
link_config_path gtk-3.0/gtk.css
link_config_path kitty/kitty.conf
link_config_path kitty/bierstadt-dark.conf
link_config_path kitty/bierstadt-light.conf
link_config_path mimeapps.list
link_config_path neofetch/config.conf
link_config_path nvim/init.lua
link_config_path nvim/colors/bierstadt.lua
link_config_path systemd/user/appimaged.service
link_config_path user-dirs.dirs
link_config_path VSCodium/User/keybindings.json
link_config_path VSCodium/User/settings.json
link_config_path xdg-terminals.list
link_config_path xfce4/helpers.rc
link_config_path xfce4/terminal/terminalrc
link_config_path yazi/yazi.toml
link_config_path yazi/keymap.toml
link_config_path yazi/theme.toml
link_config_path yazi/flavors/bierstadt-dark.yazi
link_config_path yazi/flavors/bierstadt-light.yazi

link_theme_path bierstadt
link_theme_path bierstadt-dark

link_local_path bin/bierstadt-mode
link_local_path bin/bierstadt-caption
link_local_path bin/bierstadt-bar
link_local_path bin/bierstadt-greeter
link_local_path bin/bierstadt-grub
link_local_path bin/bierstadt-plymouth
link_local_path bin/bierstadt-root
link_local_path share/icons/bierstadt-icons-build.py
link_local_path share/applications/yazi.desktop
link_local_path share/xfce4/helpers/yazi.desktop

link_thunderbird_path user.js
link_thunderbird_path chrome/userChrome.css
link_thunderbird_path chrome/userContent.css

link_firefox_path user.js
link_firefox_path chrome/userChrome.css

link_claude_path settings.json
link_claude_path skills/rewrite-paper
link_claude_path skills/suggest-paper-figs
