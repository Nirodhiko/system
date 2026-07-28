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

## Goldendict
- Disable goldendict scan function.
- Shortcut: sh -c 'goldendict "$(wl-paste --primary)"'

## Zathura
- /home/niro/.config/zathura/zlast.sh: Must using absolute path when binding to the keybinding of Gnome.