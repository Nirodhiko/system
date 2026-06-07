## Nixos configuration
sudo ln -s $HOME/system/configuration.nix  /etc/nixos/configuration.nix

## Adjusting float window size in niri
Hold `Mod` drag with Right Mouse Button anywhere on the window. Move the mouse to resize.

## Fix onlyoffice-desktopeditors bug 
- Copying custom fonts to .local/share/fonts.
- Run `fc-cache -fv ~/.local/share/fonts`
