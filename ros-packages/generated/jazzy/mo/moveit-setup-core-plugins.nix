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
  version = "2.10.0-1";
  src = finalAttrs.passthru.sources."moveit_setup_core_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ ament-index-cpp moveit-ros-visualization moveit-setup-framework pluginlib rclcpp srdfdom urdf ];
  passthru = {
    sources = mkSourceSet (sources: {
      "moveit_setup_core_plugins" = substituteSource {
        src = fetchgit {
          name = "moveit_setup_core_plugins-source";
          url = "https://github.com/ros2-gbp/moveit2-release.git";
          rev = "46f3e46b144520f8f6ffa72521ed718e7eaff8b9";
          hash = "sha256-zu0imYmCxzAZeYZhj925AlKQbSyYk3L+0kr0pIJkiyw=";
        };
      };
    });
  };
  meta = {
    description = "Core (meta) plugins for MoveIt Setup Assistant";
  };
})
