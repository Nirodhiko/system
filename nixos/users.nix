{ config, pkgs, ... }:

{
  users.users.niro = {
    isNormalUser = true;
    description = "Niro";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "video"
    ];
    shell = pkgs.fish;
  };
}
