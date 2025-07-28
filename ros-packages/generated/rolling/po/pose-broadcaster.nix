{
  ament-cmake,
  ament-cmake-gmock,
  backward-ros,
  buildAmentCmakePackage,
  controller-interface,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  geometry-msgs,
  hardware-interface-testing,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  realtime-tools,
  ros2-control-cmake,
  ros2-control-test-assets,
  rosSystemPackages,
  substituteSource,
  tf2-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pose_broadcaster";
  version = "5.4.0-1";
  src = finalAttrs.passthru.sources."pose_broadcaster";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ backward-ros controller-interface generate-parameter-library geometry-msgs pluginlib rclcpp rclcpp-lifecycle realtime-tools ros2-control-cmake tf2-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros controller-interface generate-parameter-library geometry-msgs pluginlib rclcpp rclcpp-lifecycle realtime-tools ros2-control-cmake tf2-msgs ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "pose_broadcaster" = substituteSource {
      src = fetchgit {
        name = "pose_broadcaster-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "af28c3d45033bf6ddf6721606d0242f283695da2";
        hash = "sha256-jwQ01DiNpj6hGUYrNCv+/m6VD8tUO2jG/sEViYPjQMw=";
      };
    };
  });
  meta = {
    description = "Broadcaster to publish cartesian states.";
  };
})
