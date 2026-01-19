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
  webots-ros2-husarion,
  webots-ros2-mavic,
  webots-ros2-tesla,
  webots-ros2-tiago,
  webots-ros2-turtlebot,
  webots-ros2-universal-robot,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "webots_ros2_tests";
  version = "2025.0.1-1";
  src = finalAttrs.passthru.sources."webots_ros2_tests";
  propagatedNativeBuildInputs = [ rclpy ros2bag rosbag2-storage-default-plugins webots-ros2-driver ];
  propagatedBuildInputs = [ rclpy ros2bag rosbag2-storage-default-plugins webots-ros2-driver ];
  checkInputs = [ ament-copyright geometry-msgs launch launch-testing launch-testing-ament-cmake launch-testing-ros sensor-msgs std-msgs std-srvs tf2-ros webots-ros2-epuck webots-ros2-husarion webots-ros2-mavic webots-ros2-tesla webots-ros2-tiago webots-ros2-turtlebot webots-ros2-universal-robot ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "webots_ros2_tests" = substituteSource {
      src = fetchgit {
        name = "webots_ros2_tests-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "ffa9c4180ce57724ced9713a5ae3859ca2eb4e3e";
        hash = "sha256-nfx7yqQ0tTICH1yZ3in2zLGgeUbPInVhJhUuzmjE7/E=";
      };
    };
  });
  meta = {
    description = "System tests for `webots_ros2` packages.";
  };
})
