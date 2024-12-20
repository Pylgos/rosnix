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
  version = "4.18.0-1";
  src = finalAttrs.passthru.sources."effort_controllers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros forward-command-controller pluginlib rclcpp ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "effort_controllers" = substituteSource {
      src = fetchgit {
        name = "effort_controllers-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "b1c58611361a7529883a412dc6301e09c0db5d35";
        hash = "sha256-bfTrQ0tx/rtpxkG4s/c8fHbfeCXkK/TcTtYy4KKvWWY=";
      };
    };
  });
  meta = {
    description = "Generic controller for forwarding commands.";
  };
})
