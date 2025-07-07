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
  version = "2.14.0-1";
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
        rev = "418850dda9b7e3eba44fbde946f06660929f7525";
        hash = "sha256-TTaXvgbWjtq44er//UpToGQiNrdtTNvxDwgs0AHIJfM=";
      };
    };
  });
  meta = {
    description = "The interface for using CHOMP within MoveIt";
  };
})
