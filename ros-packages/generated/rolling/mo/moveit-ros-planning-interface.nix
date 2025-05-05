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
  version = "2.13.2-1";
  src = finalAttrs.passthru.sources."moveit_ros_planning_interface";
  nativeBuildInputs = [ ament-cmake eigen3-cmake-module wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rclcpp rclpy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  propagatedBuildInputs = [ geometry-msgs moveit-common moveit-core moveit-msgs moveit-ros-move-group moveit-ros-planning moveit-ros-warehouse rclcpp-action tf2 tf2-eigen tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3" ]; };
  checkInputs = [ ament-cmake-gtest moveit-configs-utils moveit-resources-fanuc-moveit-config moveit-resources-panda-moveit-config moveit-simple-controller-manager ros-testing rviz2 ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_ros_planning_interface" = substituteSource {
      src = fetchgit {
        name = "moveit_ros_planning_interface-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "9468ed82888c0272e7c02b808cd17ef562d4e353";
        hash = "sha256-bHHUF6nmbKaGSlSfEBweZfg7nCRQy7HNiA6zqIp9mHQ=";
      };
    };
  });
  meta = {
    description = "Components of MoveIt that offer simpler remote (as from another ROS 2 node) interfaces to planning and execution";
  };
})
