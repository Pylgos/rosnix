{
  ament-cmake,
  buildRosPackage,
  desktop,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  perception,
  ros-gz-sim-demos,
  rosSystemPackages,
  simulation,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "desktop_full" = substituteSource {
      src = fetchgit {
        name = "desktop_full-source";
        url = "https://github.com/ros2-gbp/variants-release.git";
        rev = "3bdd312d71e66a970a9491a2beb2e6ee4a82e417";
        hash = "sha256-Ym/P4L92jCLQbe2hhq+3I5CLtJE59ya1csIFnutZlBE=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "desktop-full";
  version = "0.11.0-1";
  src = sources."desktop_full";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ desktop perception ros-gz-sim-demos simulation ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Provides a 'batteries included' experience to novice users.";
  };
}
