{
  ament-cmake,
  ament-index-cpp,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-common,
  moveit-core,
  moveit-ros-planning,
  moveit-ros-visualization,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  rviz-common,
  rviz-rendering,
  srdfdom,
  substituteSource,
  urdf,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_setup_framework";
  version = "2.11.0-1";
  src = finalAttrs.passthru.sources."moveit_setup_framework";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ ament-index-cpp moveit-common moveit-core moveit-ros-planning moveit-ros-visualization pluginlib rclcpp rviz-common rviz-rendering srdfdom urdf ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" ]; };
  passthru.sources = mkSourceSet (sources: {
    "moveit_setup_framework" = substituteSource {
      src = fetchgit {
        name = "moveit_setup_framework-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "e47b96915ede77474b63a167a31439f269f03a77";
        hash = "sha256-2o2MUZoHJpnCgxqPk59YI/4yLkDHieHRkuO6LTSPX9I=";
      };
    };
  });
  meta = {
    description = "C++ Interface for defining setup steps for MoveIt Setup Assistant";
  };
})
