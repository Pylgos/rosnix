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
  version = "2.12.0-1";
  src = finalAttrs.passthru.sources."moveit_simple_controller_manager";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ control-msgs moveit-common moveit-core pluginlib rclcpp rclcpp-action ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_simple_controller_manager" = substituteSource {
      src = fetchgit {
        name = "moveit_simple_controller_manager-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "30c27394e0aa837b1ad341d9186a1d2fe5dd7b94";
        hash = "sha256-Jjf1UiqclShNZxtiXercf9rfzovfR/O+izvVB1lYuBE=";
      };
    };
  });
  meta = {
    description = "A generic, simple controller manager plugin for MoveIt.";
  };
})
