{ config, pkgs, ... }:

{
  users.users.niro = {
    isNormalUser = true;
    description = "Niro";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    shell = pkgs.fish;
  };
}
