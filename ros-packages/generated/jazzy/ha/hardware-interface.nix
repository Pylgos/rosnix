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
  pal-statistics,
  pluginlib,
  rclcpp-lifecycle,
  rcpputils,
  rcutils,
  realtime-tools,
  ros2-control-cmake,
  ros2-control-test-assets,
  rosSystemPackages,
  sdformat-urdf,
  substituteSource,
  tinyxml2-vendor,
  urdf,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "hardware_interface";
  version = "4.34.0-1";
  src = finalAttrs.passthru.sources."hardware_interface";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ];
  propagatedNativeBuildInputs = [ backward-ros control-msgs joint-limits lifecycle-msgs pal-statistics pluginlib rclcpp-lifecycle rcpputils rcutils realtime-tools ros2-control-cmake sdformat-urdf tinyxml2-vendor urdf ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" ]; };
  buildInputs = [ ament-cmake ament-cmake-gen-version-h ];
  propagatedBuildInputs = [ backward-ros control-msgs joint-limits lifecycle-msgs pal-statistics pluginlib rclcpp-lifecycle rcpputils rcutils realtime-tools ros2-control-cmake sdformat-urdf tinyxml2-vendor urdf ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" ]; };
  checkInputs = [ ament-cmake-gmock ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "hardware_interface" = substituteSource {
      src = fetchgit {
        name = "hardware_interface-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "4fba46a18dcb543852ea815c3602279b9740e6ac";
        hash = "sha256-//kIxuK/Ydyh5heFS6AM+Of/58ppjfSc1TrVB9JQFEY=";
      };
    };
  });
  meta = {
    description = "Base classes for hardware abstraction and tooling for them";
  };
})
