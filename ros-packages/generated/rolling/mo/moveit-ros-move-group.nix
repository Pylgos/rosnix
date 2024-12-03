{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-common,
  moveit-configs-utils,
  moveit-core,
  moveit-kinematics,
  moveit-resources-fanuc-moveit-config,
  moveit-resources-panda-moveit-config,
  moveit-ros-occupancy-map-monitor,
  moveit-ros-planning,
  pluginlib,
  rclcpp,
  rclcpp-action,
  ros-testing,
  rosSystemPackages,
  std-srvs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_ros_move_group";
  version = "2.12.0-1";
  src = finalAttrs.passthru.sources."moveit_ros_move_group";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ moveit-common moveit-core moveit-kinematics moveit-ros-occupancy-map-monitor moveit-ros-planning pluginlib rclcpp rclcpp-action std-srvs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" ]; };
  checkInputs = [ ament-cmake-gtest moveit-configs-utils moveit-resources-fanuc-moveit-config moveit-resources-panda-moveit-config ros-testing ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_ros_move_group" = substituteSource {
      src = fetchgit {
        name = "moveit_ros_move_group-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "e73d0f0804c99c4596c1a552e29d4196d307d25f";
        hash = "sha256-vkABjcBZRuxS9TNSCmbws2ODnvq8xz7g9/iynH2NDgc=";
      };
    };
  });
  meta = {
    description = "The move_group node for MoveIt";
  };
})
