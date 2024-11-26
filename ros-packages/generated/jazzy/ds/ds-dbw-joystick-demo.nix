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
  version = "2.2.3-1";
  src = finalAttrs.passthru.sources."ds_dbw_joystick_demo";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ds-dbw-can ds-dbw-msgs joy rclcpp rclcpp-components sensor-msgs std-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ds_dbw_joystick_demo" = substituteSource {
        src = fetchgit {
          name = "ds_dbw_joystick_demo-source";
          url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
          rev = "1370f4e78f22d6f40c0f5503cbc4dd06a4a22e36";
          hash = "sha256-x518bLawpFaIll5HiAel5vWnajhxXManDoIOZAN5fzg=";
        };
      };
    });
  };
  meta = {
    description = "Demonstration of drive-by-wire with joystick";
  };
})
