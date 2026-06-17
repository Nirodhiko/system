{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Ai
    opencode

    # Dev tooling
    nodejs
    pnpm
    python3
    python312Packages.pip
    vim

    # Shell tools
    wget
    btop
    ncdu
    fastfetch

    # Archives
    unzip
    unrar
    p7zip
  ];
}
