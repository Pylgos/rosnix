{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-index-cpp,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  launch-testing-ament-cmake,
  message-filters,
  mkSourceSet,
  moveit-common,
  moveit-configs-utils,
  moveit-core,
  moveit-msgs,
  moveit-resources-panda-moveit-config,
  moveit-ros-occupancy-map-monitor,
  pluginlib,
  rclcpp,
  rclcpp-action,
  rclcpp-components,
  ros-testing,
  rosSystemPackages,
  srdfdom,
  std-msgs,
  substituteSource,
  tf2,
  tf2-eigen,
  tf2-geometry-msgs,
  tf2-msgs,
  tf2-ros,
  urdf,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_ros_planning";
  version = "2.12.2-1";
  src = finalAttrs.passthru.sources."moveit_ros_planning";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module ];
  propagatedBuildInputs = [ ament-index-cpp generate-parameter-library message-filters moveit-common moveit-core moveit-msgs moveit-ros-occupancy-map-monitor pluginlib rclcpp rclcpp-action rclcpp-components srdfdom std-msgs tf2 tf2-eigen tf2-geometry-msgs tf2-msgs tf2-ros urdf ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "fmt" ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest launch-testing-ament-cmake moveit-configs-utils moveit-resources-panda-moveit-config ros-testing ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_ros_planning" = substituteSource {
      src = fetchgit {
        name = "moveit_ros_planning-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "217934d0417452368f99df1af01b1256c1b9e4b7";
        hash = "sha256-TCUXcXM0xjEZaxPTy/7Aqs8YPw/ff80EK1W28j2/+Ao=";
      };
    };
  });
  meta = {
    description = "Planning components of MoveIt that use ROS";
  };
})
