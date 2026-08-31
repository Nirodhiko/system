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
      "audio"
      "camera"
      "lpadmin"
    ];
    shell = pkgs.fish;
  };
}
