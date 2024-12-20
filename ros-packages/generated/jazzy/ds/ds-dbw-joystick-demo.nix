{
  ament-cmake,
  buildAmentCmakePackage,
  ds-dbw-can,
  ds-dbw-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  joy,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ds_dbw_joystick_demo";
  version = "2.3.1-1";
  src = finalAttrs.passthru.sources."ds_dbw_joystick_demo";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ds-dbw-can ds-dbw-msgs joy rclcpp rclcpp-components sensor-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "ds_dbw_joystick_demo" = substituteSource {
      src = fetchgit {
        name = "ds_dbw_joystick_demo-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "de792aef3f59d996d9114d2ae0eb9eb62e750ae9";
        hash = "sha256-rNJfOPWZs/+ZUF9j/OZ11ZD4rj3hKV1WubHL62KhtoA=";
      };
    };
  });
  meta = {
    description = "Demonstration of drive-by-wire with joystick";
  };
})
