{ lib, config }:
final: prev:

let
  makeDistroScope =
    distro:
    final.makeScopeWithSplicing' {
      otherSplices = final.generateSplicesForMkScope "rosPackages";
      extra = (spliced: { substituteSource = final.callPackage ./lib/substitute-source.nix { }; });
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
