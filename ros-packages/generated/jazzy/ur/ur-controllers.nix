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
  hardware-interface-testing,
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
  version = "3.3.3-1";
  src = finalAttrs.passthru.sources."ur_controllers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ action-msgs angles control-msgs controller-interface generate-parameter-library geometry-msgs hardware-interface joint-trajectory-controller lifecycle-msgs pluginlib rclcpp-lifecycle rcutils realtime-tools std-msgs std-srvs tf2-geometry-msgs tf2-ros trajectory-msgs ur-dashboard-msgs ur-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ action-msgs angles control-msgs controller-interface generate-parameter-library geometry-msgs hardware-interface joint-trajectory-controller lifecycle-msgs pluginlib rclcpp-lifecycle rcutils realtime-tools std-msgs std-srvs tf2-geometry-msgs tf2-ros trajectory-msgs ur-dashboard-msgs ur-msgs ];
  checkInputs = [ controller-manager hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "ur_controllers" = substituteSource {
      src = fetchgit {
        name = "ur_controllers-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_ROS2_Driver-release.git";
        rev = "52fe61f7aaababc6a05bf2ba036609f9d4b78dd2";
        hash = "sha256-a6mg3dmyb9QaweTaqHFDV85yOqHd6nxiFFj7vTyVTxg=";
      };
    };
  });
  meta = {
    description = "Provides controllers that use the speed scaling interface of Universal Robots.";
  };
})
