{ config, pkgs, ... }:

let
  codewhale = pkgs.stdenv.mkDerivation rec {
    pname = "codewhale";
    version = "0.8.55";

    src_codewhale = pkgs.fetchurl {
      url = "https://github.com/Hmbown/CodeWhale/releases/download/v${version}/codewhale-linux-x64";
      sha256 = "8f09f7aca0dd6bb9dfb5a34ba8c5cd83eb6389cb21382e2cd7b4ad7d2c93b845";
    };

    src_codewhale_tui = pkgs.fetchurl {
      url = "https://github.com/Hmbown/CodeWhale/releases/download/v${version}/codewhale-tui-linux-x64";
      sha256 = "d42c687eef7ce91d61c7503544d2eabd11ab985218be244891d3bfa70f8b225f";
    };

    nativeBuildInputs = with pkgs; [ autoPatchelfHook ];
    buildInputs = with pkgs; [ stdenv.cc.cc.lib zlib dbus ];

    dontUnpack = true;
    dontBuild = true;

    installPhase = ''
      mkdir -p $out/bin
      cp $src_codewhale $out/bin/codewhale
      cp $src_codewhale_tui $out/bin/codewhale-tui
      chmod +x $out/bin/codewhale $out/bin/codewhale-tui
    '';

    meta = with pkgs.lib; {
      description = "DeepSeek + MiMo coding agent in terminal";
      homepage = "https://github.com/Hmbown/CodeWhale";
      license = licenses.mit;
      platforms = [ "x86_64-linux" ];
      mainProgram = "codewhale";
    };
  };
in

{
  environment.systemPackages = with pkgs; [
    # Ai
    codewhale

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
    obs-studio
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
