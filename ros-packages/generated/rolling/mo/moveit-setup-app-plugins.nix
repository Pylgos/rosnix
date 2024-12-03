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
  moveit-ros-visualization,
  moveit-setup-framework,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_setup_app_plugins";
  version = "2.12.0-1";
  src = finalAttrs.passthru.sources."moveit_setup_app_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ ament-index-cpp moveit-configs-utils moveit-ros-visualization moveit-setup-framework pluginlib rclcpp ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_setup_app_plugins" = substituteSource {
      src = fetchgit {
        name = "moveit_setup_app_plugins-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "358ebd6d964e61b33925e2790191ffad49dbc740";
        hash = "sha256-V+Em7gCnSWYGjYtoRBIgFcn9tWVL6XjgeY4tsZOm6Mo=";
      };
    };
  });
  meta = {
    description = "Various specialty plugins for MoveIt Setup Assistant";
  };
})
