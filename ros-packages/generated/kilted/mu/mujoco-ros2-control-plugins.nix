{
  ament-cmake,
  ament-cmake-gtest,
  backward-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  mujoco-ros2-control-msgs,
  mujoco-vendor,
  pluginlib,
  rclcpp,
  realtime-tools,
  ros2-control-cmake,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mujoco_ros2_control_plugins";
  version = "0.0.3-1";
  src = finalAttrs.passthru.sources."mujoco_ros2_control_plugins";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ backward-ros geometry-msgs mujoco-ros2-control-msgs mujoco-vendor pluginlib rclcpp realtime-tools ros2-control-cmake std-msgs visualization-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros geometry-msgs mujoco-ros2-control-msgs mujoco-vendor pluginlib rclcpp realtime-tools ros2-control-cmake std-msgs visualization-msgs ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "mujoco_ros2_control_plugins" = substituteSource {
      src = fetchgit {
        name = "mujoco_ros2_control_plugins-source";
        url = "https://github.com/ros2-gbp/mujoco_ros2_control-release.git";
        rev = "533539eaf49b4d39da3653852c01a2728af2249e";
        hash = "sha256-epSZ8t9AMWhRMx70FcRTCWzWmyNq9RqpHiLBm/Nn/gc=";
      };
    };
  });
  meta = {
    description = "Plugin package for mujoco_ros2_control";
  };
})
