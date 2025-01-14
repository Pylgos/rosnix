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
  version = "4.19.0-1";
  src = finalAttrs.passthru.sources."pose_broadcaster";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros controller-interface generate-parameter-library geometry-msgs pluginlib rclcpp rclcpp-lifecycle realtime-tools tf2-msgs ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "pose_broadcaster" = substituteSource {
      src = fetchgit {
        name = "pose_broadcaster-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "1de15b3391e346e2692f2749fb66ba9e9f6656f3";
        hash = "sha256-mr8XwUjcqs5jfTR3zvs49UeSxfesA//y/d93KIUJsZk=";
      };
    };
  });
  meta = {
    description = "Broadcaster to publish cartesian states.";
  };
})
