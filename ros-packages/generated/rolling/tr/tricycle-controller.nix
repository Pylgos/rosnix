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
  version = "4.23.0-1";
  src = finalAttrs.passthru.sources."tricycle_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rcpputils ];
  propagatedBuildInputs = [ ackermann-msgs backward-ros builtin-interfaces controller-interface generate-parameter-library geometry-msgs hardware-interface nav-msgs pluginlib rclcpp rclcpp-lifecycle realtime-tools ros2-control-cmake std-srvs tf2 tf2-msgs ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "tricycle_controller" = substituteSource {
      src = fetchgit {
        name = "tricycle_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "4dceb26c1ab56284d4434a8337fbdd16a9df9af5";
        hash = "sha256-bx9hy/VCd9IlWvKEC+3QlvQ8eyzHJrM4Z/AkDIF3+s0=";
      };
    };
  });
  meta = {
    description = "Controller for a tricycle drive mobile base";
  };
})
