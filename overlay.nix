{
  lib,
  poetry2nix,
  config,
}:

let
  systemPackagesOverlay = import ./system-packages/overlay.nix { inherit lib config; };
  rosPackagesOverlay = import ./ros-packages-overlay.nix { inherit lib config; };
  overrides = import ./overrides { inherit lib config; };
in
lib.composeManyExtensions [
  poetry2nix.overlays.default
  systemPackagesOverlay
  rosPackagesOverlay
  overrides
]
