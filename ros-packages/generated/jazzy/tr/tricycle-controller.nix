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
  ros2-control-test-assets,
  rosSystemPackages,
  std-srvs,
  substituteSource,
  tf2,
  tf2-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tricycle_controller";
  version = "4.21.0-1";
  src = finalAttrs.passthru.sources."tricycle_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ackermann-msgs backward-ros builtin-interfaces controller-interface generate-parameter-library geometry-msgs hardware-interface nav-msgs pluginlib rclcpp rclcpp-lifecycle rcpputils realtime-tools std-srvs tf2 tf2-msgs ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "tricycle_controller" = substituteSource {
      src = fetchgit {
        name = "tricycle_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "a6afae3200400e8cb0d1ba4c0e0d9e6b5c0dfebb";
        hash = "sha256-S62Dw1/SoSMI6XN4XsfwdXvWEPEbcyt0WPOciGKUKUs=";
      };
    };
  });
  meta = {
    description = "Controller for a tricycle drive mobile base";
  };
})
