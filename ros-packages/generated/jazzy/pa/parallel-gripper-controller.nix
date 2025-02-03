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
  ros2-control-test-assets,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "parallel_gripper_controller";
  version = "4.20.0-1";
  src = finalAttrs.passthru.sources."parallel_gripper_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros control-msgs control-toolbox controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-action realtime-tools ];
  checkInputs = [ ament-cmake-gmock controller-manager ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "parallel_gripper_controller" = substituteSource {
      src = fetchgit {
        name = "parallel_gripper_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "fd425e4bf15c4495b5c03989ef29410b42b99914";
        hash = "sha256-xCpt+YQGm8NCmx7h2RSpI6Cx8/n3kwrgB0Xv3rYMDt8=";
      };
    };
  });
  meta = {
    description = "The parallel_gripper_controller package";
  };
})
