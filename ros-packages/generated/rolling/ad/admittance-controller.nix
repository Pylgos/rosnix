{
  ament-cmake,
  ament-cmake-gmock,
  angles,
  backward-ros,
  buildAmentCmakePackage,
  control-msgs,
  control-toolbox,
  controller-interface,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  geometry-msgs,
  hardware-interface,
  hardware-interface-testing,
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
  version = "4.21.0-1";
  src = finalAttrs.passthru.sources."admittance_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles backward-ros control-msgs control-toolbox controller-interface generate-parameter-library geometry-msgs hardware-interface kinematics-interface pluginlib rclcpp rclcpp-lifecycle realtime-tools tf2 tf2-eigen tf2-geometry-msgs tf2-kdl tf2-ros trajectory-msgs ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface-testing kinematics-interface-kdl ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "admittance_controller" = substituteSource {
      src = fetchgit {
        name = "admittance_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "42f7403e9ae2864154360f8bd56bf1086a6f1b67";
        hash = "sha256-xgV1q14XhLDyKTXeojX0s4LlF2SsRBIOLb/SeZOLk8g=";
      };
    };
  });
  meta = {
    description = "Implementation of admittance controllers for different input and output interface.";
  };
})
