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
  ros2-control-cmake,
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
  version = "5.7.0-1";
  src = finalAttrs.passthru.sources."admittance_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ angles backward-ros control-msgs control-toolbox controller-interface generate-parameter-library geometry-msgs hardware-interface kinematics-interface pluginlib rclcpp rclcpp-lifecycle realtime-tools ros2-control-cmake tf2 tf2-eigen tf2-geometry-msgs tf2-kdl tf2-ros trajectory-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles backward-ros control-msgs control-toolbox controller-interface generate-parameter-library geometry-msgs hardware-interface kinematics-interface pluginlib rclcpp rclcpp-lifecycle realtime-tools ros2-control-cmake tf2 tf2-eigen tf2-geometry-msgs tf2-kdl tf2-ros trajectory-msgs ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface-testing kinematics-interface-kdl ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "admittance_controller" = substituteSource {
      src = fetchgit {
        name = "admittance_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "d770a606f6c0a7bf88fd69a967baaf3652ab33f8";
        hash = "sha256-obtd0fIo2mpP/60scP7rGH6shUUWow7XsuWHyUKrc14=";
      };
    };
  });
  meta = {
    description = "Implementation of admittance controllers for different input and output interface.";
  };
})
