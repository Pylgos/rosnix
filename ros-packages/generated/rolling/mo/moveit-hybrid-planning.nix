{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-cpp,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-common,
  moveit-configs-utils,
  moveit-core,
  moveit-msgs,
  moveit-planners-ompl,
  moveit-resources-panda-moveit-config,
  moveit-ros-planning,
  moveit-ros-planning-interface,
  moveit-simple-controller-manager,
  pluginlib,
  position-controllers,
  rclcpp,
  rclcpp-action,
  rclcpp-components,
  robot-state-publisher,
  ros-testing,
  rosSystemPackages,
  rviz2,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2-ros,
  trajectory-msgs,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_hybrid_planning";
  version = "2.14.0-1";
  src = finalAttrs.passthru.sources."moveit_hybrid_planning";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-cpp controller-manager moveit-common moveit-core moveit-msgs moveit-resources-panda-moveit-config moveit-ros-planning moveit-ros-planning-interface pluginlib position-controllers rclcpp rclcpp-action rclcpp-components robot-state-publisher rviz2 std-msgs std-srvs tf2-ros trajectory-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp controller-manager moveit-common moveit-core moveit-msgs moveit-resources-panda-moveit-config moveit-ros-planning moveit-ros-planning-interface pluginlib position-controllers rclcpp rclcpp-action rclcpp-components robot-state-publisher rviz2 std-msgs std-srvs tf2-ros trajectory-msgs ];
  checkInputs = [ ament-cmake-gtest controller-manager moveit-configs-utils moveit-planners-ompl moveit-resources-panda-moveit-config moveit-simple-controller-manager position-controllers robot-state-publisher ros-testing ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_hybrid_planning" = substituteSource {
      src = fetchgit {
        name = "moveit_hybrid_planning-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "5840c07ed2b931bb01b96ad588b3e4fd23c81511";
        hash = "sha256-HH4x3DnO14wdYOxmJcUWVS827Az0mw96/AgtyvXRkVY=";
      };
    };
  });
  meta = {
    description = "Hybrid planning components of MoveIt 2";
  };
})
