{
    description = "NixOS config w/home-manager";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        nvf.url = "github:notashelf/nvf";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, home-manager, nvf, ... }:
    let
        system = "x86_64-linux";
        host = "desktop";
        user = "antonio";
    in {
        packages.system.default = 
            (nvf.lib.neovimConfiguration {
                pkgs = nixpkgs.legacyPackages.system;
                modules = [ ./nvf-configuration.nix ];
            }).neovim;

        nixosConfigurations.magic-33 = nixpkgs.lib.nixosSystem {
            inherit system;

            modules = [
                ./hosts/${host}/configuration.nix
                
                nvf.nixosModules.default

                home-manager.nixosModules.home-manager

                {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;

                    home-manager.users.${user} = import ./home/${user}.nix;
                }
            ];
        };
    };
}

