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
    xdotool
    swappy
    grim
    slurp
    brightnessctl

    # Terminal & shell tools
    ghostty
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

    # GNOME extensions
    gnomeExtensions.hide-cursor
    gnomeExtensions.blur-my-shell
    gnomeExtensions.burn-my-windows
    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-dock
    gnomeExtensions.just-perfection
    gnomeExtensions.user-themes

    # GNOME tools
    gnome-tweaks

    # Apps
    google-chrome
    wechat-uos
    gitui
    onlyoffice-desktopeditors
    zapzap
    inkscape
    sigil
    zathura
    zathuraPkgs.zathura_pdf_mupdf
    sqlite # for zathura
    goldendict-ng
    typora
    thunderbird
    # davinci-resolve # video editor, need GPU.
  ];
}
