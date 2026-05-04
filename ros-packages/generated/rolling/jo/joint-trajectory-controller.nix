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
  rclcpp-action,
  rclcpp-lifecycle,
  realtime-tools,
  ros2-control-cmake,
  ros2-control-test-assets,
  rosSystemPackages,
  rsl,
  substituteSource,
  trajectory-msgs,
  urdf,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "joint_trajectory_controller";
  version = "6.6.0-2";
  src = finalAttrs.passthru.sources."joint_trajectory_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ angles backward-ros control-msgs control-toolbox controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-action rclcpp-lifecycle realtime-tools ros2-control-cmake rsl trajectory-msgs urdf ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libexpected-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles backward-ros control-msgs control-toolbox controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-action rclcpp-lifecycle realtime-tools ros2-control-cmake rsl trajectory-msgs urdf ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libexpected-dev" ]; };
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "joint_trajectory_controller" = substituteSource {
      src = fetchgit {
        name = "joint_trajectory_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "5f1cc462a1218868037411b3413e4e52fb56ea30";
        hash = "sha256-uhfGNyHSBInULJczRVlKwpj6HemJ8Lap0//x5gYK6hA=";
      };
    };
  });
  meta = {
    description = "Controller for executing joint-space trajectories on a group of joints";
  };
})
