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
  rclcpp-action,
  rosSystemPackages,
  sensor-msgs,
  std-srvs,
  substituteSource,
  teleop-twist-joy,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbot_joy";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."rosbot_joy";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ builtin-interfaces control-msgs geometry-msgs joy launch launch-ros moveit-msgs moveit-ros-planning moveit-ros-planning-interface moveit-servo rclcpp rclcpp-action sensor-msgs std-srvs teleop-twist-joy ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces control-msgs geometry-msgs joy launch launch-ros moveit-msgs moveit-ros-planning moveit-ros-planning-interface moveit-servo rclcpp rclcpp-action sensor-msgs std-srvs teleop-twist-joy ];
  passthru.sources = mkSourceSet (sources: {
    "rosbot_joy" = substituteSource {
      src = fetchgit {
        name = "rosbot_joy-source";
        url = "https://github.com/ros2-gbp/rosbot_ros-release.git";
        rev = "ef190b125b1dd0ea9ac6f5fbd322f7892b86ed22";
        hash = "sha256-Cdzfy5d8RWOWwvCClMlzImoO+cDWjv7+qkXN+5sPQKo=";
      };
    };
  });
  meta = {
    description = "The rosbot_joy package to handle joystick inputs for the rosbot and open manipulator";
  };
})
