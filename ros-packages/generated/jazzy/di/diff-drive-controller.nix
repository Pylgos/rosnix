{
  ament-cmake,
  ament-cmake-gmock,
  backward-ros,
  buildAmentCmakePackage,
  control-toolbox,
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
  substituteSource,
  tf2,
  tf2-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "diff_drive_controller";
  version = "4.38.0-1";
  src = finalAttrs.passthru.sources."diff_drive_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ backward-ros control-toolbox controller-interface generate-parameter-library geometry-msgs hardware-interface nav-msgs pluginlib rclcpp rclcpp-lifecycle rcpputils realtime-tools ros2-control-cmake tf2 tf2-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros control-toolbox controller-interface generate-parameter-library geometry-msgs hardware-interface nav-msgs pluginlib rclcpp rclcpp-lifecycle rcpputils realtime-tools ros2-control-cmake tf2 tf2-msgs ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "diff_drive_controller" = substituteSource {
      src = fetchgit {
        name = "diff_drive_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "d79c833d31d985b0d1599b6a5a721462c0e9841f";
        hash = "sha256-K/49xKsFPls4wM9JkpE1zqmtWM2PFZ7GqAzbezX/I+o=";
      };
    };
  });
  meta = {
    description = "Controller for a differential-drive mobile base.";
  };
})
