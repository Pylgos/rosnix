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
  version = "2.13.0-1";
  src = finalAttrs.passthru.sources."moveit_ros_robot_interaction";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ interactive-markers moveit-common moveit-core moveit-ros-planning rclcpp tf2 tf2-eigen tf2-geometry-msgs tf2-ros ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_ros_robot_interaction" = substituteSource {
      src = fetchgit {
        name = "moveit_ros_robot_interaction-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "1d9e2f4bd37eee388638dde6b189d912e6acc9a1";
        hash = "sha256-AOyQRmqsXwvklRGDloNCbVr+QAGI1dBVIO0q0zSBxL0=";
      };
    };
  });
  meta = {
    description = "Components of MoveIt that offer interaction via interactive markers";
  };
})
