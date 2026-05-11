{
  ament-cmake,
  ament-cmake-python,
  backward-ros,
  buildAmentCmakePackage,
  control-msgs,
  controller-manager,
  controller-manager-msgs,
  effort-controllers,
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
  motion-primitives-controllers,
  pluginlib,
  pose-broadcaster,
  position-controllers,
  rclcpp,
  rclcpp-lifecycle,
  rclpy,
  robot-state-publisher,
  ros2-controllers-test-nodes,
  ros2run,
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
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ur_robot_driver";
  version = "5.0.0-2";
  src = finalAttrs.passthru.sources."ur_robot_driver";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ backward-ros control-msgs controller-manager controller-manager-msgs effort-controllers force-torque-sensor-broadcaster geometry-msgs hardware-interface joint-state-broadcaster joint-state-publisher joint-trajectory-controller launch launch-ros motion-primitives-controllers pluginlib pose-broadcaster position-controllers rclcpp rclcpp-lifecycle rclpy robot-state-publisher ros2-controllers-test-nodes rviz2 std-msgs std-srvs tf2-geometry-msgs ur-client-library ur-controllers ur-dashboard-msgs ur-description ur-msgs urdf velocity-controllers xacro ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "socat" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ backward-ros control-msgs controller-manager controller-manager-msgs effort-controllers force-torque-sensor-broadcaster geometry-msgs hardware-interface joint-state-broadcaster joint-state-publisher joint-trajectory-controller launch launch-ros motion-primitives-controllers pluginlib pose-broadcaster position-controllers rclcpp rclcpp-lifecycle rclpy robot-state-publisher ros2-controllers-test-nodes rviz2 std-msgs std-srvs tf2-geometry-msgs ur-client-library ur-controllers ur-dashboard-msgs ur-description ur-msgs urdf velocity-controllers xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "socat" ]; };
  checkInputs = [ launch-testing-ament-cmake ros2run ];
  passthru.sources = mkSourceSet (sources: {
    "ur_robot_driver" = substituteSource {
      src = fetchgit {
        name = "ur_robot_driver-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_ROS2_Driver-release.git";
        rev = "9a2b119879711f291969ec4dafaa8b3d2950835f";
        hash = "sha256-txEeQhLzWIL2SP2jk8nN6GinUgg12QGare5IoYcqECE=";
      };
    };
  });
  meta = {
    description = "\n      The ROS 2 driver for Universal Robots manipulators. This driver supports all robot\n      models as listed in the documentation. For robot controllers, PolyScope X, PolyScope 5 and\n      CB3 controllers are supported.\n    ";
  };
})
