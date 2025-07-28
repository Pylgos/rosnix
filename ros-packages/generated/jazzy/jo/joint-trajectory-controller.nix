{
  ament-cmake,
  ament-cmake-gmock,
  angles,
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
  rclcpp-lifecycle,
  realtime-tools,
  ros2-control-cmake,
  ros2-control-test-assets,
  rosSystemPackages,
  rsl,
  substituteSource,
  tl-expected,
  trajectory-msgs,
  urdf,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "joint_trajectory_controller";
  version = "4.29.0-1";
  src = finalAttrs.passthru.sources."joint_trajectory_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ angles backward-ros control-msgs control-toolbox controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-lifecycle realtime-tools ros2-control-cmake rsl tl-expected trajectory-msgs urdf ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles backward-ros control-msgs control-toolbox controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-lifecycle realtime-tools ros2-control-cmake rsl tl-expected trajectory-msgs urdf ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "joint_trajectory_controller" = substituteSource {
      src = fetchgit {
        name = "joint_trajectory_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "6e2923c92518de483eb196f661297afc832093ea";
        hash = "sha256-sFTYuWbSBDQ9X6sEGJh4N1qBfISkVeuZ7yM1b3HzhuM=";
      };
    };
  });
  meta = {
    description = "Controller for executing joint-space trajectories on a group of joints";
  };
})
