{
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  control-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  joy,
  launch,
  launch-ros,
  mkSourceSet,
  moveit-msgs,
  moveit-ros-planning,
  moveit-ros-planning-interface,
  moveit-servo,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  teleop-twist-joy,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbot_joy";
  version = "0.18.6-1";
  src = finalAttrs.passthru.sources."rosbot_joy";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ builtin-interfaces control-msgs geometry-msgs joy launch launch-ros moveit-msgs moveit-ros-planning moveit-ros-planning-interface moveit-servo rclcpp sensor-msgs teleop-twist-joy ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces control-msgs geometry-msgs joy launch launch-ros moveit-msgs moveit-ros-planning moveit-ros-planning-interface moveit-servo rclcpp sensor-msgs teleop-twist-joy ];
  passthru.sources = mkSourceSet (sources: {
    "rosbot_joy" = substituteSource {
      src = fetchgit {
        name = "rosbot_joy-source";
        url = "https://github.com/ros2-gbp/rosbot_ros-release.git";
        rev = "138227dfe3dd8edd23f490b5cd870076d94ac706";
        hash = "sha256-JGVpO3cIWMHHMejLQBvRAoxx57GGr9RvA0+7Q0HA2P8=";
      };
    };
  });
  meta = {
    description = "The rosbot_joy package to handle joystick inputs for the rosbot and open manipulator";
  };
})
