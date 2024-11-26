{
  ackermann-steering-controller,
  ament-cmake,
  ament-cmake-gtest,
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
  mkSourceSet,
  rclcpp,
  rclcpp-action,
  robot-state-publisher,
  ros-gz-bridge,
  ros-gz-sim,
  ros2controlcli,
  ros2launch,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  tricycle-controller,
  velocity-controllers,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gz_ros2_control_demos";
  version = "2.0.2-1";
  src = finalAttrs.passthru.sources."gz_ros2_control_demos";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ ackermann-steering-controller ament-index-python control-msgs diff-drive-controller effort-controllers geometry-msgs gz-ros2-control hardware-interface imu-sensor-broadcaster joint-state-broadcaster joint-trajectory-controller launch launch-ros rclcpp rclcpp-action robot-state-publisher ros2controlcli ros2launch ros-gz-bridge ros-gz-sim std-msgs tricycle-controller velocity-controllers xacro ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "gz_ros2_control_demos" = substituteSource {
      src = fetchgit {
        name = "gz_ros2_control_demos-source";
        url = "https://github.com/ros2-gbp/ign_ros2_control-release.git";
        rev = "b921394778ba3b0e55e99b98dca02a6d83753cf0";
        hash = "sha256-4825AqAZwzJql5rJuOGTkqnhVyyK+R7MVTIccjIUHJ0=";
      };
    };
  });
  meta = {
    description = "gz_ros2_control_demos";
  };
})
