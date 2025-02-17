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
  version = "2.13.0-1";
  src = finalAttrs.passthru.sources."moveit_setup_framework";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ ament-index-cpp moveit-common moveit-core moveit-ros-planning moveit-ros-visualization pluginlib rclcpp rviz-common rviz-rendering srdfdom urdf ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" ]; };
  passthru.sources = mkSourceSet (sources: {
    "moveit_setup_framework" = substituteSource {
      src = fetchgit {
        name = "moveit_setup_framework-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "9bcfeee2205bf1b65690006b6453bace2ff19383";
        hash = "sha256-SOOMDXJAkxCsZ0EEH0Q2kmSpz6W8J8zADs5JQKONf0k=";
      };
    };
  });
  meta = {
    description = "C++ Interface for defining setup steps for MoveIt Setup Assistant";
  };
})
