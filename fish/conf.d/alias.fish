# ai
abbr -a ai -- opencode

# audio
abbr -a au -- wpctl set-volume @DEFAULT_AUDIO_SINK@ 20%+
abbr -a ad -- wpctl set-volume @DEFAULT_AUDIO_SINK@ 20%-

# rust
abbr -a cn -- cargo new
abbr -a cc -- cargo watch -x check
abbr -a cb -- cargo watch -x build
abbr -a cr -- cargo watch -x run
abbr -a ct -- cargo watch -x test

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
abbr -a v  -- zeditor
abbr -a vv -- sudo -E zeditor

# system
abbr -a sd -- ncdu
abbr -a ss -- fastfetch
abbr -a si -- btop
abbr -a sl -- journalctl -b 0 -p 4

# nixos
abbr -a nr -- sudo nixos-rebuild switch --flake $HOME/system/nixos#nixos
abbr -a nt -- nixos-rebuild test --flake $HOME/system/nixos#nixos
abbr -a nu -- nix flake update
abbr -a no -- nix store optimise
abbr -a nc -- sudo nix-collect-garbage -d

# wireguard
abbr -a wu -- sudo wg-quick up $HOME/.config/wireguard/peer_A.conf
abbr -a wd -- sudo wg-quick down $HOME/.config/wireguard/peer_A.conf
