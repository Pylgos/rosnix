{
  ament-cmake,
  ament-cmake-gmock,
  buildAmentCmakePackage,
  controller-interface,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  geometry-msgs,
  hardware-interface,
  mkSourceSet,
  nav-msgs,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  realtime-tools,
  ros2-control-cmake,
  ros2-control-test-assets,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "omni_wheel_drive_controller";
  version = "4.33.1-1";
  src = finalAttrs.passthru.sources."omni_wheel_drive_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ controller-interface generate-parameter-library geometry-msgs hardware-interface nav-msgs pluginlib rclcpp rclcpp-lifecycle realtime-tools ros2-control-cmake tf2 tf2-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-interface generate-parameter-library geometry-msgs hardware-interface nav-msgs pluginlib rclcpp rclcpp-lifecycle realtime-tools ros2-control-cmake tf2 tf2-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "omni_wheel_drive_controller" = substituteSource {
      src = fetchgit {
        name = "omni_wheel_drive_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "d9fbcbce1ec7d40a757cfe566d95e6532169a2de";
        hash = "sha256-o8cMcRgk6bDLGp6RW9FX0K4h5R7Pg8T9qEZzcp21bqk=";
      };
    };
  });
  meta = {
    description = "A chainable controller for mobile robots with omnidirectional drive with three or\n    more omni wheels.";
  };
})
