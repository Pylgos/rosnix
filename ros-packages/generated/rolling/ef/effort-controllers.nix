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
  version = "4.23.0-1";
  src = finalAttrs.passthru.sources."effort_controllers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros forward-command-controller pluginlib rclcpp ros2-control-cmake ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "effort_controllers" = substituteSource {
      src = fetchgit {
        name = "effort_controllers-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "a3f97744760063aaf38f4cd105056dd0fa7c39a4";
        hash = "sha256-BBFusuU816e3vbKM7A8/qykiSMzAYaQpqJoxlQ8O6l4=";
      };
    };
  });
  meta = {
    description = "Generic controller for forwarding commands.";
  };
})
