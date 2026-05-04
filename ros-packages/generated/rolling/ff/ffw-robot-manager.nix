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
  version = "1.1.14-2";
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
        rev = "5ff98ff8f721b0d1311bec1717af347cf24fe6a5";
        hash = "sha256-R8IERFUpwINbE0+rb/W2Y3EfAogads/T09sBTqCsfGQ=";
      };
    };
  });
  meta = {
    description = "ROS2 controller that logs GPIO Error Code and Hardware Error Status for all GPIO devices.";
  };
})
