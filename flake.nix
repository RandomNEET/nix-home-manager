{
  description = "howl's flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";
    nur.url = "github:nix-community/NUR";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ nixpkgs, home-manager, ... }:
    let
      users = builtins.filter (name: builtins.pathExists ./users/${name}/options.nix) (
        builtins.attrNames (builtins.readDir ./users)
      );
    in
    {
      homeConfigurations = builtins.listToAttrs (
        map (
          name:
          let
            system = "x86_64-linux"; # x86_64-linux aarch64-linux
            opts = import ./users/${name}/options.nix;
          in
          {
            name = opts.username;
            value = home-manager.lib.homeManagerConfiguration {
              pkgs = import nixpkgs { inherit system; };
              extraSpecialArgs = {
                inherit inputs opts;
              };
              modules = [
                ./users/${name}
                {
                  nixpkgs.overlays = import ./overlays { inherit inputs; };
                }
              ];
            };
          }
        ) users
      );
    };
}
