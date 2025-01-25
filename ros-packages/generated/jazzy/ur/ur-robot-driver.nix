{
  ament-cmake,
  ament-cmake-python,
  backward-ros,
  buildAmentCmakePackage,
  controller-manager,
  controller-manager-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  force-torque-sensor-broadcaster,
  geometry-msgs,
  hardware-interface,
  joint-state-broadcaster,
  joint-state-publisher,
  joint-trajectory-controller,
  launch,
  launch-ros,
  launch-testing-ament-cmake,
  mkSourceSet,
  pluginlib,
  pose-broadcaster,
  position-controllers,
  rclcpp,
  rclcpp-lifecycle,
  rclpy,
  robot-state-publisher,
  ros2-controllers-test-nodes,
  rosSystemPackages,
  rviz2,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2-geometry-msgs,
  ur-client-library,
  ur-controllers,
  ur-dashboard-msgs,
  ur-description,
  ur-msgs,
  urdf,
  velocity-controllers,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ur_robot_driver";
  version = "3.0.2-1";
  src = finalAttrs.passthru.sources."ur_robot_driver";
  nativeBuildInputs = [ ament-cmake ament-cmake-python wrapRosQtAppsHook ];
  propagatedBuildInputs = [ backward-ros controller-manager controller-manager-msgs force-torque-sensor-broadcaster geometry-msgs hardware-interface joint-state-broadcaster joint-state-publisher joint-trajectory-controller launch launch-ros pluginlib pose-broadcaster position-controllers rclcpp rclcpp-lifecycle rclpy robot-state-publisher ros2-controllers-test-nodes rviz2 std-msgs std-srvs tf2-geometry-msgs ur-client-library ur-controllers ur-dashboard-msgs ur-description ur-msgs urdf velocity-controllers xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "socat" ]; };
  checkInputs = [ launch-testing-ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ur_robot_driver" = substituteSource {
      src = fetchgit {
        name = "ur_robot_driver-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_ROS2_Driver-release.git";
        rev = "76ad17cabee6c4c57924c45e00681e825658fb6a";
        hash = "sha256-xNaDO6/ig0sfK9kGVXCoF2n84F7EjfzU6jKHwep1hhQ=";
      };
    };
  });
  meta = {
    description = "The new driver for Universal Robots UR3, UR5 and UR10 robots with CB3 controllers and the e-series.";
  };
})
