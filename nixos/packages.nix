{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Ai
    opencode

    # Dev tooling
    nixd # Nix language server for IDE support
    nodejs
    pnpm
    zed-editor
    python3
    python312Packages.pip

    # Wayland session helpers
    wev
    wl-clipboard
    swaylock
    swayidle
    swaybg
    waybar
    fuzzel
    xwayland-satellite
    sway-contrib.grimshot
    swappy
    swayimg
    brightnessctl

    # Terminal & shell tools
    alacritty
    yazi
    wget
    btop
    ncdu
    fastfetch

    # Archives
    unzip
    unrar
    p7zip

    # Video
    mpv
    celluloid

    # Apps
    google-chrome
    wechat-uos
    onlyoffice-desktopeditors
    zapzap
    inkscape
    sigil
    foliate
    sioyek
    goldendict-ng

    # Theming
    adwaita-icon-theme

    # SDDM theme — referenced by services.displayManager.sddm.theme in desktop.nix.
    # Variants: astronaut | black_hole | cyberpunk | hyprland_kath |
    #           japanese_aesthetic | jake_the_dog | pixel_sakura |
    #           pixel_sakura_static | purple_leaves
    # https://github.com/Keyitdev/sddm-astronaut-theme
    (sddm-astronaut.override { embeddedTheme = "jake_the_dog"; })
  ];
}
