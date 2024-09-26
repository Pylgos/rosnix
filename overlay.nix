{
  lib,
  poetry2nix,
  config,
}:

let
  systemPackagesOverlay = import ./system-packages/overlay.nix { inherit lib config; };
  mainOverlay = import ./main-overlay.nix { inherit lib config; };
  overrides = import ./overrides { inherit lib config; };
in
lib.composeManyExtensions [
  poetry2nix.overlays.default
  systemPackagesOverlay
  mainOverlay
  overrides
]
