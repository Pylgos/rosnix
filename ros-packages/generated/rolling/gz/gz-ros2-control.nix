{
  ament-cmake,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-plugin-vendor,
  gz-sim-vendor,
  hardware-interface,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  ros2-control-cmake,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gz_ros2_control";
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."gz_ros2_control";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-cpp controller-manager gz-plugin-vendor gz-sim-vendor hardware-interface pluginlib rclcpp rclcpp-lifecycle ros2-control-cmake yaml-cpp-vendor ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp controller-manager gz-plugin-vendor gz-sim-vendor hardware-interface pluginlib rclcpp rclcpp-lifecycle ros2-control-cmake yaml-cpp-vendor ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "gz_ros2_control" = substituteSource {
      src = fetchgit {
        name = "gz_ros2_control-source";
        url = "https://github.com/ros2-gbp/ign_ros2_control-release.git";
        rev = "1fafc4791f8a6133d40e6ffa2542d52050d3c18c";
        hash = "sha256-SiNk9B1lodk5bXABV0osqPLTbJXyPCp+xzDy6XBH7kI=";
      };
    };
  });
  meta = {
    description = "Gazebo ros2_control package allows to control simulated robots using ros2_control framework.";
  };
})
