## NixOS update
nix flake update

## NixOS rebuild
sudo nixos-rebuild switch --flake $HOME/system/nixos#nixos

## Fix onlyoffice-desktopeditors bug 
- Copying custom fonts to .local/share/fonts.
- Run `fc-cache -fv ~/.local/share/fonts`

## Disable `Ctrl+;` shortcut in configuration addon settings of fcitx5.

## Copy wireguard config to `~/.config/wireguard/`

## Fonts
- Install poppins font.

## Themes
- Cursor: Bibata
- Icons: Reversal
