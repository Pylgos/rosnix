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
  version = "2.13.2-2";
  src = finalAttrs.passthru.sources."moveit_simple_controller_manager";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ control-msgs moveit-common moveit-core pluginlib rclcpp rclcpp-action ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ control-msgs moveit-common moveit-core pluginlib rclcpp rclcpp-action ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_simple_controller_manager" = substituteSource {
      src = fetchgit {
        name = "moveit_simple_controller_manager-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "8f25eff06a06facd7864eeccf92a1b398a984d8e";
        hash = "sha256-ex0t/E5kRk+KYKmtSLCkYSkg2/AQj0M/VWuojYe2pMI=";
      };
    };
  });
  meta = {
    description = "A generic, simple controller manager plugin for MoveIt.";
  };
})
