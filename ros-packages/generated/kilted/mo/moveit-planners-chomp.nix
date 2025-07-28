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
  version = "2.13.2-2";
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
        rev = "4641f27bc0d4893b9c1b44f45b20898745f94b07";
        hash = "sha256-NkhJQ7kchZuOhJJLODHP7u1urxKAvDzP+PCpayrIS6M=";
      };
    };
  });
  meta = {
    description = "The interface for using CHOMP within MoveIt";
  };
})
