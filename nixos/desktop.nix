{ config, pkgs, ... }:

{
  # Display manager (TTY-based, no X server needed)
  services.displayManager.ly.enable = true;

  # Wayland compositor & shell tools
  programs.niri.enable = true;
  programs.fish.enable = true;
  programs.git.enable = true;

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
