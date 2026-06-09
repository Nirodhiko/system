# theme
abbr -a tt -- ~/.config/alacritty/toggle-theme.sh


# ai
abbr -a ai -- codewhale

# docker
abbr -a du -- docker compose up -d
abbr -a ds -- docker compose stop
abbr -a dr -- docker compose restart
abbr -a dd -- docker compose rm

# git
abbr -a gc -- git clone
abbr -a gp -- git push

# pnpm
abbr -a pi -- pnpm install
abbr -a pa -- pnpm add
abbr -a pu -- pnpm update
abbr -a pr -- pnpm run
abbr -a pe -- pnpm exec
abbr -a pd -- pnpm rm
abbr -a pc -- pnpm store prune

# zed
abbr -a v  -- zed
abbr -a sv -- sudo -E zed

# image
abbr -a iv -- swayimg
abbr -a is -- grimshot save area ~/Pictures/last.png
abbr -a ie -- swappy -f ~/Pictures/last.png -o ~/Pictures/last.png

# system
abbr -a disk -- ncdu
abbr -a ss -- fastfetch
abbr -a si -- btop
abbr -a sl -- journalctl -b 0 -p 4

# nixos
abbr -a nt -- nixos-rebuild build-vm
abbr -a nr -- sudo nixos-rebuild switch
abbr -a no -- nix store optimise
abbr -a nu -- sudo nix-channel update

# niri
abbr -a nw -- niri msg windows

# usb
abbr -a us -- udisksctl status
abbr -a um -- udisksctl mount -b /dev/sdb1
abbr -a uu -- udisksctl unmount -b /dev/sdb1

# wifi
abbr -a wo -- nmcli device wifi on
abbr -a wl -- nmcli device wifi list
abbr -a wc -- nmcli device wifi connect
