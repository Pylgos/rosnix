{
  ament-cmake,
  ament-cmake-gmock,
  buildAmentCmakePackage,
  control-msgs,
  controller-interface,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  hardware-interface,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  realtime-tools,
  ros2-control-cmake,
  ros2-control-test-assets,
  rosSystemPackages,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "motion_primitives_controllers";
  version = "6.2.0-1";
  src = finalAttrs.passthru.sources."motion_primitives_controllers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ control-msgs controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-lifecycle realtime-tools ros2-control-cmake std-srvs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ control-msgs controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-lifecycle realtime-tools ros2-control-cmake std-srvs ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "motion_primitives_controllers" = substituteSource {
      src = fetchgit {
        name = "motion_primitives_controllers-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "1c86472876643926e1379560d9dc8fe0b0026eca";
        hash = "sha256-V2qf/AjZ5VUGWyopRYxeKopd5tnRhxIvZfq2BJVvpy8=";
      };
    };
  });
  meta = {
    description = "Package to control robots using motion primitives like PTP, LIN and CIRC";
  };
})
