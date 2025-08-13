{
  lib,
  config,
}:

let
  configOverlay = final: prev: {
    rosConfig = lib.makeExtensible (
      finalConfig:
      {
        distro = "jazzy";
        rosPython =
          {
            jazzy = final.python312;
            kilted = final.python312;
            rolling = final.python312;
          }
          .${finalConfig.distro};
        defaultRmwImplementation = [ final.rosPackages.rmw-fastrtps-cpp ];
        disableRmwRuntimeSelection = false;
      }
      // config
    );
  };
  systemPackagesOverlay = import ./system-packages/overlay.nix { inherit lib; };
  rosPackagesOverlay = import ./ros-packages/overlay.nix { inherit lib; };
  overrides = import ./ros-packages/overrides { inherit lib; };
in
lib.composeManyExtensions [
  configOverlay
  systemPackagesOverlay
  rosPackagesOverlay
  overrides
]
