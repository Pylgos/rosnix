{
  lib,
  poetry2nix,
  config,
}:

let
  configOverlay = final: prev: {
    rosConfig = lib.makeExtensibleWithCustomName "override" (
      finalConfig: { distro = "jazzy"; } // config
    );
  };
  systemPackagesOverlay = import ./system-packages/overlay.nix { inherit lib; };
  rosPackagesOverlay = import ./ros-packages/overlay.nix { inherit lib; };
  overrides = import ./ros-packages/overrides { inherit lib; };
in
lib.composeManyExtensions [
  poetry2nix.overlays.default
  configOverlay
  systemPackagesOverlay
  rosPackagesOverlay
  overrides
]
