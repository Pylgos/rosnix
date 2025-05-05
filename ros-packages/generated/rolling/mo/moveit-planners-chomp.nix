{
  ament-cmake,
  buildAmentCmakePackage,
  chomp-motion-planner,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-common,
  moveit-core,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_planners_chomp";
  version = "2.13.2-1";
  src = finalAttrs.passthru.sources."moveit_planners_chomp";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ chomp-motion-planner moveit-common moveit-core pluginlib rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ chomp-motion-planner moveit-common moveit-core pluginlib rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_planners_chomp" = substituteSource {
      src = fetchgit {
        name = "moveit_planners_chomp-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "8af58032fee13a50b2c6884496c59b6c96a3b5a4";
        hash = "sha256-NkhJQ7kchZuOhJJLODHP7u1urxKAvDzP+PCpayrIS6M=";
      };
    };
  });
  meta = {
    description = "The interface for using CHOMP within MoveIt";
  };
})
