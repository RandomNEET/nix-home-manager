{
  description = "Multi-user home-manager flake (with users and opts)";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    nur.url = "github:nix-community/NUR";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      # If you are not running an unstable channel of nixpkgs, select the corresponding branch of nixvim.
      # url = "github:nix-community/nixvim/nixos-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    betterfox = {
      url = "github:yokoffing/Betterfox";
      flake = false;
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
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
                ./users/${name}/home.nix
                {
                  nixpkgs.overlays = [
                    (final: prev: import ./pkgs { pkgs = final; })
                  ];
                }
              ];
            };
          }
        ) users
      );
    };
}
