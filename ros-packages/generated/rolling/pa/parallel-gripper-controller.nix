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
  version = "4.22.0-1";
  src = finalAttrs.passthru.sources."parallel_gripper_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros control-msgs control-toolbox controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-action realtime-tools ];
  checkInputs = [ ament-cmake-gmock controller-manager ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "parallel_gripper_controller" = substituteSource {
      src = fetchgit {
        name = "parallel_gripper_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "566e0e5f42d305d3a8e3e1b0641f9fc5db08bb02";
        hash = "sha256-Z+6dcWLR7sHQfO8a3GWz+TaJqK9n27LN31FEPtp/SWs=";
      };
    };
  });
  meta = {
    description = "The parallel_gripper_controller package";
  };
})
