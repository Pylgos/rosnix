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
  version = "3.0.1-1";
  src = finalAttrs.passthru.sources."ur_controllers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ action-msgs angles control-msgs controller-interface geometry-msgs hardware-interface joint-trajectory-controller lifecycle-msgs pluginlib rclcpp-lifecycle rcutils realtime-tools std-msgs std-srvs tf2-geometry-msgs tf2-ros trajectory-msgs ur-dashboard-msgs ur-msgs ];
  checkInputs = [ controller-manager ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "ur_controllers" = substituteSource {
      src = fetchgit {
        name = "ur_controllers-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_ROS2_Driver-release.git";
        rev = "20d2519c3bb837ffcf907d9b913cac28283b3a75";
        hash = "sha256-Ci+Zma/2X9eNFV9I/7QAcuttQVADsPQ1JPCTjDw4x6A=";
      };
    };
  });
  meta = {
    description = "Provides controllers that use the speed scaling interface of Universal Robots.";
  };
})
