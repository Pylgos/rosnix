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
  version = "2.12.1-1";
  src = finalAttrs.passthru.sources."moveit_simple_controller_manager";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ control-msgs moveit-common moveit-core pluginlib rclcpp rclcpp-action ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_simple_controller_manager" = substituteSource {
      src = fetchgit {
        name = "moveit_simple_controller_manager-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "0f87727c40e0b4018b9cbc503642484ebd91337c";
        hash = "sha256-J1XjHbjF7XTu7zJWn8V7XpFqdLCtvmxMp2kqhMYTY5Y=";
      };
    };
  });
  meta = {
    description = "A generic, simple controller manager plugin for MoveIt.";
  };
})
