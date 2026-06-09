## NixOS update
nix flake update

## NixOS rebuild
sudo nixos-rebuild switch --flake $HOME/system/nixos#nixos

## Adjusting float window size in niri
Hold `Mod` drag with Right Mouse Button anywhere on the window. Move the mouse to resize.

## Fix onlyoffice-desktopeditors bug 
- Copying custom fonts to .local/share/fonts.
- Run `fc-cache -fv ~/.local/share/fonts`

## Disable `Ctrl+;` shortcut in configuration addon settings of fcitx5.