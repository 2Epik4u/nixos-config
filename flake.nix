{
  description = "epik's NixOS and Home Manager configuration";

  outputs = inputs@{ self, nixpkgs, home-manager, hyprland, grub2-themes, ... }: {
    homeConfigurations."justin@justin-nixos" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [
        hyprland.homeManagerModules.default
        # ...
      ];
    };
    nixosConfigurations = {
      justin-nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./machines/justin-nixos/configuration.nix
          home-manager.nixosModules.home-manager
          grub2-themes.nixosModules.default
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.justin = import ./machines/justin-nixos/home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
            home-manager.extraSpecialArgs = {inherit inputs;};
         }
        ];
      };

      justin-laptop-nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./machines/justin-laptop-nixos/configuration.nix
          home-manager.nixosModules.home-manager
          grub2-themes.nixosModules.default
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.justin = import ./machines/justin-laptop-nixos/home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
            home-manager.extraSpecialArgs = {inherit inputs;};
         }
        ];
      };


    };
  };
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
    };
    linuxmobile = {
      url = "github:2Epik4u/kaku";
    };
    home-manager =  {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-gaming = {
      url = "github:fufexan/nix-gaming";
    };
    grub2-themes = {
      url = "github:vinceliuice/grub2-themes";
    };
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
 }

