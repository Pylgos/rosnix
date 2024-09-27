{ lib, config }:
final: prev:

let
  inherit (lib)
    attrsToList
    concatMap
    filter
    listToAttrs
    pipe
    readDir
    removeSuffix
    ;

  importPackagesFrom =
    dir: callPackage:
    let
      getPkgs =
        dir:
        pipe (readDir dir) [
          attrsToList
          (filter ({ name, value }: value == "regular"))
          (map (
            { name, value }:
            {
              name = removeSuffix ".nix" name;
              value = callPackage "${dir}/${name}" { };
            }
          ))
        ];
      pkgs = pipe (readDir dir) [
        attrsToList
        (filter ({ name, value }: value == "directory"))
        (concatMap ({ name, value }: getPkgs "${dir}/${name}"))
        listToAttrs
      ];
    in
    pkgs;

  makeDistroScope =
    distro:
    final.makeScopeWithSplicing' {
      otherSplices = final.generateSplicesForMkScope "rosPackages";
      extra = (spliced: { substituteSource = final.callPackage ../lib/substitute-source.nix { }; });
      f =
        self:
        {
          wrapRosQtAppsHook = self.callPackage ./hooks/wrap-ros-qt-apps-hook.nix { };
          rosSetupHook = self.callPackage ./hooks/ros-setup-hook.nix { };
          buildRosPackage = self.callPackage ./build-ros-package.nix { };
        }
        // (importPackagesFrom ./generated/${distro} self.callPackage);
    };
in
{
  rosPackages = makeDistroScope config.distro;
}
