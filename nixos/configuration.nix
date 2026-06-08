{ config, pkgs, ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ./boot.nix
    ./desktop.nix
    ./fonts.nix
    ./packages.nix
    ./users.nix
    ./variables.nix
  ];

  # Hostname & networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Locale & time
  time.timeZone = "Asia/Karachi";
  i18n.defaultLocale = "en_US.UTF-8";

  # Nix daemon settings
  nixpkgs.config.allowUnfree = true;
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    auto-optimise-store = true;
  };

  # Automatic garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  # Clean /tmp on every boot
  boot.tmp.cleanOnBoot = true;

  # Do not change after install — see `man configuration.nix`.
  system.stateVersion = "26.05";
}
