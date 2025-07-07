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
  version = "2.3.5-1";
  src = finalAttrs.passthru.sources."ds_dbw_joystick_demo";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ds-dbw-can ds-dbw-msgs joy rclcpp rclcpp-components sensor-msgs std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ds-dbw-can ds-dbw-msgs joy rclcpp rclcpp-components sensor-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "ds_dbw_joystick_demo" = substituteSource {
      src = fetchgit {
        name = "ds_dbw_joystick_demo-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "12ab2ae7b4a1d98358030ad35d97783d4e1e5b7a";
        hash = "sha256-8WWrJAgc5FXe3nTHbKJPEeNJbXhpL0yNJ9SOu88JvNk=";
      };
    };
  });
  meta = {
    description = "\n    Demonstration of drive-by-wire with joystick\n  ";
  };
})
