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
  version = "2.12.1-1";
  src = finalAttrs.passthru.sources."moveit_setup_framework";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ ament-index-cpp moveit-common moveit-core moveit-ros-planning moveit-ros-visualization pluginlib rclcpp rviz-common rviz-rendering srdfdom urdf ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" ]; };
  passthru.sources = mkSourceSet (sources: {
    "moveit_setup_framework" = substituteSource {
      src = fetchgit {
        name = "moveit_setup_framework-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "416ced003896b855aa4b63628101cdd2ab0b0ebb";
        hash = "sha256-RAXuyEIGWClwsjL2plwzMvsqecpBEiGrMluEUd4cPFk=";
      };
    };
  });
  meta = {
    description = "C++ Interface for defining setup steps for MoveIt Setup Assistant";
  };
})
