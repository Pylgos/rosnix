{
  ament-cmake,
  buildAmentCmakePackage,
  control-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-common,
  moveit-core,
  pluginlib,
  rclcpp,
  rclcpp-action,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_simple_controller_manager";
  version = "2.12.2-1";
  src = finalAttrs.passthru.sources."moveit_simple_controller_manager";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ control-msgs moveit-common moveit-core pluginlib rclcpp rclcpp-action ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_simple_controller_manager" = substituteSource {
      src = fetchgit {
        name = "moveit_simple_controller_manager-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "c699191b3c21315037ec976d510ff79388d7586e";
        hash = "sha256-Khb0S55OD0rvNFVrNEJJLBaXh7Oxjix+NC0hYNBslFc=";
      };
    };
  });
  meta = {
    description = "A generic, simple controller manager plugin for MoveIt.";
  };
})
