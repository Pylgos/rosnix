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
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "webots_ros2_tiago";
  version = "2025.0.1-2";
  src = finalAttrs.passthru.sources."webots_ros2_tiago";
  propagatedNativeBuildInputs = [ builtin-interfaces controller-manager diff-drive-controller geometry-msgs joint-state-broadcaster rclpy robot-state-publisher rviz2 tf2-ros webots-ros2-control webots-ros2-driver ];
  propagatedBuildInputs = [ builtin-interfaces controller-manager diff-drive-controller geometry-msgs joint-state-broadcaster rclpy robot-state-publisher rviz2 tf2-ros webots-ros2-control webots-ros2-driver ];
  checkInputs = [ ament-copyright ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "webots_ros2_tiago" = substituteSource {
      src = fetchgit {
        name = "webots_ros2_tiago-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "f5f019661fff4810072d08d1f7f13b7ed2f86aa9";
        hash = "sha256-G2iIFRyNDZSUHE0U46ll+qrL4nwAKRjfiTmjOKWAlqg=";
      };
    };
  });
  meta = {
    description = "TIAGo robots ROS2 interface for Webots.";
  };
})
