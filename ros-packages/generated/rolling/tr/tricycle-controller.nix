{
  ackermann-msgs,
  ament-cmake,
  ament-cmake-gmock,
  backward-ros,
  buildAmentCmakePackage,
  builtin-interfaces,
  controller-interface,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  geometry-msgs,
  hardware-interface,
  hardware-interface-testing,
  mkSourceSet,
  nav-msgs,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  rcpputils,
  realtime-tools,
  ros2-control-cmake,
  ros2-control-test-assets,
  rosSystemPackages,
  std-srvs,
  substituteSource,
  tf2,
  tf2-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tricycle_controller";
  version = "6.2.0-1";
  src = finalAttrs.passthru.sources."tricycle_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ackermann-msgs backward-ros builtin-interfaces controller-interface generate-parameter-library geometry-msgs hardware-interface nav-msgs pluginlib rclcpp rclcpp-lifecycle rcpputils realtime-tools ros2-control-cmake std-srvs tf2 tf2-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ackermann-msgs backward-ros builtin-interfaces controller-interface generate-parameter-library geometry-msgs hardware-interface nav-msgs pluginlib rclcpp rclcpp-lifecycle rcpputils realtime-tools ros2-control-cmake std-srvs tf2 tf2-msgs ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "tricycle_controller" = substituteSource {
      src = fetchgit {
        name = "tricycle_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "32b3019fe2e88290f5d7d06f3a6521baed6e1bdc";
        hash = "sha256-B+oyR9Q7czv2W947zHqrskPVlSJKH7+v1Seb+d2ONF0=";
      };
    };
  });
  meta = {
    description = "Controller for a tricycle drive mobile base";
  };
})
