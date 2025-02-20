{
  ament-copyright,
  buildAmentPythonPackage,
  builtin-interfaces,
  controller-manager,
  diff-drive-controller,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
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
  pname = "webots_ros2_tiago";
  version = "2025.0.0-1";
  src = finalAttrs.passthru.sources."webots_ros2_tiago";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedBuildInputs = [ builtin-interfaces controller-manager diff-drive-controller geometry-msgs joint-state-broadcaster rclpy robot-state-publisher rviz2 tf2-ros webots-ros2-control webots-ros2-driver ];
  checkInputs = [ ament-copyright ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "webots_ros2_tiago" = substituteSource {
      src = fetchgit {
        name = "webots_ros2_tiago-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "7e5f8f4d773cf20aeef2f6341de2528115f874cf";
        hash = "sha256-8JunOZqOehDZ1efaaL+uP5DRrdSauP7Dqw1tq6Grdn0=";
      };
    };
  });
  meta = {
    description = "TIAGo robots ROS2 interface for Webots.";
  };
})
