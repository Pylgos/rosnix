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
  version = "5.2.0-1";
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
        rev = "362c0424a07ff884e464063b89afc88c2f8dc1f3";
        hash = "sha256-yJbGD3O8Hj4ctW7ZF3Fog43wcmOQ+G5GBDAxAe5Fr5s=";
      };
    };
  });
  meta = {
    description = "Broadcaster to publish cartesian states.";
  };
})
