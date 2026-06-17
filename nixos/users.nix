{ config, pkgs, ... }:

{
  users.users.niro = {
    isNormalUser = true;
    description = "Niro";
    initialPassword = "niro";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    shell = pkgs.fish;
  };

  users.users.root.initialPassword = "niro";
}
