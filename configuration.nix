# NixOS manual (accessible by running ‘nixos-help’).
{ config, pkgs, ... }:

{
  #
  imports = [
    /etc/nixos/hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # Hide the systemd-boot menu entirely (hold a key during boot to show it).
  boot.loader.timeout = 0;

  # Silent boot & shutdown — no kernel messages, no systemd status, no cursor.
  boot.kernelParams = [
    "quiet"
    "splash"
    "loglevel=3"
    "rd.systemd.show_status=false"
    "rd.udev.log_level=3"
    "udev.log_priority=3"
    "systemd.show_status=false"
    "vt.global_cursor_default=0"
  ];
  boot.consoleLogLevel = 0;
  boot.initrd.verbose = false;

  # Use systemd in the initrd so Plymouth can show a splash from the very start.
  boot.initrd.systemd.enable = true;

  # Plymouth covers the screen during boot and shutdown so no text is ever shown.
  boot.plymouth = {
    enable = true;
    # Optional: pick a theme. Default is fine; uncomment to use BGRT (vendor logo).
    theme = "bgrt";
  };

  # networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # timeZone
  time.timeZone = "Asia/Karachi";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  #
  services.xserver.enable = true;

  services.displayManager.ly.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."niro" = {
    initialPassword = "8989";
    isNormalUser = true;
    description = "Niro";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.fish;
    packages = with pkgs; [
      #  thunderbird
    ];
  };

  #.
  programs.fish.enable = true;
  programs.niri.enable = true;

  # Packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    nixd # Nix language server for IDE support
    brightnessctl
    swaylock
    swayidle
    wget
    alacritty
    git
    fuzzel
    swaybg
    waybar
    xwayland-satellite
    wechat-uos
    wpsoffice
    adwaita-icon-theme
    ncdu
    btop
    fastfetch
    sway-contrib.grimshot
    swappy
    swayimg
    unzip
    unrar
    p7zip
    nodejs
    pnpm
    zed-editor
    google-chrome
    inkscape
    sigil
    obs-studio
    zapzap
    foliate
    sioyek
    goldendict-ng
  ];

  # cursor
  environment.variables = {
    XCURSOR_THEME = "Adwaita";
    XCURSOR_SIZE = "24";
  };

  #

  # fonts
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      nerd-fonts.fira-code
      fira-code-symbols
      # Custom fonts — drop your .ttf/.otf/.ttc files into ./fonts/
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

      # Set system-wide default fonts
      defaultFonts = {
        serif = [ "Noto Serif" ];
        sansSerif = [ "Noto Sans" ];
        monospace = [ "Fira Code" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };

  # Input method - fcitx5 with Rime
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-rime
      fcitx5-gtk
    ];
  };

  # Enable keyd and configure Caps Lock as a dual-role key
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ]; # Applies to all attached keyboards
        settings = {
          main = {
            capslock = "overload(control, esc)";
          };
        };
      };
    };
  };

  # version
  system.stateVersion = "26.05";
}
