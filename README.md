## Connect to Wifi
1. Get interface name with `iw device`.
2. Get SSID with `iw "interface name" scan | grep SSID`
3. Connect to wifi with `net-setup "device name"`.

## Partition and Filesystem
- Make true that system is boot in EFI mode: `ls /sys/firmware/efi/efivars`.
- Create partition with cgdisk.
- Root filesystem：`mkfs.btrfs -L root -n 32k /dev/sda2`.

## GRUB
1. Install `sys-boot/os-prober` 
1. Add `GRUB_TIMEOUT=2`, `GRUB_DISABLE_OS_PROBER=false`, `GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"` to /etc/default/grub.
2. Run `sudo grub-mkconfig -o /boot/grub/grub.cfg`.

## User
- Set fish as default shell `chsh -s /usr/bin/fish`.
- Add path of fish to /etc/shells.
- Accept easy password: change "enforce" option from "everyone" to "none" in the /etc/security/passwdqc.conf.

## Locale 
- /etc/locale.gen
  ```
  en_US.UTF-8 UTF-8
  zh_CN.UTF-8 UTF-8
  ```

- /etc/locale.conf
  ```
  LANG="en_US"
  LC_COLLATE="C"
  ```

## Fonts:
  ```
  1. Install media-fonts/noto.
  2. Install media-fonts/nerd-fonts.
  3. Install chinese fonts.
  ```

## [Fcitx](https://wiki.gentoo.org/wiki/Fcitx)
1. Install fcitx-rime, fcitx-configtool.
3. [Config rime](https://github.com/rime/home/wiki).

## Cursor Theme
1. [Install gentoo-xcursor](https://wiki.gentoo.org/wiki/Cursor_themes).
2. Add `seat seat0 xcursor_theme gentoo` in sway config.

## Network
- Install and enable `iwd` and `dhcpcd`.
- Enable systemd-networkd.service.
- Enable systemd-resolved.service.

## Sway
- Get window information: `swaymsg -t get_tree`

## Ssh
- Generate ssh key `ssh-keygen -t ed25519 -C "example@outlook.com"`.
- [add to github](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).
- Clone repository with `git clone git@...`.

## WireGuard
- Install wireguard server [on centos7.6](https://raw.githubusercontent.com/atrandys/wireguard/master/wireguard_install.sh).
- ssh-copy-id `wireguard server`.
- Install `wireguard-tools`.
- [Client config](https://tech.serhatteker.com/post/2021-01/how-to-set-up-wireguard-client-on-ubuntu-desktop/).

## Audio
1. Install pavucontrol.
2. pulseaudio --check && pulseaudio -D.

## Node
- pnpm
  ```
  fish_add_path /home/shun/.local/share/pnpm
  # pnpm config set registry https://registry.npm.taobao.org
  pnpm config set -g auto-install-peers true
  pnpm install -g n
  sudo n lts
  `cat pnpm-package-list.txt | xargs pnpm add -g`
  ```

## Python Virtualenv
- `virtualenv .python/venv`
- `source .python/venv/bin/activate.fish`

## Sioyek
- Install sys-fs/fuse:0.
- Open appimage.

## Obs-Studio
- systemctl --user enable --now pipewire-pulse.socket wireplumber.service pipewire.service

## Brightness
- Install `app-misc/ddcutil`
- Detects monitors `sudo ddcutil detect`
- Get vcp code `sudo ddcutil vcpinfo | grep Bright`
- Get current brightness `sudo ddcutil getvcp code`
- Adjust brightness `sudo ddcutil setvcp code - 10`