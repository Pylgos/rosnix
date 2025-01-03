{
  nixConfig = {
    extra-substituters = [ "https://rosnix.cachix.org" ];
    extra-trusted-public-keys = [ "rosnix.cachix.org-1:FiqDDVzOzRB9i2Ai/sHxXkhRr71LRF/3i8QEjju70o8=" ];
  };

  inputs = {
    crane.url = "github:ipetkov/crane";
    flake-utils.url = "github:numtide/flake-utils";
    nix-filter.url = "github:numtide/nix-filter";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    poetry2nix.url = "github:nix-community/poetry2nix";
  };

  outputs =
    {
      self,
      flake-utils,
      nixpkgs,
      poetry2nix,
      crane,
      nix-filter,
    }:
    let
      lib = flake-utils.lib // nixpkgs.lib // builtins;
    in
    (lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        craneLib = crane.mkLib pkgs;
        selfLegacyPackages = self.legacyPackages.${system};
        generator = self.packages.${system}.generator;
      in
      {
        packages.generator = pkgs.callPackage ./generator {
          inherit craneLib;
          inherit (nix-filter.lib) filter;
        };
        devShells.generator = pkgs.callPackage ./generator/shell.nix { };

        legacyPackages = lib.mapAttrs (
          name: overlay:
          import nixpkgs {
            inherit system;
            overlays = [ overlay ];
          }
        ) self.overlays;

        ci = import ./ci/outputs.nix { inherit lib pkgs selfLegacyPackages; };
        apps = import ./ci/apps.nix { inherit lib pkgs generator; };
        checks = import ./tests {
          inherit lib;
          pkgs = selfLegacyPackages.default;
        };
      }
    ))
    // {
      lib = {
        distributions = map ({ name, value }: name) (
          lib.attrsToList (
            if lib.pathExists ./ros-packages/generated then lib.readDir ./ros-packages/generated else { }
          )
        );
        configs =
          (lib.listToAttrs (
            map (name: {
              inherit name;
              value = {
                distro = name;
              };
            }) self.lib.distributions
          ))
          // {
            default = self.lib.configs.jazzy;
          };
        mkOverlay = config: import ./overlay.nix { inherit lib poetry2nix config; };
      };
      overlays = lib.mapAttrs (name: config: self.lib.mkOverlay config) self.lib.configs;
    };
}
