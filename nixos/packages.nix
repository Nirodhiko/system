{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Dev tooling
    nixd # Nix language server for IDE support
    nodejs
    pnpm
    zed-editor

    # Wayland session helpers
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
    wget
    btop
    ncdu
    fastfetch

    # Archives
    unzip
    unrar
    p7zip

    # Apps
    google-chrome
    wechat-uos
    wpsoffice
    zapzap
    obs-studio
    inkscape
    sigil
    foliate
    sioyek
    goldendict-ng

    # Theming
    adwaita-icon-theme
  ];
}
