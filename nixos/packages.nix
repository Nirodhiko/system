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
    swappy
    grim
    slurp
    swayimg
    brightnessctl

    # Terminal & shell tools
    alacritty
    yazi
    wireguard-tools
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
    typora

  ];
}
