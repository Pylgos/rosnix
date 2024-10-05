{
  ament-cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  turtlebot4-base,
  turtlebot4-bringup,
  turtlebot4-diagnostics,
  turtlebot4-tests,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "turtlebot4_robot" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_robot-source";
        url = "https://github.com/ros2-gbp/turtlebot4_robot-release.git";
        rev = "3ae6419b6cef6db4ae7e4d9754d2cf2b415a8858";
        hash = "sha256-vYkbqhgpA0pU70xfJ3S1Ny2YX/ZZrP5F0OfjKhdS888=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage (finalAttrs: {
  pname = "turtlebot4_robot";
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."turtlebot4_robot";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ turtlebot4-base turtlebot4-bringup turtlebot4-diagnostics turtlebot4-tests ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Turtlebot4 Robot Metapackage";
  };
})
