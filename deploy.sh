#!/usr/bin/env bash
#
# Deploy dotfiles and the NixOS configuration by creating symlinks
# pointing at this repository.

set -euo pipefail

# Absolute path to the directory containing this script (the repo root).
SYSTEM_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

log()  { printf '==> %s\n' "$*"; }
warn() { printf '!!  %s\n' "$*" >&2; }

# link <source> <destination>
#
# Atomically replaces <destination> with a symlink pointing at <source>.
# Skips with a warning if <source> doesn't exist.
link() {
  local src="$1" dst="$2"

  if [[ ! -e "$src" && ! -L "$src" ]]; then
    warn "source missing, skipping: $src"
    return
  fi

  mkdir -p "$(dirname "$dst")"
  # If <dst> is a real directory (not a symlink), ln -sfn won't replace it.
  # Remove it first so a fresh-clone deploy can overwrite stock dirs.
  [[ -d "$dst" && ! -L "$dst" ]] && rm -rf "$dst"
  ln -sfn "$src" "$dst"
  log "$dst -> $src"
}

# ~/.config/<name>
for entry in alacritty fish niri sioyek swayimg swaylock waybar wallpapers zed; do
  link "$SYSTEM_DIR/$entry" "$HOME/.config/$entry"
done

# ~/<dotfile>
link "$SYSTEM_DIR/.gitconfig" "$HOME/.gitconfig"

# Rime (fcitx5 input method data)
link "$SYSTEM_DIR/rime" "$HOME/.local/share/fcitx5/rime"

# NixOS configuration — now managed via flakes.
# Rebuild with: sudo nixos-rebuild switch --flake "$SYSTEM_DIR/nixos#nixos"
log "NixOS flake ready at $SYSTEM_DIR/nixos/flake.nix"
log "To rebuild: sudo nixos-rebuild switch --flake $SYSTEM_DIR/nixos#nixos"

log "Done."
