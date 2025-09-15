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
  version = "2.14.1-1";
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
        rev = "53c208cc5008a7f20be46cd72465f4028c245cac";
        hash = "sha256-XbCp/9h2T5SOiYJevr4h/tXVi7v+muPzThrSnFdc3tY=";
      };
    };
  });
  meta = {
    description = "Various specialty plugins for MoveIt Setup Assistant";
  };
})
