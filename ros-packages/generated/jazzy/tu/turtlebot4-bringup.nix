{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  create3-republisher,
  depthai-bridge,
  depthai-examples,
  depthai-ros-driver,
  depthai-ros-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  joy-linux,
  mkSourceSet,
  nav2-common,
  rosSystemPackages,
  rplidar-ros,
  substituteSource,
  teleop-twist-joy,
  tf2-ros,
  turtlebot4-description,
  turtlebot4-diagnostics,
  turtlebot4-node,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "turtlebot4_bringup" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_bringup-source";
        url = "https://github.com/ros2-gbp/turtlebot4_robot-release.git";
        rev = "1b5bbfe1421d0f8f30dde3e004079813a8e4510a";
        hash = "sha256-WPGmTeEKradr3IST36+hERK5z487dBYZgeaUa0epv3U=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot4_bringup";
  version = "2.0.1-2";
  src = finalAttrs.passthru.sources."turtlebot4_bringup";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ create3-republisher depthai-bridge depthai-examples depthai-ros-driver depthai-ros-msgs joy-linux nav2-common rplidar-ros teleop-twist-joy tf2-ros turtlebot4-description turtlebot4-diagnostics turtlebot4-node ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Turtlebot4 Robot Bringup";
  };
})
