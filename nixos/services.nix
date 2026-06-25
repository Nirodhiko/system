{ config, pkgs, ... }:

{
  # Wayland compositor & shell tools & Nix LD
  programs.nix-ld.enable = true;
  programs.niri.enable = true;
  programs.fish.enable = true;
  programs.git.enable = true;
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-advanced-masks
    ];
  };


  # Docker container runtime
  virtualisation.docker.enable = true;

  #
  services.udisks2.enable = true;
  services.openssh.enable = true;

  # Display manager: SDDM on Wayland with the Astronaut theme.
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    package = pkgs.kdePackages.sddm; # Qt 6 build (recommended)
    theme = "sddm-astronaut-theme";
    extraPackages = with pkgs.kdePackages; [
      qtsvg
      qtmultimedia
      qtvirtualkeyboard
    ];
  };

  # Audio: PipeWire stack
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Caps Lock → Ctrl (hold) / Esc (tap)
  services.keyd = {
    enable = true;
    keyboards.default = {
      ids = [ "*" ];
      settings.main.capslock = "overload(control, esc)";
    };
  };

  # Text expander (Wayland variant for niri)
  services.espanso = {
    enable = true;
    package = pkgs.espanso-wayland;
  };

    # Input method: fcitx5 with Rime
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-rime
    ];
  };
}
