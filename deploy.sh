#!/usr/bin/env bash

function create_soft_link {
  file_path="$1/$3"
  link_path="$2/$3"

  if [ -e "$link_path" ]; then
    echo "$3 already exists, remove it fistly."
    sudo rm -rf "$link_path"
  fi

  if [ -L "$link_path" ]; then
    if [ ! -e "$(readlink "$link_file")" ]; then
      echo "$3 is a invalid link file, remove it firstly."
      sudo rm "$link_path"
    fi
  fi

  ln -s "$file_path" "$link_path"
  echo "Soft link for $3 created successfully."
  echo "------------------------------------------------------------------------"
}

# $HOME/.config
files=("alacritty" "fish" "niri" "sioyek" "swayimg" "waybar" "wallpapers")
for file in "${files[@]}"
do
  create_soft_link "$HOME/system" "$HOME/.config" "$file"
done

# git
create_soft_link "$HOME/system" "$HOME" ".gitconfig"

# rime
mkdir -p $HOME/.local/share/fcitx5
create_soft_link "$HOME/system" "$HOME/.local/share/fcitx5" "rime"
