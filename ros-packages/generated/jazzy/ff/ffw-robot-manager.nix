{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  controller-interface,
  dynamixel-hardware-interface,
  dynamixel-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  hardware-interface,
  mkSourceSet,
  pluginlib,
  rclcpp,
  ros2-control-cmake,
  rosSystemPackages,
  sensor-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ffw_robot_manager";
  version = "1.1.16-1";
  src = finalAttrs.passthru.sources."ffw_robot_manager";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ controller-interface dynamixel-hardware-interface dynamixel-interfaces generate-parameter-library hardware-interface pluginlib rclcpp ros2-control-cmake sensor-msgs std-srvs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-interface dynamixel-hardware-interface dynamixel-interfaces generate-parameter-library hardware-interface pluginlib rclcpp ros2-control-cmake sensor-msgs std-srvs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ffw_robot_manager" = substituteSource {
      src = fetchgit {
        name = "ffw_robot_manager-source";
        url = "https://github.com/ros2-gbp/ai_worker-release.git";
        rev = "ec54fab59f23972c67b000102bdcd421fd88cbd7";
        hash = "sha256-C+o3gWAmJ12S8s0FQmrHgdiGJcLgzlCeCTb+GG/KQkM=";
      };
    };
  });
  meta = {
    description = "ROS2 controller that logs GPIO Error Code and Hardware Error Status for all GPIO devices.";
  };
})
