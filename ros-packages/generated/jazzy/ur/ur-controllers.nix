{
  action-msgs,
  ament-cmake,
  angles,
  buildAmentCmakePackage,
  control-msgs,
  controller-interface,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  geometry-msgs,
  hardware-interface,
  joint-trajectory-controller,
  lifecycle-msgs,
  mkSourceSet,
  pluginlib,
  rclcpp-lifecycle,
  rcutils,
  realtime-tools,
  ros2-control-test-assets,
  rosSystemPackages,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2-geometry-msgs,
  tf2-ros,
  trajectory-msgs,
  ur-dashboard-msgs,
  ur-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ur_controllers";
  version = "3.1.1-1";
  src = finalAttrs.passthru.sources."ur_controllers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ action-msgs angles control-msgs controller-interface generate-parameter-library geometry-msgs hardware-interface joint-trajectory-controller lifecycle-msgs pluginlib rclcpp-lifecycle rcutils realtime-tools std-msgs std-srvs tf2-geometry-msgs tf2-ros trajectory-msgs ur-dashboard-msgs ur-msgs ];
  checkInputs = [ controller-manager ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "ur_controllers" = substituteSource {
      src = fetchgit {
        name = "ur_controllers-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_ROS2_Driver-release.git";
        rev = "0be467ce5e38d650a7966eb566ed5c305959cbe5";
        hash = "sha256-Om7g4t76eQVnoo8WRIFv91/1Z6FZc7ekSttjWPoNaaI=";
      };
    };
  });
  meta = {
    description = "Provides controllers that use the speed scaling interface of Universal Robots.";
  };
})
