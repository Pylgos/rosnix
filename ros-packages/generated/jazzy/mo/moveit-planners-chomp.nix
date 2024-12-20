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
  version = "2.12.1-1";
  src = finalAttrs.passthru.sources."moveit_planners_chomp";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ chomp-motion-planner moveit-common moveit-core pluginlib rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_planners_chomp" = substituteSource {
      src = fetchgit {
        name = "moveit_planners_chomp-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "19202c3b191ee8909ac62873798c6358392f04d3";
        hash = "sha256-7gvpeNOo3ajlJ2GjmBxeFeZVipy9CjP4ptGAQZWYM2w=";
      };
    };
  });
  meta = {
    description = "The interface for using CHOMP within MoveIt";
  };
})
