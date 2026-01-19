{
  ament-copyright,
  buildAmentPythonPackage,
  builtin-interfaces,
  controller-manager,
  diff-drive-controller,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-broadcaster,
  mkSourceSet,
  rclpy,
  robot-state-publisher,
  rosSystemPackages,
  rviz2,
  substituteSource,
  tf2-ros,
  webots-ros2-control,
  webots-ros2-driver,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "webots_ros2_turtlebot";
  version = "2025.0.1-1";
  src = finalAttrs.passthru.sources."webots_ros2_turtlebot";
  propagatedNativeBuildInputs = [ builtin-interfaces controller-manager diff-drive-controller joint-state-broadcaster rclpy robot-state-publisher rviz2 tf2-ros webots-ros2-control webots-ros2-driver ];
  propagatedBuildInputs = [ builtin-interfaces controller-manager diff-drive-controller joint-state-broadcaster rclpy robot-state-publisher rviz2 tf2-ros webots-ros2-control webots-ros2-driver ];
  checkInputs = [ ament-copyright ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "webots_ros2_turtlebot" = substituteSource {
      src = fetchgit {
        name = "webots_ros2_turtlebot-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "737b1a3ed9d5279d59f1ad7b61b32e94eb8f16d9";
        hash = "sha256-QPWGTFMNhzhXTqhjPu5Bxh34EW7q7hfprMuES5//uZw=";
      };
    };
  });
  meta = {
    description = "TurtleBot3 Burger robot ROS2 interface for Webots.";
  };
})
