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
  ros2-control-test-assets,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "velocity_controllers";
  version = "4.19.0-1";
  src = finalAttrs.passthru.sources."velocity_controllers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros forward-command-controller pluginlib rclcpp ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "velocity_controllers" = substituteSource {
      src = fetchgit {
        name = "velocity_controllers-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "d6300556d1674fb6ac4d7c96994b9e5a1fe365ec";
        hash = "sha256-OLVHvl52gZGLTx9vkkwMBxFkg+QVtlRfnlmt4gh2Zl0=";
      };
    };
  });
  meta = {
    description = "Generic controller for forwarding commands.";
  };
})
