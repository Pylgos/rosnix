{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/24.05";
    poetry2nix.url = "github:nix-community/poetry2nix";
    rosnix-generator.url = "github:Pylgos/rosnix-generator";
    nix-mass-build.url = "github:Pylgos/nix-mass-build";
  };

  outputs =
    {
      self,
      flake-utils,
      nixpkgs,
      poetry2nix,
      rosnix-generator,
      nix-mass-build,
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

        ci = lib.mapAttrs (
          name: pkgs:
          {
            inherit (pkgs.python3Packages) colcon-common-extensions;
          }
          // (lib.filterAttrs (name: value: lib.isDerivation value) pkgs.rosPackages)
        ) (lib.removeAttrs selfLegacyPackages [ "default" ]);

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
              runtimeInputs = [
                pkgs.cachix
                nix-mass-build.packages.${system}.default
              ];
              text = ''
                set -eu
                distro=$1
                cachix daemon run rosnix >/tmp/cachix-log.txt 2>&1 &
                #shellcheck disable=SC2016
                nix-mass-build .#ci.x86_64-linux."$distro" --up-to desktop --gc-roots-dir ./gc-roots --out-dir ./results \
                  --upload-command 'cachix daemon push ''${UPLOAD_STORE_PATH}' \
                  --substituters https://cache.nixos.org --substituters https://rosnix.cachix.org
                cache daemon stop
              '';
            };
          };
        };
      }
    ))
    // {
      lib.distributions = map ({ name, value }: name) (
        lib.attrsToList (if lib.pathExists ./generated then lib.readDir ./generated else { })
      );
      lib.configs.default = {
        distro = "jazzy";
      };
      lib.mkOverlay = (
        { config }:
        import ./overlay.nix {
          inherit lib poetry2nix;
          config = self.lib.configs.default // config;
        }
      );
      overlays =
        (lib.listToAttrs (
          map (name: {
            inherit name;
            value = self.lib.mkOverlay {
              config = {
                distro = name;
              };
            };
          }) self.lib.distributions
        ))
        // {
          default = self.overlays.jazzy;
        };
    };
}
