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
  pname = "effort_controllers";
  version = "5.0.2-1";
  src = finalAttrs.passthru.sources."effort_controllers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ backward-ros forward-command-controller pluginlib rclcpp ros2-control-cmake ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros forward-command-controller pluginlib rclcpp ros2-control-cmake ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "effort_controllers" = substituteSource {
      src = fetchgit {
        name = "effort_controllers-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "099982b8fc71e547cd053e516cb64e26ba5624e9";
        hash = "sha256-ipMBJGTctn9KRrlbn4zA6l5oUSYrOiB23HXq0MnVlXk=";
      };
    };
  });
  meta = {
    description = "Generic controller for forwarding commands.";
  };
})
