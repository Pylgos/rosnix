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
  version = "2.13.0-1";
  src = finalAttrs.passthru.sources."moveit_simple_controller_manager";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ control-msgs moveit-common moveit-core pluginlib rclcpp rclcpp-action ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_simple_controller_manager" = substituteSource {
      src = fetchgit {
        name = "moveit_simple_controller_manager-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "ab3ff17a1ff152aca1e26e2c09e52f804cfadd98";
        hash = "sha256-DqgB5cUxdYwt3x4+5QaoG6DtuR6i9cvVz2gzU2QN1qs=";
      };
    };
  });
  meta = {
    description = "A generic, simple controller manager plugin for MoveIt.";
  };
})
