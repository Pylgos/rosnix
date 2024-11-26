{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  diagnostic-msgs,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rcl-interfaces,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2,
  tf2-ros,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "sick_scan_xd";
  version = "3.5.0-1";
  src = finalAttrs.passthru.sources."sick_scan_xd";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ diagnostic-msgs diagnostic-updater geometry-msgs nav-msgs rcl-interfaces rosidl-default-runtime sensor-msgs std-msgs tf2 tf2-ros visualization-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "sick_scan_xd" = substituteSource {
        src = fetchgit {
          name = "sick_scan_xd-source";
          url = "https://github.com/ros2-gbp/sick_scan_xd-release.git";
          rev = "57b8181c28f123fc94e5d534130a66a291638dd1";
          hash = "sha256-OpGqhZHuRFU+3mBBBUkZLbQQntgFz5VerY96kBS4O7U=";
        };
      };
    });
  };
  meta = {
    description = "ROS 1 and 2 driver for SICK scanner";
  };
})
