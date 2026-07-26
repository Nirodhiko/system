{
  description = "Niro's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      # recommended if you track nixpkgs-unstable — shares system libs,
      # improves startup time, and avoids build failures
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
        ./environment.nix
        {
          # Hardware
          hardware.enableRedistributableFirmware = true;

          # Hostname & networking
          networking.hostName = "nixos";
          networking.networkmanager.enable = true;
          # For localsend
          networking.firewall.allowedTCPPorts = [ 53317 ];
          networking.firewall.allowedUDPPorts = [ 53317 ];

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
