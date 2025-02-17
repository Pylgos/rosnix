{
  ament-cmake,
  ament-cmake-gtest,
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
  version = "2.13.0-1";
  src = finalAttrs.passthru.sources."moveit_setup_controllers";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ ament-index-cpp moveit-setup-framework pluginlib rclcpp ];
  checkInputs = [ ament-cmake-gtest moveit-configs-utils moveit-resources-fanuc-moveit-config moveit-resources-panda-moveit-config ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_setup_controllers" = substituteSource {
      src = fetchgit {
        name = "moveit_setup_controllers-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "642257591f4376dce44868ab24635d73ce186e4c";
        hash = "sha256-BJw1R7qaNXLwyzAQHXlv6eDMvvoWV2efqINPtfpKPDQ=";
      };
    };
  });
  meta = {
    description = "MoveIt Setup Steps for ROS 2 Control";
  };
})
