{ config, pkgs, ... }:

{
  # Fix the rime window can't popup on wechat
  environment.sessionVariables = {
      QT_IM_MODULE  = "fcitx";
      GTK_IM_MODULE = "fcitx";
      XMODIFIERS    = "@im=fcitx";
      SDL_IM_MODULE = "fcitx";
  };
}
