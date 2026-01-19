{
  ament-cmake,
  ament-cmake-gmock,
  backward-ros,
  buildAmentCmakePackage,
  controller-interface,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  hardware-interface,
  hardware-interface-testing,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  realtime-tools,
  ros2-control-cmake,
  ros2-control-test-assets,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "forward_command_controller";
  version = "4.36.0-1";
  src = finalAttrs.passthru.sources."forward_command_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ backward-ros controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-lifecycle realtime-tools ros2-control-cmake std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-lifecycle realtime-tools ros2-control-cmake std-msgs ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "forward_command_controller" = substituteSource {
      src = fetchgit {
        name = "forward_command_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "11a6b5bce78ce34c521b702519715651e1c123a2";
        hash = "sha256-EkdRWNb3DJIePfNVOZRodDWoL/FQPoOKXKVk2yOVv5s=";
      };
    };
  });
  meta = {
    description = "Generic controller for forwarding commands.";
  };
})
