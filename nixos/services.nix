{ config, pkgs, ... }:

{
  # -----------------------------------------------------------------------
  # Programs
  # -----------------------------------------------------------------------
  programs.fish.enable = true;
  programs.git.enable = true;
  programs.vim.defaultEditor = true;

  # -----------------------------------------------------------------------
  # Services
  # -----------------------------------------------------------------------
  services.udisks2.enable = true;

  services.keyd = {
    enable = true;
    keyboards.default = {
      ids = [ "*" ];
      settings.main.capslock = "overload(control, esc)";
    };
  };

  virtualisation.docker.enable = true;
  services.caddy.enable = true;
}
