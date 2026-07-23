{ config, pkgs, inputs, ... }:

let
  unstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
    config.allowUnfree = true;
  };
in
{
  environment.systemPackages = with pkgs; [
    # Ai
    opencode

    # Dev tooling
    nixd # Nix language server for IDE support
    nodejs
    pnpm
    unstable.zed-editor
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

    # GNOME extensions
    gnomeExtensions.blur-my-shell
    gnomeExtensions.burn-my-windows
    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-dock
    gnomeExtensions.just-perfection
    gnomeExtensions.no-titlebar-when-maximized
    gnomeExtensions.user-themes

    # GNOME tools
    gnome-tweaks

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
