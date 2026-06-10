#!/usr/bin/env bash
#
# Toggle Alacritty between day and night themes.
#
# Usage:
#   toggle-theme.sh           Toggle between day/night
#   toggle-theme.sh day       Force day theme
#   toggle-theme.sh night     Force night theme
#   toggle-theme.sh status    Show which theme is currently active

set -euo pipefail

# ── Configuration ────────────────────────────────────────────────────────────
# Customize these to use your preferred theme pair.
DAY_THEME="themes/dayfox.toml"
NIGHT_THEME="themes/night_owl.toml"
CONFIG_FILE="${HOME}/.config/alacritty/alacritty.toml"

# ── Helpers ──────────────────────────────────────────────────────────────────
log()  { printf '==> %s\n' "$*"; }
err()  { printf '!!  %s\n' "$*" >&2; }

active_theme() {
  # Returns "day" or "night" based on which theme line is uncommented.
  if   grep -qE "^\s+\"${DAY_THEME}\"" "$CONFIG_FILE" 2>/dev/null; then
    echo "day"
  elif grep -qE "^\s+\"${NIGHT_THEME}\"" "$CONFIG_FILE" 2>/dev/null; then
    echo "night"
  else
    echo "unknown"
  fi
}

# ── Entry point ──────────────────────────────────────────────────────────────

if [[ ! -f "$CONFIG_FILE" ]]; then
  err "Config file not found: $CONFIG_FILE"
  exit 1
fi

# Resolve requested target
case "${1:-toggle}" in
  day)    target="day"    ;;
  night)  target="night"  ;;
  status) log "Current theme: $(active_theme)"; exit 0 ;;
  toggle)
    current="$(active_theme)"
    case "$current" in
      day)    target="night" ;;
      night)  target="day"   ;;
      *)
        err "Cannot determine current theme — is '${DAY_THEME}' or '${NIGHT_THEME}' present in the config?"
        exit 1
        ;;
    esac
    ;;
  *)
    err "Unknown argument: $1"
    err "Usage: $0 [day|night|toggle|status]"
    exit 1
    ;;
esac

# No-op if already on the desired theme
if [[ "$target" == "$(active_theme)" ]]; then
  log "Already using ${target} theme. Nothing to do."
  exit 0
fi

# Perform the swap: comment out the currently-active theme, uncomment the target.
case "$target" in
  day)
    sed -i \
      -e "s|^\(\s*\)\"${NIGHT_THEME}\"|\1# \"${NIGHT_THEME}\"|" \
      -e "s|^\(\s*\)# \"${DAY_THEME}\"|\1\"${DAY_THEME}\"|" \
      "$CONFIG_FILE"
    ;;
  night)
    sed -i \
      -e "s|^\(\s*\)\"${DAY_THEME}\"|\1# \"${DAY_THEME}\"|" \
      -e "s|^\(\s*\)# \"${NIGHT_THEME}\"|\1\"${NIGHT_THEME}\"|" \
      "$CONFIG_FILE"
    ;;
esac

log "Switched to ${target} theme. Alacritty will pick up the change automatically."
