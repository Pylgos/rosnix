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
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gz_ros2_control";
  version = "2.0.5-1";
  src = finalAttrs.passthru.sources."gz_ros2_control";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ ament-index-cpp controller-manager gz-plugin-vendor gz-sim-vendor hardware-interface pluginlib rclcpp rclcpp-lifecycle yaml-cpp-vendor ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "gz_ros2_control" = substituteSource {
      src = fetchgit {
        name = "gz_ros2_control-source";
        url = "https://github.com/ros2-gbp/ign_ros2_control-release.git";
        rev = "2fa05d06de29f2d251ecffce882dea05bf8e7f32";
        hash = "sha256-hnxjtKhQ0leuL/Iue58mEBs5yz/xeEOuiVOqowD5Yco=";
      };
    };
  });
  meta = {
    description = "Gazebo ros2_control package allows to control simulated robots using ros2_control framework.";
  };
})
