{ config, pkgs, ... }:

{
  environment.variables = {
      # XWayland apps (like WeChat) still need these
      XMODIFIERS    = "@im=fcitx";
      SDL_IM_MODULE = "fcitx";
      # Set default editor
      EDITOR        = "zeditor";
      VISUAL        = "zeditor";
  };
}
