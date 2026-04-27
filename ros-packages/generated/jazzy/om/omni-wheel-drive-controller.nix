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
  version = "4.40.0-1";
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
        rev = "7655086ae30736cd7f4e8cc12964ca2d47fc890c";
        hash = "sha256-rDlF5dGqFrnGa6Hh2zJGikufujis9+86mHAdi2RU+sE=";
      };
    };
  });
  meta = {
    description = "A chainable controller for mobile robots with omnidirectional drive with three or\n    more omni wheels.";
  };
})
