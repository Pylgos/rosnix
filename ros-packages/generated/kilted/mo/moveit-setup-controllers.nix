{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-index-cpp,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-configs-utils,
  moveit-resources-fanuc-moveit-config,
  moveit-resources-panda-moveit-config,
  moveit-setup-framework,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_setup_controllers";
  version = "2.14.1-1";
  src = finalAttrs.passthru.sources."moveit_setup_controllers";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-cpp moveit-setup-framework pluginlib rclcpp ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ament-index-cpp moveit-setup-framework pluginlib rclcpp ];
  checkInputs = [ ament-cmake-gtest moveit-configs-utils moveit-resources-fanuc-moveit-config moveit-resources-panda-moveit-config ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_setup_controllers" = substituteSource {
      src = fetchgit {
        name = "moveit_setup_controllers-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "6f1b0a82c6e03d37f1d1a277948e353c54ce2b44";
        hash = "sha256-0cXY27k5YNgJIsE0SoHiPlcIgpggRQTOm8sTeqoqfeg=";
      };
    };
  });
  meta = {
    description = "MoveIt Setup Steps for ROS 2 Control";
  };
})
