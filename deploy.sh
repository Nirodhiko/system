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
for entry in alacritty fish niri sioyek swayimg swaylock waybar wallpapers; do
  link "$SYSTEM_DIR/$entry" "$HOME/.config/$entry"
done

# ~/<dotfile>
link "$SYSTEM_DIR/.gitconfig" "$HOME/.gitconfig"

# Rime (fcitx5 input method data)
link "$SYSTEM_DIR/rime" "$HOME/.local/share/fcitx5/rime"

# Opencode
link "$SYSTEM_DIR/ai/opencode.jsonc" "$HOME/.config/opencode/opencode.jsonc"
link "$SYSTEM_DIR/ai/AGENTS.md" "$HOME/.config/opencode/AGENTS.md"

# Zed
link "$SYSTEM_DIR/zed/keymaps.json" "$HOME/.config/zed/keymaps.json"
link "$SYSTEM_DIR/zed/settings.json" "$HOME/.config/zed/settings.json"

# Download alacritty themes to $HOME/.config/alacritty/themes if it doesn't exist.
if [[ ! -d "$HOME/.config/alacritty/themes" ]]; then
  git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
  # move the themes to the correct directory
  mv ~/.config/alacritty/themes/themes/* ~/.config/alacritty/themes/
  rm -rf ~/.config/alacritty/themes/themes
fi

# hardware-configuration.nix — copy from /etc/nixos so the flake stays
# in sync with the hardware declared by the running system.
HW_SRC="/etc/nixos/hardware-configuration.nix"
HW_DST="$SYSTEM_DIR/nixos/hardware-configuration.nix"
if [[ -f "$HW_SRC" ]]; then
  cp -f "$HW_SRC" "$HW_DST"
  log "$HW_DST <- $HW_SRC"
else
  warn "$HW_SRC not found; hardware-configuration.nix was NOT updated"
fi

# NixOS configuration — now managed via flakes.
# Rebuild with: sudo nixos-rebuild switch --flake "$SYSTEM_DIR/nixos#nixos"
log "To rebuild: sudo nixos-rebuild switch --flake $SYSTEM_DIR/nixos#nixos"

log "Done."
