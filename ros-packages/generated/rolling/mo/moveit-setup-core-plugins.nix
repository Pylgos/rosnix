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
  version = "2.11.0-1";
  src = finalAttrs.passthru.sources."moveit_setup_core_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ ament-index-cpp moveit-ros-visualization moveit-setup-framework pluginlib rclcpp srdfdom urdf ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_setup_core_plugins" = substituteSource {
      src = fetchgit {
        name = "moveit_setup_core_plugins-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "bd0141abc920977794b572dd4c8609aa52ccdd57";
        hash = "sha256-HTRXcGwdonmuWNi0SlLARwvAlqfhyzatQih6XFKXlPs=";
      };
    };
  });
  meta = {
    description = "Core (meta) plugins for MoveIt Setup Assistant";
  };
})
