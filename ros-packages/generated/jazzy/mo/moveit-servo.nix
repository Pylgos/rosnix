{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  control-msgs,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  geometry-msgs,
  gripper-controllers,
  joint-state-broadcaster,
  joint-trajectory-controller,
  joy,
  launch-param-builder,
  mkSourceSet,
  moveit-common,
  moveit-configs-utils,
  moveit-core,
  moveit-msgs,
  moveit-resources-panda-moveit-config,
  moveit-ros-planning,
  moveit-ros-planning-interface,
  moveit-ros-visualization,
  pluginlib,
  realtime-tools,
  robot-state-publisher,
  ros-testing,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2-eigen,
  tf2-ros,
  trajectory-msgs,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_servo";
  version = "2.12.2-1";
  src = finalAttrs.passthru.sources."moveit_servo";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ control-msgs controller-manager generate-parameter-library geometry-msgs gripper-controllers joint-state-broadcaster joint-trajectory-controller joy launch-param-builder moveit-common moveit-configs-utils moveit-core moveit-msgs moveit-ros-planning moveit-ros-planning-interface moveit-ros-visualization pluginlib realtime-tools robot-state-publisher sensor-msgs std-msgs std-srvs tf2-eigen tf2-ros trajectory-msgs ];
  checkInputs = [ ament-cmake-gtest moveit-resources-panda-moveit-config ros-testing ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_servo" = substituteSource {
      src = fetchgit {
        name = "moveit_servo-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "af9648078fd0cbfb5e13508b4929d45e3939ea00";
        hash = "sha256-g74rT+P/8A1r8i0HikMAssM5vlioTpxZWQZ8IT8eS+I=";
      };
    };
  });
  meta = {
    description = "Provides real-time manipulator Cartesian and joint servoing.";
  };
})
