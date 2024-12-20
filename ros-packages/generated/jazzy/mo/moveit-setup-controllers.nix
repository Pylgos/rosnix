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
  version = "2.12.1-1";
  src = finalAttrs.passthru.sources."moveit_setup_controllers";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ ament-index-cpp moveit-setup-framework pluginlib rclcpp ];
  checkInputs = [ ament-cmake-gtest moveit-configs-utils moveit-resources-fanuc-moveit-config moveit-resources-panda-moveit-config ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_setup_controllers" = substituteSource {
      src = fetchgit {
        name = "moveit_setup_controllers-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "8bdd3f6e38a855f6337c4e01cfd3f3297333281a";
        hash = "sha256-j2EWjsRVOIvobR7KzncrfWHPlAk4wwdxOyWY2HniHGQ=";
      };
    };
  });
  meta = {
    description = "MoveIt Setup Steps for ROS 2 Control";
  };
})
