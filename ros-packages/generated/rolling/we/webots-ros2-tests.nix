{
  ament-copyright,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  launch,
  launch-testing,
  launch-testing-ament-cmake,
  launch-testing-ros,
  mkSourceSet,
  rclpy,
  ros2bag,
  rosSystemPackages,
  rosbag2-storage-default-plugins,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2-ros,
  webots-ros2-driver,
  webots-ros2-epuck,
  webots-ros2-mavic,
  webots-ros2-tesla,
  webots-ros2-tiago,
  webots-ros2-turtlebot,
  webots-ros2-universal-robot,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "webots_ros2_tests" = substituteSource {
      src = fetchgit {
        name = "webots_ros2_tests-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "a7f009b55f9d2633e0116c371607314aca00f018";
        hash = "sha256-+wUzk/GLCWgQFUMICjLZSMB88GdfByKNut+61rY2A/Y=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentPythonPackage (finalAttrs: {
  pname = "webots_ros2_tests";
  version = "2023.1.3-1";
  src = finalAttrs.passthru.sources."webots_ros2_tests";
  nativeBuildInputs = [ wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclpy ros2bag rosbag2-storage-default-plugins webots-ros2-driver ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-copyright geometry-msgs launch launch-testing launch-testing-ament-cmake launch-testing-ros sensor-msgs std-msgs std-srvs tf2-ros webots-ros2-epuck webots-ros2-mavic webots-ros2-tesla webots-ros2-tiago webots-ros2-turtlebot webots-ros2-universal-robot ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "System tests for `webots_ros2` packages.";
  };
})
