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
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "webots_ros2_turtlebot";
  version = "2025.0.0-1";
  src = finalAttrs.passthru.sources."webots_ros2_turtlebot";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ builtin-interfaces controller-manager diff-drive-controller joint-state-broadcaster rclpy robot-state-publisher rviz2 tf2-ros webots-ros2-control webots-ros2-driver ];
  propagatedBuildInputs = [ builtin-interfaces controller-manager diff-drive-controller joint-state-broadcaster rclpy robot-state-publisher rviz2 tf2-ros webots-ros2-control webots-ros2-driver ];
  checkInputs = [ ament-copyright ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "webots_ros2_turtlebot" = substituteSource {
      src = fetchgit {
        name = "webots_ros2_turtlebot-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "0cc9dc606b49ee7053dfb1ee285ccd297770ae12";
        hash = "sha256-+oucEIpIUb1sFbiaAKWfSkgctwZS8ZE2NF+opqgGf1I=";
      };
    };
  });
  meta = {
    description = "TurtleBot3 Burger robot ROS2 interface for Webots.";
  };
})
