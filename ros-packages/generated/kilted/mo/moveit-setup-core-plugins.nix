{
  ament-cmake-ros,
  ament-index-cpp,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-ros-visualization,
  moveit-setup-framework,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  srdfdom,
  substituteSource,
  urdf,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_setup_core_plugins";
  version = "2.14.1-1";
  src = finalAttrs.passthru.sources."moveit_setup_core_plugins";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-cpp moveit-ros-visualization moveit-setup-framework pluginlib rclcpp srdfdom urdf ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ament-index-cpp moveit-ros-visualization moveit-setup-framework pluginlib rclcpp srdfdom urdf ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_setup_core_plugins" = substituteSource {
      src = fetchgit {
        name = "moveit_setup_core_plugins-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "a9807a731610f4e824a2068bfdf68c12a194af41";
        hash = "sha256-GKhjuoccqzgSyhJhOUrJZJk9ySRjwfiF41k/I9Y7N6c=";
      };
    };
  });
  meta = {
    description = "Core (meta) plugins for MoveIt Setup Assistant";
  };
})
