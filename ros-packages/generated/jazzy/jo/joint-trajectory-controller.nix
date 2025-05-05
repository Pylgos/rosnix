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
  version = "4.24.0-1";
  src = finalAttrs.passthru.sources."joint_trajectory_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ generate-parameter-library rclcpp rclcpp-lifecycle rsl tl-expected ];
  propagatedBuildInputs = [ angles backward-ros control-msgs control-toolbox controller-interface hardware-interface pluginlib realtime-tools ros2-control-cmake trajectory-msgs urdf ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "joint_trajectory_controller" = substituteSource {
      src = fetchgit {
        name = "joint_trajectory_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "c6c9ada8a94e7d01c08f79e60d8ec5ac585ebdef";
        hash = "sha256-JE3o7ka8mxoGR2FdCc4m96oyxivlLJUji9J/DoHiDiY=";
      };
    };
  });
  meta = {
    description = "Controller for executing joint-space trajectories on a group of joints";
  };
})
