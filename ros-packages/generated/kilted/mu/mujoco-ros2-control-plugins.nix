{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mujoco-vendor,
  pluginlib,
  rclcpp,
  ros2-control-cmake,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mujoco_ros2_control_plugins";
  version = "0.0.2-1";
  src = finalAttrs.passthru.sources."mujoco_ros2_control_plugins";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ mujoco-vendor pluginlib rclcpp ros2-control-cmake std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ mujoco-vendor pluginlib rclcpp ros2-control-cmake std-msgs ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "mujoco_ros2_control_plugins" = substituteSource {
      src = fetchgit {
        name = "mujoco_ros2_control_plugins-source";
        url = "https://github.com/ros2-gbp/mujoco_ros2_control-release.git";
        rev = "7949821634c098ba7fc1538f443e98b6054c560e";
        hash = "sha256-HBAOd3BOf9T7kamanmhBXtrb6KHcdEg33l81Oh40u2Q=";
      };
    };
  });
  meta = {
    description = "Plugin package for mujoco_ros2_control";
  };
})
