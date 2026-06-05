# NixOS manual (accessible by running ‘nixos-help’).
{ config, pkgs, ... }:

{
  #
  imports =
    [
      /etc/nixos/hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # timeZone
  time.timeZone = "Asia/Karachi";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Input method - fcitx5 with Rime
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-rime
      fcitx5-gtk
    ];
  };

  #
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;

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
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  #.
  programs.fish.enable = true;
  programs.niri.enable = true;

  #
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    google-chrome
    wget
    zed-editor
    alacritty
    git
    foliate
    sioyek
    goldendict-ng
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
    nodejs
    pnpm
  ];
  environment.variables = {
    XCURSOR_THEME = "Adwaita";
    XCURSOR_SIZE = "18";
  };

  #
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        # Boots into tuigreet, which then launches niri-session
        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd niri-session";
        user = "niro";
      };
    };
  };

  # fonts
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      nerd-fonts.fira-code
      fira-code-symbols
    ];

    fontconfig = {
      enable = true;
      antialias = true;

      hinting = {
        enable = true;
        style = "slight";   # "none" | "slight" | "medium" | "full"
        autohint = false;   # true = FreeType's autohinter (good for fonts without hints)
      };

      subpixel = {
        rgba = "rgb";       # "rgb" | "bgr" | "vrgb" | "vbgr" | "none"
        lcdfilter = "default"; # "none" | "default" | "light" | "legacy"
      };

      # Set system-wide default fonts
      defaultFonts = {
        serif      = [ "Noto Serif" ];
        sansSerif  = [ "Noto Sans" ];
        monospace  = [ "Fira Code" ];
        emoji      = [ "Noto Color Emoji" ];
      };
    };
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
