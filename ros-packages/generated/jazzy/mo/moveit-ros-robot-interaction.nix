{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  interactive-markers,
  mkSourceSet,
  moveit-common,
  moveit-core,
  moveit-ros-planning,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-eigen,
  tf2-geometry-msgs,
  tf2-ros,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_ros_robot_interaction";
  version = "2.12.1-1";
  src = finalAttrs.passthru.sources."moveit_ros_robot_interaction";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ interactive-markers moveit-common moveit-core moveit-ros-planning rclcpp tf2 tf2-eigen tf2-geometry-msgs tf2-ros ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_ros_robot_interaction" = substituteSource {
      src = fetchgit {
        name = "moveit_ros_robot_interaction-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "5943007987d0765114ff295da4480cf0f6f8d970";
        hash = "sha256-2POX35YUDUAf8cRNaCPFlfYkYEyH9oHihOl5Gh2dcQI=";
      };
    };
  });
  meta = {
    description = "Components of MoveIt that offer interaction via interactive markers";
  };
})
