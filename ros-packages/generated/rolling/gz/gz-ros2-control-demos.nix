{
  ackermann-steering-controller,
  ament-cmake,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  control-msgs,
  diff-drive-controller,
  effort-controllers,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  gz-ros2-control,
  hardware-interface,
  imu-sensor-broadcaster,
  joint-state-broadcaster,
  joint-trajectory-controller,
  launch,
  launch-ros,
  mecanum-drive-controller,
  mkSourceSet,
  rclcpp,
  rclcpp-action,
  robot-state-publisher,
  ros-gz-bridge,
  ros-gz-sim,
  ros2-control-cmake,
  ros2controlcli,
  ros2launch,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  tricycle-steering-controller,
  velocity-controllers,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gz_ros2_control_demos";
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."gz_ros2_control_demos";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ackermann-steering-controller ament-index-python control-msgs diff-drive-controller effort-controllers geometry-msgs gz-ros2-control hardware-interface imu-sensor-broadcaster joint-state-broadcaster joint-trajectory-controller launch launch-ros mecanum-drive-controller rclcpp rclcpp-action robot-state-publisher ros2-control-cmake ros2controlcli ros2launch ros-gz-bridge ros-gz-sim std-msgs tricycle-steering-controller velocity-controllers xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ackermann-steering-controller ament-index-python control-msgs diff-drive-controller effort-controllers geometry-msgs gz-ros2-control hardware-interface imu-sensor-broadcaster joint-state-broadcaster joint-trajectory-controller launch launch-ros mecanum-drive-controller rclcpp rclcpp-action robot-state-publisher ros2-control-cmake ros2controlcli ros2launch ros-gz-bridge ros-gz-sim std-msgs tricycle-steering-controller velocity-controllers xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "gz_ros2_control_demos" = substituteSource {
      src = fetchgit {
        name = "gz_ros2_control_demos-source";
        url = "https://github.com/ros2-gbp/ign_ros2_control-release.git";
        rev = "afac188d056363f897eeab1dc94b6479a6f38914";
        hash = "sha256-43O3JVVA+d90ewSwv2gVNjRVdQ4jMXJEioyi+yWYxpA=";
      };
    };
  });
  meta = {
    description = "gz_ros2_control_demos";
  };
})
