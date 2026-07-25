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
| `fish/` `ghostty/` `sioyek/` `swayimg/` `zathura/` | `~/.config/<name>` |
| `.gitconfig` | `~/.gitconfig` |
| `rime/` | `~/.local/share/fcitx5/rime` |
| `ai/opencode.jsonc` | `~/.config/opencode/opencode.jsonc` |
| `ai/AGENTS.md` | `~/.config/opencode/AGENTS.md` + `~/.config/zed/AGENTS.md` |
| `ai/oh-my-openagent.json` | `~/.config/opencode/oh-my-openagent.json` |
| `zed/keymap.json` | `~/.config/zed/keymap.json` |
| `zed/settings.json` | `~/.config/zed/settings.json` |

## NixOS module layout

`nixos/flake.nix` is the entry point. It imports these modules in order:
`hardware-configuration.nix` → `boot.nix` → `services.nix` → `fonts.nix` → `packages.nix` → `users.nix` → `environment.nix` → inline hostname/locale/gc config.

- **`packages.nix`** — system-level packages (dev tools, Wayland helpers, apps).
- **`services.nix`** — enables GDM, GNOME, fish, PipeWire, keyd (caps→ctrl/esc), fcitx5, Docker, openssh, git, and obs-studio.
- **`fonts.nix`** — system fonts + any `.ttf`/`.otf`/`.ttc` files dropped into `nixos/fonts/`.
- **`users.nix`** — single user `niro` with fish as default shell.
- **`environment.nix`** — shell registration, XIM/env vars (`EDITOR=zeditor`).

## Desktop environment

**GNOME** via GDM (`services.nix`). Not niri — the old niri reference has been removed.

## Gitignored generated files

These are machine-specific or auto-generated and are gitignored:
- `nixos/hardware-configuration.nix`
- `fish/fish_variables`, `fish/conf.d/fish_frozen_theme.fish`
- `rime/build/`, `rime/*.userdb`, `rime/user.yaml`, `rime/sync/`

## Zathura fullscreen

The `fish/functions/zathura.fish` wrapper starts zathura under XWayland (`GDK_BACKEND=x11`) and immediately sends F11 via `xdotool` to enter fullscreen. Requires `xdotool` (declared in `packages.nix`). GNOME/Mutter does not support the Wayland virtual-keyboard protocol, so `wtype` cannot be used.

## zed/AGENTS.md

This file in `zed/` is a personal AI chat personality prompt for the Zed editor. It is not repo documentation and should not be relied on for repo guidance.
