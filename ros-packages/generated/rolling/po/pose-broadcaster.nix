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
  ros2-control-test-assets,
  rosSystemPackages,
  substituteSource,
  tf2-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pose_broadcaster";
  version = "4.20.0-1";
  src = finalAttrs.passthru.sources."pose_broadcaster";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros controller-interface generate-parameter-library geometry-msgs pluginlib rclcpp rclcpp-lifecycle realtime-tools tf2-msgs ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "pose_broadcaster" = substituteSource {
      src = fetchgit {
        name = "pose_broadcaster-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "f0d15a7204577c0919a9ca4813d15326162301c8";
        hash = "sha256-9FkzE45xH7J1rzUpYGY4IXatRJ42JHRUvIvlqTxbA+I=";
      };
    };
  });
  meta = {
    description = "Broadcaster to publish cartesian states.";
  };
})
