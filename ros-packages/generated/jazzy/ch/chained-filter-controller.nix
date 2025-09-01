{
  ament-cmake,
  ament-cmake-gmock,
  buildAmentCmakePackage,
  controller-interface,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  filters,
  generate-parameter-library,
  hardware-interface,
  hardware-interface-testing,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  ros2-control-cmake,
  ros2-control-test-assets,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "chained_filter_controller";
  version = "4.31.0-1";
  src = finalAttrs.passthru.sources."chained_filter_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ controller-interface filters generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-lifecycle ros2-control-cmake ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-interface filters generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-lifecycle ros2-control-cmake ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "chained_filter_controller" = substituteSource {
      src = fetchgit {
        name = "chained_filter_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "e7b541b1e7ccee7f05b6191717b3f7951f1c73b1";
        hash = "sha256-WGpAJHKrc4PCHWj7JzkeSS2O3tMZ1fPv6NL8xJ9fTCk=";
      };
    };
  });
  meta = {
    description = "ros2_controller for configuring filter chains";
  };
})
