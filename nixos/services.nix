{ config, pkgs, ... }:

{
  # Desktop environment & shell tools & Nix LD
  programs.nix-ld.enable = true;
  programs.fish.enable = true;

  # GNOME desktop
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  programs.git.enable = true;
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-advanced-masks
    ];
  };

  # Docker container runtime
  virtualisation.docker.enable = true;

  services.udisks2.enable = true;
  services.openssh.enable = true;

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

  # Input method: fcitx5 with Rime
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-rime
    ];
  };
}
