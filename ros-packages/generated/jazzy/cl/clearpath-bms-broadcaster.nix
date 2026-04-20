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
  hardware-interface,
  hardware-interface-testing,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  ros2-control-cmake,
  ros2-control-test-assets,
  rosSystemPackages,
  rosidl-default-runtime,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_bms_broadcaster";
  version = "2.9.6-1";
  src = finalAttrs.passthru.sources."clearpath_bms_broadcaster";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ backward-ros controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-lifecycle ros2-control-cmake rosidl-default-runtime sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-lifecycle ros2-control-cmake rosidl-default-runtime sensor-msgs ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_bms_broadcaster" = substituteSource {
      src = fetchgit {
        name = "clearpath_bms_broadcaster-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "96844d9cddd973e68ec9009b9e15012498b6e4fa";
        hash = "sha256-rx5osPmE+LXcQPV0vrSktylx7eI8O9Xlo4KwRUZEPJg=";
      };
    };
  });
  meta = {
    description = "ros2_control battery state broadcaster controller";
  };
})
