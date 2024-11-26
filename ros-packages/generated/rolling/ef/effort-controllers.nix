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
  pname = "effort_controllers";
  version = "4.16.0-1";
  src = finalAttrs.passthru.sources."effort_controllers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros forward-command-controller pluginlib rclcpp ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface hardware-interface-testing ros2-control-test-assets ];
  passthru = {
    sources = mkSourceSet (sources: {
      "effort_controllers" = substituteSource {
        src = fetchgit {
          name = "effort_controllers-source";
          url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
          rev = "1a09af8b0767303a5b2c178510090a1506a3e112";
          hash = "sha256-FUQwIbhMyVSPRZe92ePpOu7VkTNlgaoP3RyktenTkUQ=";
        };
      };
    });
  };
  meta = {
    description = "Generic controller for forwarding commands.";
  };
})
