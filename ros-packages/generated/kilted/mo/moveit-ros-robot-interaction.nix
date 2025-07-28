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
  version = "2.13.2-2";
  src = finalAttrs.passthru.sources."moveit_ros_robot_interaction";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ interactive-markers moveit-common moveit-core moveit-ros-planning rclcpp tf2 tf2-eigen tf2-geometry-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ interactive-markers moveit-common moveit-core moveit-ros-planning rclcpp tf2 tf2-eigen tf2-geometry-msgs tf2-ros ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_ros_robot_interaction" = substituteSource {
      src = fetchgit {
        name = "moveit_ros_robot_interaction-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "0ad15ffa06ce7deb7ef7d8c99e0ac2b660ab953e";
        hash = "sha256-xAkolTJAz2LTPKUMsvzj3NAqw6CGRPvKOmzIs9IUIL8=";
      };
    };
  });
  meta = {
    description = "Components of MoveIt that offer interaction via interactive markers";
  };
})
