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
  version = "5.6.1-1";
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
        rev = "7a30cfcaa51532aa7350fa94c34f3800d64ea4ab";
        hash = "sha256-3Yg+4zmaUjxSU3SwcL+aKJh9rZ621u2pkiEHqzEHFXQ=";
      };
    };
  });
  meta = {
    description = "Package to control robots using motion primitives like PTP, LIN and CIRC";
  };
})
