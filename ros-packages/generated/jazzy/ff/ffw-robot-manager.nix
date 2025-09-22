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
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ffw_robot_manager";
  version = "1.1.12-1";
  src = finalAttrs.passthru.sources."ffw_robot_manager";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ controller-interface dynamixel-hardware-interface dynamixel-interfaces generate-parameter-library hardware-interface pluginlib rclcpp ros2-control-cmake std-srvs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-interface dynamixel-hardware-interface dynamixel-interfaces generate-parameter-library hardware-interface pluginlib rclcpp ros2-control-cmake std-srvs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ffw_robot_manager" = substituteSource {
      src = fetchgit {
        name = "ffw_robot_manager-source";
        url = "https://github.com/ros2-gbp/ai_worker-release.git";
        rev = "31241ccfa9177bb6e0e00ffd6bb0d74492e65bc2";
        hash = "sha256-htFD/5Ydas0mp5Jfp1VZBAyiMrX0fvs59Ibo7MCXff0=";
      };
    };
  });
  meta = {
    description = "ROS2 controller that logs GPIO Error Code and Hardware Error Status for all GPIO devices.";
  };
})
