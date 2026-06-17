{ config, pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      nerd-fonts.fira-code
      fira-code-symbols
    ];

    fontconfig = {
      enable = true;
      antialias = true;

      hinting = {
        enable = true;
        style = "slight"; # "none" | "slight" | "medium" | "full"
        autohint = false; # true = FreeType's autohinter (good for fonts without hints)
      };

      subpixel = {
        rgba = "rgb"; # "rgb" | "bgr" | "vrgb" | "vbgr" | "none"
        lcdfilter = "default"; # "none" | "default" | "light" | "legacy"
      };

      defaultFonts = {
        serif = [ "Noto Serif" ];
        sansSerif = [ "Noto Sans" ];
        monospace = [ "Fira Code" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
