{ config, pkgs, ... }:

{
  # GDM needs the user's shell in /etc/shells to show the user
  environment.shells = with pkgs; [ fish ];

  environment.variables = {
    # XWayland apps (like WeChat) still need these
    XMODIFIERS    = "@im=fcitx";
    SDL_IM_MODULE = "fcitx";
    # Set default editor
    EDITOR        = "zeditor";
    VISUAL        = "zeditor";
  };
}
