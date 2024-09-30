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
        pkgs.poetry
        generator
      ];
      text = ''
        set -eu
        DONT_COMMIT=''${DONT_COMMIT:-}
        pushd system-packages/poetry
        poetry update --lock
        if [[ -z $DONT_COMMIT ]]; then
          git add ./poetry.lock
          if ! git diff --quiet --cached ./poetry.lock; then
            git commit -m "Update poetry.lock"
          fi
        fi
        popd
        rosnix-generator --config-file ./rosnix.toml generate --report-file /tmp/report.md
        if [[ -z $DONT_COMMIT ]]; then
          git add ./ros-packages/generated
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
        set -eu
        distro=$1
        attr=".#ci.${system}.check.$distro"
        res=$(nix build "$attr" --dry-run 2> >(tee >(cat 1>&2)))
        if grep -q 'will be built:' <<< "$res"; then
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
        res=$(nix build "$attr" --dry-run 2> >(tee >(cat 1>&2)))
        if grep -q 'will be built:' <<< "$res"; then
          cachix watch-exec rosnix -- nix build "$attr" -L --keep-going || true
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
        set -eu
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
