{ config, inputs, pkgs, ... }:

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

    # session helpers
    wl-clipboard
    xdotool
    brightnessctl

    # Terminal & shell tools
    ghostty
    wireguard-tools
    wget
    ncdu
    fastfetch

    # Archives
    unzip
    unrar
    p7zip

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
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
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
    fragments
    localsend
    gnome-feeds
    authenticator
    gradia
    resources
    # davinci-resolve # video editor, need GPU.
  ];

  # Remove unwanted GNOME default apps
  environment.gnome.excludePackages = with pkgs; [
    epiphany       # GNOME Web browser
    gnome-console
    gnome-tour     # GNOME Tour / Welcome app
  ];
}
