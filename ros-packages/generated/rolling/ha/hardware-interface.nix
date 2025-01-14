{
  ament-cmake,
  ament-cmake-gen-version-h,
  ament-cmake-gmock,
  backward-ros,
  buildAmentCmakePackage,
  control-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-limits,
  lifecycle-msgs,
  mkSourceSet,
  pluginlib,
  rclcpp-lifecycle,
  rcpputils,
  rcutils,
  realtime-tools,
  ros2-control-test-assets,
  rosSystemPackages,
  sdformat-urdf,
  substituteSource,
  tinyxml2-vendor,
  urdf,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "hardware_interface";
  version = "4.24.0-1";
  src = finalAttrs.passthru.sources."hardware_interface";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ];
  propagatedBuildInputs = [ backward-ros control-msgs joint-limits lifecycle-msgs pluginlib rclcpp-lifecycle rcpputils rcutils realtime-tools sdformat-urdf tinyxml2-vendor urdf ];
  checkInputs = [ ament-cmake-gmock ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "hardware_interface" = substituteSource {
      src = fetchgit {
        name = "hardware_interface-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "bec28be346c80500c0802d22fe8abf34246a96ed";
        hash = "sha256-Z2NR2zERbDF2oTZrtoW24ISlBY8a3aLaQouR1X57WOQ=";
      };
    };
  });
  meta = {
    description = "ros2_control hardware interface";
  };
})
