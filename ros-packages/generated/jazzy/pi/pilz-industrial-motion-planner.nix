{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  geometry-msgs,
  launch-param-builder,
  mkSourceSet,
  moveit-common,
  moveit-configs-utils,
  moveit-core,
  moveit-msgs,
  moveit-resources-panda-moveit-config,
  moveit-resources-prbt-moveit-config,
  moveit-resources-prbt-pg70-support,
  moveit-resources-prbt-support,
  moveit-ros-move-group,
  moveit-ros-planning,
  orocos-kdl-vendor,
  pilz-industrial-motion-planner-testutils,
  pluginlib,
  rclcpp,
  ros-testing,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-eigen,
  tf2-eigen-kdl,
  tf2-geometry-msgs,
  tf2-kdl,
  tf2-ros,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pilz_industrial_motion_planner";
  version = "2.12.1-1";
  src = finalAttrs.passthru.sources."pilz_industrial_motion_planner";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module ];
  propagatedBuildInputs = [ generate-parameter-library geometry-msgs moveit-common moveit-core moveit-msgs moveit-ros-move-group moveit-ros-planning orocos-kdl-vendor pluginlib rclcpp tf2 tf2-eigen tf2-eigen-kdl tf2-geometry-msgs tf2-kdl tf2-ros ];
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest launch-param-builder moveit-configs-utils moveit-resources-panda-moveit-config moveit-resources-prbt-moveit-config moveit-resources-prbt-pg70-support moveit-resources-prbt-support pilz-industrial-motion-planner-testutils ros-testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  passthru.sources = mkSourceSet (sources: {
    "pilz_industrial_motion_planner" = substituteSource {
      src = fetchgit {
        name = "pilz_industrial_motion_planner-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "70f9d1b0c8d22b923440ec51a4d5da7ad928c953";
        hash = "sha256-jwbkJ1GPyhWVu8f4fix4v7UkJCUrRTq6EQiUwwML/rY=";
      };
    };
  });
  meta = {
    description = "MoveIt plugin to generate industrial trajectories PTP, LIN, CIRC and sequences thereof.";
  };
})
