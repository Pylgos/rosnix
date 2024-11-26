{
  ament-cmake,
  ament-cmake-gen-version-h,
  ament-cmake-gmock,
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
  ros2-control-test-assets,
  rosSystemPackages,
  sdformat-urdf,
  substituteSource,
  tinyxml2-vendor,
  urdf,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "hardware_interface";
  version = "4.20.0-1";
  src = finalAttrs.passthru.sources."hardware_interface";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ];
  propagatedBuildInputs = [ control-msgs joint-limits lifecycle-msgs pluginlib rclcpp-lifecycle rcpputils rcutils sdformat-urdf tinyxml2-vendor urdf ];
  checkInputs = [ ament-cmake-gmock ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "hardware_interface" = substituteSource {
      src = fetchgit {
        name = "hardware_interface-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "0eb609ced155b8750dc989142dc415e7d0050dff";
        hash = "sha256-PbPnSn7CwR+QK1lHirSwjTQqV9k5kbzrN6blm54I4S8=";
      };
    };
  });
  meta = {
    description = "ros2_control hardware interface";
  };
})
