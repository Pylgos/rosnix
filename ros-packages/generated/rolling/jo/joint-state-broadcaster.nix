{
  ament-cmake,
  ament-cmake-gmock,
  backward-ros,
  buildAmentCmakePackage,
  builtin-interfaces,
  control-msgs,
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
  rcutils,
  realtime-tools,
  ros2-control-cmake,
  ros2-control-test-assets,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  urdf,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "joint_state_broadcaster";
  version = "4.24.0-1";
  src = finalAttrs.passthru.sources."joint_state_broadcaster";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ generate-parameter-library rclcpp rclcpp-lifecycle ];
  propagatedBuildInputs = [ backward-ros builtin-interfaces control-msgs controller-interface pluginlib rcutils realtime-tools ros2-control-cmake sensor-msgs urdf ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "joint_state_broadcaster" = substituteSource {
      src = fetchgit {
        name = "joint_state_broadcaster-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "2f824d9bfec4d5565c62749f9f075ed182accf26";
        hash = "sha256-xzHvXdAXZbUTAa6YJkt7rH/15quezmK5VxE4/P0I+dc=";
      };
    };
  });
  meta = {
    description = "Broadcaster to publish joint state";
  };
})
