#!/bin/bash

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

# etc
files=("package.use" "repos.conf" "binrepos.conf" "make.conf" "package.accept_keywords" "package.license" "package.mask" "package.unmask")
for file in "${files[@]}"
do
  sudo bash -c "$(declare -f create_soft_link); create_soft_link '$HOME/system/etc/portage' '/etc/portage' '$file'"
done
sudo bash -c "$(declare -f create_soft_link); create_soft_link '$HOME/system/etc' '/etc' 'fstab'"
sudo bash -c "$(declare -f create_soft_link); create_soft_link '$HOME/system/etc' '/etc' 'environment'"
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d
sudo bash -c "$(declare -f create_soft_link); create_soft_link '$HOME/system/etc' '/etc/systemd/system/getty@tty1.service.d' 'autologin.conf'"
