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
  version = "2.13.2-2";
  src = finalAttrs.passthru.sources."moveit_setup_app_plugins";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-cpp moveit-configs-utils moveit-ros-visualization moveit-setup-framework pluginlib rclcpp ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ament-index-cpp moveit-configs-utils moveit-ros-visualization moveit-setup-framework pluginlib rclcpp ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_setup_app_plugins" = substituteSource {
      src = fetchgit {
        name = "moveit_setup_app_plugins-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "51153a14e271facbc3f37d1b5a2fbda3125c0b53";
        hash = "sha256-C3AIqEZsODJjvVARBpqeGQCDzL4gcvEXoekICmGSUPQ=";
      };
    };
  });
  meta = {
    description = "Various specialty plugins for MoveIt Setup Assistant";
  };
})
