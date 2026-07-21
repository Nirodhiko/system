{
  description = "Niro's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./hardware-configuration.nix

        ./boot.nix
        ./services.nix
        ./fonts.nix
        ./packages.nix
        ./users.nix
        ./variables.nix

        {
          # Hardware
          hardware.enableRedistributableFirmware = true;

          # Hostname & networking
          networking.hostName = "nixos";
          networking.networkmanager.enable = true;

          # Locale & time
          time.timeZone = "Asia/Karachi";
          i18n.defaultLocale = "en_US.UTF-8";

          # Nix daemon settings
          nixpkgs.config.allowUnfree = true;
          nix.settings = {
            experimental-features = [
              "nix-command"
              "flakes"
            ];
            auto-optimise-store = true;
          };

          # Automatic garbage collection
          nix.gc = {
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 14d";
          };

          # Clean /tmp on every boot
          boot.tmp.cleanOnBoot = true;

          system.stateVersion = "26.05";
        }
      ];
    };
  };
}
