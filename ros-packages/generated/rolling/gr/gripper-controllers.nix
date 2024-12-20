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
  hardware-interface-testing,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-action,
  realtime-tools,
  ros2-control-test-assets,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gripper_controllers";
  version = "4.18.0-2";
  src = finalAttrs.passthru.sources."gripper_controllers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros control-msgs control-toolbox controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-action realtime-tools ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "gripper_controllers" = substituteSource {
      src = fetchgit {
        name = "gripper_controllers-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "8a64cf1086a83a4a27a245a137f3f89692ce189a";
        hash = "sha256-cr4hSvQnQ4VvbcEhhf3rdaSikoeoGe9jxNyIcy8boNQ=";
      };
    };
  });
  meta = {
    description = "The gripper_controllers package";
  };
})
