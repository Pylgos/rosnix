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
  version = "2.13.2-1";
  src = finalAttrs.passthru.sources."moveit_servo";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ control-msgs controller-manager generate-parameter-library geometry-msgs joint-state-broadcaster joint-trajectory-controller joy launch-param-builder moveit-common moveit-configs-utils moveit-core moveit-msgs moveit-ros-planning moveit-ros-planning-interface moveit-ros-visualization pluginlib realtime-tools robot-state-publisher sensor-msgs std-msgs std-srvs tf2-eigen tf2-ros trajectory-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "gripper_controllers" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ control-msgs controller-manager generate-parameter-library geometry-msgs joint-state-broadcaster joint-trajectory-controller joy launch-param-builder moveit-common moveit-configs-utils moveit-core moveit-msgs moveit-ros-planning moveit-ros-planning-interface moveit-ros-visualization pluginlib realtime-tools robot-state-publisher sensor-msgs std-msgs std-srvs tf2-eigen tf2-ros trajectory-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gripper_controllers" ]; };
  checkInputs = [ ament-cmake-gtest moveit-resources-panda-moveit-config ros-testing ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_servo" = substituteSource {
      src = fetchgit {
        name = "moveit_servo-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "133a91cf6285965c6dc6895af43151f26b420827";
        hash = "sha256-G7jR7Jc1iEfahVtfPwBtSapicljtx46/m4cJ0Iadwno=";
      };
    };
  });
  meta = {
    description = "Provides real-time manipulator Cartesian and joint servoing.";
  };
})
