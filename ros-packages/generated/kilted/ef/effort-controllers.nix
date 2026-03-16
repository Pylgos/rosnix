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
  version = "5.13.1-1";
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
        rev = "5130aaa4b47c139d3164d8e38f900744224c87f8";
        hash = "sha256-ZdrdZuzdpyibBT6FWr/nuFooVIVa8jc1IZlnfgrdYVc=";
      };
    };
  });
  meta = {
    description = "Generic controller for forwarding commands.";
  };
})
