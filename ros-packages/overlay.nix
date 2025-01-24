{ lib }:
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
      extra = (
        spliced: {
          substituteSource = final.callPackage ../lib/substitute-source.nix { };
          mkSourceSet = final.callPackage ../lib/make-source-set.nix { };
          mkRecursiveBuilder = final.callPackage ../lib/make-recursive-builder.nix { };
          concatToPolyfillHook = final.callPackage ./hooks/concat-to-polyfill.nix { };
        }
      );
      f =
        self:
        (importPackagesFrom ./generated/${distro} self.callPackage)
        // {
          # Setup hooks
          wrapRosQtAppsHook = self.callPackage ./hooks/wrap-ros-qt-apps-hook.nix { };
          rosSetupHelper = self.callPackage ./hooks/ros-setup-helper.nix { };
          rosSetupHook = self.callPackage ./hooks/ros-setup-hook.nix { };

          # Builders
          buildColconPackage = self.callPackage ./builders/build-colcon-package.nix { };
          buildCmakePackage = self.callPackage ./builders/build-ament-cmake-package.nix { };
          buildAmentCmakePackage = self.callPackage ./builders/build-ament-cmake-package.nix { };
          buildAmentPythonPackage = self.callPackage ./builders/build-ament-python-package.nix { };

          # Stub builders
          buildMesonPackage = self.callPackage ./builders/build-colcon-package.nix { };
          buildCatkinPackage = self.callPackage ./builders/build-colcon-package.nix { };

          # Shell builders
          mkRosWorkspaceShell = self.callPackage ./builders/make-ros-workspace-shell.nix { };
        };
    };
in
{
  rosPackages = makeDistroScope final.rosConfig.distro;
}
