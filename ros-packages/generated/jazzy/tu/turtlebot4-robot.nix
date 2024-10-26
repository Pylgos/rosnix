{
  ament-cmake,
  buildAmentCmakePackage,
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
        rev = "94ab12bc4ef6fabb9f79a38720d1dcedca945e5a";
        hash = "sha256-KEgcKewuGvzYKudi1W/Myo+vU8h+w4X78HtO4s+ss68=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot4_robot";
  version = "2.0.1-2";
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
