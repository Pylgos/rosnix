{
  ament-cmake,
  ament-cmake-gmock,
  backward-ros,
  buildAmentCmakePackage,
  control-msgs,
  control-toolbox,
  controller-interface,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  filters,
  generate-parameter-library,
  geometry-msgs,
  hardware-interface,
  hardware-interface-testing,
  joint-trajectory-controller,
  kinematics-interface,
  kinematics-interface-kdl,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  realtime-tools,
  ros2-control-test-assets,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-eigen,
  tf2-geometry-msgs,
  tf2-kdl,
  tf2-ros,
  trajectory-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "admittance_controller";
  version = "4.16.0-1";
  src = finalAttrs.passthru.sources."admittance_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros control-msgs control-toolbox controller-interface filters generate-parameter-library geometry-msgs hardware-interface joint-trajectory-controller kinematics-interface pluginlib rclcpp rclcpp-lifecycle realtime-tools tf2 tf2-eigen tf2-geometry-msgs tf2-kdl tf2-ros trajectory-msgs ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface-testing kinematics-interface-kdl ros2-control-test-assets ];
  passthru = {
    sources = mkSourceSet (sources: {
      "admittance_controller" = substituteSource {
        src = fetchgit {
          name = "admittance_controller-source";
          url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
          rev = "644e9f47ff315b31428f06bf714fb0306dd4fa9e";
          hash = "sha256-hZ3Ai2ECC/9T/wZPQ2YhrqfGCuI5H9IXSvrJ22PeQHY=";
        };
      };
    });
  };
  meta = {
    description = "Implementation of admittance controllers for different input and output interface.";
  };
})
