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
  ros2-control-test-assets,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "forward_command_controller";
  version = "4.22.0-1";
  src = finalAttrs.passthru.sources."forward_command_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-lifecycle realtime-tools std-msgs ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "forward_command_controller" = substituteSource {
      src = fetchgit {
        name = "forward_command_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "6e8e4bb6bcca079933861ee6bb719a1960fa575e";
        hash = "sha256-L6Geeunx5sC7WFIR3j/S6kZtmBZO/52ubvBEe7R2X98=";
      };
    };
  });
  meta = {
    description = "Generic controller for forwarding commands.";
  };
})
