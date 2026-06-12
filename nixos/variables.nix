{ config, pkgs, ... }:

{
  environment.variables = {
      # Fix the rime window can't popup on wechat
      QT_IM_MODULE  = "fcitx";
      GTK_IM_MODULE = "fcitx";
      XMODIFIERS    = "@im=fcitx";
      SDL_IM_MODULE = "fcitx";
      # Set default editor
      EDITOR        = "zeditor";
      VISUAL        = "zeditor";
  };
}
