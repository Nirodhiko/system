{ config, pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      nerd-fonts.fira-code
      fira-code-symbols
      # Custom fonts — drop .ttf/.otf/.ttc files into ./fonts/ (system/fonts)
      (pkgs.runCommand "custom-fonts" { } ''
        mkdir -p $out/share/fonts/truetype $out/share/fonts/opentype
        shopt -s nullglob
        for f in ${./fonts}/*.ttf ${./fonts}/*.ttc; do cp "$f" $out/share/fonts/truetype/; done
        for f in ${./fonts}/*.otf; do cp "$f" $out/share/fonts/opentype/; done
        shopt -u nullglob
      '')
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
