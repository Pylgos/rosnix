{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    poetry2nix.url = "github:nix-community/poetry2nix";
    rosnix-generator.url = "github:Pylgos/rosnix-generator";
  };

  outputs =
    {
      self,
      flake-utils,
      nixpkgs,
      poetry2nix,
      rosnix-generator,
    }:
    let
      lib = flake-utils.lib // nixpkgs.lib // builtins;
    in
    (lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        selfLegacyPackages = self.legacyPackages.${system};
      in
      {
        legacyPackages = lib.mapAttrs (
          name: overlay:
          import nixpkgs {
            inherit system;
            overlays = [ overlay ];
          }
        ) self.overlays;

        ci = rec {
          distros = lib.mapAttrs (
            _distro_name: pkgs: lib.filterAttrs (_name: value: lib.isDerivation value) pkgs.rosPackages
          ) (lib.removeAttrs selfLegacyPackages [ "default" ]);

          all = lib.mapAttrs (
            distro: rosPkgs:
            pkgs.stdenv.mkDerivation {
              name = "rosnix-ci-${distro}-all-pkgs";
              deps = lib.attrValues rosPkgs;
              phases = [ "installPhase" ];
              installPhase = "touch $out";
            }
          ) distros;

          check = lib.mapAttrs (
            distro: rosPkgs:
            pkgs.stdenv.mkDerivation {
              name = "rosnix-ci-${distro}-check-pkgs";
              deps = [
                rosPkgs.desktop
                rosPkgs.cartographer
                rosPkgs.slam_toolbox
              ];
              phases = [ "installPhase" ];
              installPhase = "touch $out";
            }
          ) distros;
        };

        apps = {
          ci-update = lib.mkApp {
            drv = pkgs.writeShellApplication {
              name = "rosnix-ci-update";
              runtimeInputs = [
                pkgs.poetry
                rosnix-generator.packages.${system}.default
              ];
              text = ''
                set -eu
                pushd poetry
                poetry update --lock
                git add ./poetry.lock
                if ! git diff --quiet --cached ./poetry.lock; then
                  git commit -m "Update poetry.lock"
                fi
                popd
                rosnix-generator --config-file ./rosnix.toml generate --report-file /tmp/report.md
                git add ./generated
                if ! git diff --quiet --cached ./generated; then
                  git commit -m "Regenerate distro files" -m "$(cat /tmp/report.md)"
                fi
              '';
            };
          };
          ci-build = lib.mkApp {
            drv = pkgs.writeShellApplication {
              name = "rosnix-ci-build";
              runtimeInputs = [ pkgs.cachix ];
              text = ''
                set -eu
                distro=$1
                attr=".#ci.${system}.check.$distro"
                if nix build "$attr" --dry-run |& grep 'will be built:' > /dev/null; then
                  cachix watch-exec rosnix -- nix build "$attr" -L
                else
                  echo "$attr is already built or cached. skipping..."
                fi
              '';
            };
          };
          ci-build-all = lib.mkApp {
            drv = pkgs.writeShellApplication {
              name = "rosnix-ci-build-all";
              runtimeInputs = [ pkgs.cachix ];
              text = ''
                set -eu
                distro=$1
                attr=".#ci.${system}.all.$distro"
                if nix build "$attr" --dry-run |& grep 'will be built:' > /dev/null; then
                  cachix watch-exec rosnix -- nix build "$attr" -L --keep-going || true
                else
                  echo "$attr is already built or cached. skipping..."
                fi
              '';
            };
          };
        };
      }
    ))
    // {
      lib = {
        distributions = map ({ name, value }: name) (
          lib.attrsToList (if lib.pathExists ./generated then lib.readDir ./generated else { })
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
        mkOverlay = (
          { config }:
          import ./overlay.nix {
            inherit lib poetry2nix;
            config = self.lib.configs.default // config;
          }
        );
      };
      overlays = lib.mapAttrs (name: config: self.lib.mkOverlay { inherit config; }) self.lib.configs;
    };
}
