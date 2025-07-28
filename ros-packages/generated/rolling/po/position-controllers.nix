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
  pname = "position_controllers";
  version = "5.4.0-1";
  src = finalAttrs.passthru.sources."position_controllers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ backward-ros forward-command-controller pluginlib rclcpp ros2-control-cmake ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros forward-command-controller pluginlib rclcpp ros2-control-cmake ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "position_controllers" = substituteSource {
      src = fetchgit {
        name = "position_controllers-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "01b1f121c9d7298dcedc59072c501c92b5aa8241";
        hash = "sha256-ETv1rwfQu4wDHM7pjgyS0zW/o0fv8pipA0MkQWJzrf8=";
      };
    };
  });
  meta = {
    description = "Generic position controller for forwarding position commands.";
  };
})
