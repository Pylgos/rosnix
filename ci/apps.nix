{
  lib,
  pkgs,
  generator,
}:

let
  inherit (pkgs.stdenv.buildPlatform) system;
in
{
  ci-update = lib.mkApp {
    drv = pkgs.writeShellApplication {
      name = "rosnix-ci-update";
      runtimeInputs = [
        generator
        pkgs.nurl
        pkgs.poetry
      ];
      text = ''
        set -euo pipefail
        DONT_COMMIT=''${DONT_COMMIT:-}

        pushd system-packages/poetry
        poetry update --lock
        if [[ -z $DONT_COMMIT ]]; then
          git add ./poetry.lock
          if ! git diff --quiet --cached ./poetry.lock; then
            git commit -m "system-packages/poetry/poetry.lock: Update"
          fi
        fi
        popd

        rosnix-generator --config-file ./rosnix.toml generate --report-file /tmp/report.md
        ros-packages/overrides/update.bash
        if [[ -z $DONT_COMMIT ]]; then
          git add ./ros-packages
          if ! git diff --quiet --cached ./ros-packages/generated; then
            git commit -m "Update ROS packages" -m "$(cat /tmp/report.md)"
          fi
        fi
      '';
    };
  };
  ci-build = lib.mkApp {
    drv = pkgs.writeShellApplication {
      name = "rosnix-ci-build";
      runtimeInputs = [ pkgs.cachix ];
      text = ''
        set -euo pipefail
        distro=$1
        attr=".#ci.${system}.check.$distro"
        res=$(nix build "$attr" --dry-run 2> >(tee >(cat 1>&2)))
        if grep -q 'will be built:' <<< "$res"; then
          cachix watch-exec rosnix -- nix build "$attr" -L -j1
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
        set -euo pipefail
        distro=$1
        attr=".#ci.${system}.all.$distro"
        res=$(nix build "$attr" --dry-run 2> >(tee >(cat 1>&2)))
        if grep -q 'will be built:' <<< "$res"; then
          cachix watch-exec rosnix -- nix build "$attr" -L --keep-going -j1 || true
        else
          echo "$attr is already built or cached. skipping..."
        fi
      '';
    };
  };
  ci-build-generator = lib.mkApp {
    drv = pkgs.writeShellApplication {
      name = "rosnix-ci-build-generator";
      runtimeInputs = [ pkgs.cachix ];
      text = ''
        set -euo pipefail
        attr=".#generator"
        res=$(nix build "$attr" --dry-run 2> >(tee >(cat 1>&2)))
        if grep -q 'will be built:' <<< "$res"; then
          cachix watch-exec rosnix -- nix build "$attr" -L
        else
          echo "$attr is already built or cached. skipping..."
        fi
      '';
    };
  };
}
