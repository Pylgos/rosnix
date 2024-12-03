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
  version = "2.12.0-1";
  src = finalAttrs.passthru.sources."moveit_planners_chomp";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ chomp-motion-planner moveit-common moveit-core pluginlib rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_planners_chomp" = substituteSource {
      src = fetchgit {
        name = "moveit_planners_chomp-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "c7ac1dd87502ac0624a2eff6e28fb4aae468cd35";
        hash = "sha256-UycycUZ5ZRYrU8rZurkyeuiCV+THhQQ9wPYqt+1BHJc=";
      };
    };
  });
  meta = {
    description = "The interface for using CHOMP within MoveIt";
  };
})
