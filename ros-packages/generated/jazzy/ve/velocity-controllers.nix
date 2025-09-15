{
  ament-cmake,
  ament-cmake-gmock,
  backward-ros,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  forward-command-controller,
  hardware-interface,
  hardware-interface-testing,
  mkSourceSet,
  pluginlib,
  rclcpp,
  ros2-control-cmake,
  ros2-control-test-assets,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "velocity_controllers";
  version = "4.32.0-1";
  src = finalAttrs.passthru.sources."velocity_controllers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ backward-ros forward-command-controller pluginlib rclcpp ros2-control-cmake ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros forward-command-controller pluginlib rclcpp ros2-control-cmake ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "velocity_controllers" = substituteSource {
      src = fetchgit {
        name = "velocity_controllers-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "2ad37799149614c7a48d0bd671bf79845aa9b1c5";
        hash = "sha256-Y7lYYLrIjfOnSFYivuf9nRRFFsbablhYzEu0XU/60f4=";
      };
    };
  });
  meta = {
    description = "Generic controller for forwarding commands.";
  };
})
