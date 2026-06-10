# AGENTS.md

## Repo identity
NixOS system configuration + user dotfiles. Not a software project — no build, test, lint, or typecheck commands.

## Expected location
The repo **must** live at `$HOME/system`. The deploy script and the Nix flake reference this path directly.

## Key commands

```bash
./deploy.sh                                                # symlink all configs into place (run after clone)
nix flake update                                           # update flake.lock
sudo nixos-rebuild switch --flake $HOME/system/nixos#nixos # rebuild & switch NixOS
```

## ⚠️ hardware-configuration.nix

`nixos/hardware-configuration.nix` is **machine-specific and gitignored**. It is copied from `/etc/nixos/hardware-configuration.nix` by `deploy.sh`. Never modify it by hand or commit it. To sync hardware changes, re-run `deploy.sh`.

## Directory → destination mapping

`deploy.sh` symlinks each root directory as follows:

| Source | Destination |
|---|---|
| `alacritty/` `fish/` `niri/` `sioyek/` `swayimg/` `swaylock/` `waybar/` `wallpapers/` `zed/` | `~/.config/<name>` |
| `.gitconfig` | `~/.gitconfig` |
| `rime/` | `~/.local/share/fcitx5/rime` |

## NixOS module layout

`nixos/flake.nix` is the entry point. It imports these modules in order:
`hardware-configuration.nix` → `boot.nix` → `desktop.nix` → `fonts.nix` → `packages.nix` → `users.nix` → `variables.nix` → inline hostname/locale/gc config.

- **`packages.nix`** is where system-level packages are declared.
- **`desktop.nix`** enables SDDM, niri (Wayland compositor), fish, PipeWire, keyd (caps→ctrl/esc), and fcitx5.
- **`fonts.nix`** loads system fonts + any `.ttf`/`.otf`/`.ttc` files dropped into `nixos/fonts/`.
- **`users.nix`** defines a single user `niro` with fish as default shell.

## Gitignored generated files

These are machine-specific or auto-generated and are gitignored:
- `nixos/hardware-configuration.nix`
- `fish/fish_variables`, `fish/conf.d/fish_frozen_theme.fish`
- `rime/build/`, `rime/*.userdb`, `rime/user.yaml`, `rime/sync/`
- `themes/` (alacritty themes cloned by deploy.sh)

## Alacritty themes

`deploy.sh` clones `alacritty-theme` into `~/.config/alacritty/themes/` if absent. That directory is not tracked in this repo (gitignored). The alacritty config references themes from there.

## zed/AGENTS.md

This file in `zed/` is a personal AI chat personality prompt for the zed editor. It is not repo documentation and should not be relied on for repo guidance.
