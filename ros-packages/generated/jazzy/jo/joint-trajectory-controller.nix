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
  version = "4.16.0-1";
  src = finalAttrs.passthru.sources."joint_trajectory_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles backward-ros control-msgs control-toolbox controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-lifecycle realtime-tools rsl tl-expected trajectory-msgs urdf ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "joint_trajectory_controller" = substituteSource {
      src = fetchgit {
        name = "joint_trajectory_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "7570747afd08960a32a415a198f4e4123ebb1d00";
        hash = "sha256-kiHsB67vn5nWHy4oYzZFoVF+A+ZvMEez3xDC8tGUiao=";
      };
    };
  });
  meta = {
    description = "Controller for executing joint-space trajectories on a group of joints";
  };
})
