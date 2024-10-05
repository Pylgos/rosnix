{
  lib,
  poetry2nix,
  config,
}:

let
  configOverlay = final: prev: {
    rosConfig = lib.makeExtensible (
      finalConfig:
      {
        distro = "jazzy";
        pythonForRos =
          {
            jazzy = final.python311; # python3.12 breaks sip4 and pyside2
            rolling = final.python311;
          }
          .${finalConfig.distro};
      }
      // config
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
