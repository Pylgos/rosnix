{
  ament-cmake,
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
  version = "2.12.1-1";
  src = finalAttrs.passthru.sources."moveit_setup_core_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ ament-index-cpp moveit-ros-visualization moveit-setup-framework pluginlib rclcpp srdfdom urdf ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_setup_core_plugins" = substituteSource {
      src = fetchgit {
        name = "moveit_setup_core_plugins-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "d3258f65ee07f85bf63770759d747488652e85f8";
        hash = "sha256-FuFmkcqj7ZY5/aNFR5g+t/SZjyUFZvWX+OsxvFXp1nE=";
      };
    };
  });
  meta = {
    description = "Core (meta) plugins for MoveIt Setup Assistant";
  };
})
