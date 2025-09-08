{
  ament-cmake,
  ament-cmake-gmock,
  backward-ros,
  buildAmentCmakePackage,
  control-msgs,
  control-toolbox,
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
  rclcpp-action,
  realtime-tools,
  ros2-control-cmake,
  ros2-control-test-assets,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "parallel_gripper_controller";
  version = "5.6.1-1";
  src = finalAttrs.passthru.sources."parallel_gripper_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ backward-ros control-msgs control-toolbox controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-action realtime-tools ros2-control-cmake ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros control-msgs control-toolbox controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-action realtime-tools ros2-control-cmake ];
  checkInputs = [ ament-cmake-gmock controller-manager ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "parallel_gripper_controller" = substituteSource {
      src = fetchgit {
        name = "parallel_gripper_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "c8f62da86048a9dd8d1c9179cc5aef0cf4255b59";
        hash = "sha256-sm39DnUNjP6+CJ+xNlca4TIhyn4npa2UYHJJVDwkidA=";
      };
    };
  });
  meta = {
    description = "The parallel_gripper_controller package";
  };
})
