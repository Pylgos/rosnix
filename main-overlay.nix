{ lib, config }:
final: prev:

let
  private-funcs = import ./private-funcs.nix {
    inherit lib;
    pkgs = final;
  };
  makeDistroScope =
    distro:
    final.makeScopeWithSplicing' {
      otherSplices = final.generateSplicesForMkScope "rosPackages";
      extra = (spliced: private-funcs);
      f =
        self:
        {
          wrapRosQtAppsHook = self.callPackage ./hooks/wrap-ros-qt-apps-hook.nix { };
          rosSetupHook = self.callPackage ./hooks/setup-hook.nix { };
          buildRosPackage = self.callPackage ./build-ros-package.nix { };
        }
        // (import ./generated/${distro} self);
    };
in
{
  rosPackages = makeDistroScope config.distro;
}
