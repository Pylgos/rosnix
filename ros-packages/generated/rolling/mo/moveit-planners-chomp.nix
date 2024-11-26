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
  version = "2.11.0-1";
  src = finalAttrs.passthru.sources."moveit_planners_chomp";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ chomp-motion-planner moveit-common moveit-core pluginlib rclcpp ];
  passthru = {
    sources = mkSourceSet (sources: {
      "moveit_planners_chomp" = substituteSource {
        src = fetchgit {
          name = "moveit_planners_chomp-source";
          url = "https://github.com/ros2-gbp/moveit2-release.git";
          rev = "d499cf80912afe985d5e76c20cfb7318c163d0d8";
          hash = "sha256-odJd3LUSg00fK5t+Fkk91dY+x9QFsjWqvPZ/t5E8uao=";
        };
      };
    });
  };
  meta = {
    description = "The interface for using CHOMP within MoveIt";
  };
})
