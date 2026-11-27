{ inputs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Ai
    goose-cli      # Block's goose AI agent (CLI)
    goose-desktop  # goose Desktop (Electron GUI, x86_64-linux only)

    # Dev tooling
    nixd # Nix language server for IDE support
    nodejs
    pnpm
    zed-editor
    python3
    python312Packages.pip
    rustup
    cargo-watch
    gcc

    # session helpers
    wl-clipboard
    xdotool
    brightnessctl

    # Terminal & shell tools
    ghostty
    wireguard-tools
    wget
    ncdu
    btop
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
    # Pinned to v109 (nixpkgs ships v110). Drop the override to follow nixpkgs again.
    (gnomeExtensions.dash-to-dock.overrideAttrs (old: {
      version = "109";
      src = fetchzip {
        url = "https://github.com/ubuntu/dash-to-dock/releases/download/extensions.gnome.org-v109/dash-to-dock%40micxgx.gmail.com.zip";
        hash = "sha256-HNMJQ5iXFkTdsnplmAMq0WLh+gRW9gasjSATcHtLGUo=";
        stripRoot = false;
      };
    }))
    gnomeExtensions.hide-top-bar
    gnomeExtensions.user-themes

    gnome-tweaks
    bibata-cursors        # cursor theme
    reversal-icon-theme   # icon theme
    whitesur-gtk-theme    # GTK + GNOME Shell theme (WhiteSur-Light / -Dark)

    # Apps
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    google-chrome # unfree; allowed via nixpkgs.config.allowUnfree
    wechat-uos
    gitui
    onlyoffice-desktopeditors
    zapzap
    inkscape
    blender
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
