{
  description = "epik's NixOS and Home Manager configuration";

  outputs = inputs@{ self, nixpkgs, home-manager, flake-parts, ... }: 
  flake-parts.lib.mkFlake { inherit inputs; } {
  systems = [ "x86_64-linux" ];
  flake = {
    nixosConfigurations = {
      justin-nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
	      specialArgs = {
	        inherit inputs;
	      };
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.justin = import ./home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
	          home-manager.extraSpecialArgs = {inherit inputs;};
             
          }
        ];
      };
    };
  };
     perSystem = { config, ... }: {
	# dont know what this means
	
	
 };
};


  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nix-gaming.url = "github:fufexan/nix-gaming";
    fufexan-dotfiles.url = "github:fufexan/dotfiles";
    fufexan-dotfiles.inputs.nixpkgs.follows = "nixpkgs";
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
 }

