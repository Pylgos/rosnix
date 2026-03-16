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
  version = "6.4.0-1";
  src = finalAttrs.passthru.sources."omni_wheel_drive_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ control-msgs controller-interface generate-parameter-library geometry-msgs hardware-interface nav-msgs pluginlib rclcpp rclcpp-lifecycle realtime-tools ros2-control-cmake tf2 tf2-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ control-msgs controller-interface generate-parameter-library geometry-msgs hardware-interface nav-msgs pluginlib rclcpp rclcpp-lifecycle realtime-tools ros2-control-cmake tf2 tf2-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "omni_wheel_drive_controller" = substituteSource {
      src = fetchgit {
        name = "omni_wheel_drive_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "edb211b1fe071579aa76e64730f4dce0b4ff0e46";
        hash = "sha256-sN0cnD2d/07GLcIoExGO1KnNdzEO3GFP3tG7Y8F4km8=";
      };
    };
  });
  meta = {
    description = "A chainable controller for mobile robots with omnidirectional drive with three or\n    more omni wheels.";
  };
})
