{
  ament-copyright,
  buildAmentPythonPackage,
  builtin-interfaces,
  control-msgs,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-broadcaster,
  joint-trajectory-controller,
  mkSourceSet,
  rclpy,
  robot-state-publisher,
  rosSystemPackages,
  rviz2,
  substituteSource,
  trajectory-msgs,
  webots-ros2-control,
  webots-ros2-driver,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "webots_ros2_universal_robot";
  version = "2025.0.1-1";
  src = finalAttrs.passthru.sources."webots_ros2_universal_robot";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ builtin-interfaces control-msgs controller-manager joint-state-broadcaster joint-trajectory-controller rclpy robot-state-publisher rviz2 trajectory-msgs webots-ros2-control webots-ros2-driver xacro ];
  propagatedBuildInputs = [ builtin-interfaces control-msgs controller-manager joint-state-broadcaster joint-trajectory-controller rclpy robot-state-publisher rviz2 trajectory-msgs webots-ros2-control webots-ros2-driver xacro ];
  checkInputs = [ ament-copyright ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "webots_ros2_universal_robot" = substituteSource {
      src = fetchgit {
        name = "webots_ros2_universal_robot-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "7aab380d3332c5317d33cdaf0575ee4b53fb8607";
        hash = "sha256-7lpobeSfqB+BqFTsrvRMUscf+C1Iw/4Z2D1mSXfa4tg=";
      };
    };
  });
  meta = {
    description = "Universal Robot ROS2 interface for Webots.";
  };
})
