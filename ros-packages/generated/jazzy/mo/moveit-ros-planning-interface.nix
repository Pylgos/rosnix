{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  moveit-common,
  moveit-configs-utils,
  moveit-core,
  moveit-msgs,
  moveit-resources-fanuc-moveit-config,
  moveit-resources-panda-moveit-config,
  moveit-ros-move-group,
  moveit-ros-planning,
  moveit-ros-warehouse,
  moveit-simple-controller-manager,
  rclcpp,
  rclcpp-action,
  rclpy,
  ros-testing,
  rosSystemPackages,
  rviz2,
  substituteSource,
  tf2,
  tf2-eigen,
  tf2-geometry-msgs,
  tf2-ros,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_ros_planning_interface";
  version = "2.12.3-1";
  src = finalAttrs.passthru.sources."moveit_ros_planning_interface";
  nativeBuildInputs = [ ament-cmake eigen3-cmake-module wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ geometry-msgs moveit-common moveit-core moveit-msgs moveit-ros-move-group moveit-ros-planning moveit-ros-warehouse rclcpp rclcpp-action rclpy tf2 tf2-eigen tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "python3" ]; };
  buildInputs = [ ament-cmake eigen3-cmake-module ];
  propagatedBuildInputs = [ geometry-msgs moveit-common moveit-core moveit-msgs moveit-ros-move-group moveit-ros-planning moveit-ros-warehouse rclcpp rclcpp-action rclpy tf2 tf2-eigen tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "python3" ]; };
  checkInputs = [ ament-cmake-gtest moveit-configs-utils moveit-resources-fanuc-moveit-config moveit-resources-panda-moveit-config moveit-simple-controller-manager ros-testing rviz2 ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_ros_planning_interface" = substituteSource {
      src = fetchgit {
        name = "moveit_ros_planning_interface-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "7a944cfe56771db5bf2fd1b9919aad8b2d787fd4";
        hash = "sha256-gNBd0jntOhH0uSod/YFaIVMVWA6EHc2MjyA45Pi1IcQ=";
      };
    };
  });
  meta = {
    description = "Components of MoveIt that offer simpler remote (as from another ROS 2 node) interfaces to planning and execution";
  };
})
