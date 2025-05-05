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
  version = "3.6.0-1";
  src = finalAttrs.passthru.sources."sick_scan_xd";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ diagnostic-msgs diagnostic-updater geometry-msgs nav-msgs rcl-interfaces rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs tf2 tf2-ros visualization-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ diagnostic-msgs diagnostic-updater geometry-msgs nav-msgs rcl-interfaces rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs tf2 tf2-ros visualization-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "sick_scan_xd" = substituteSource {
      src = fetchgit {
        name = "sick_scan_xd-source";
        url = "https://github.com/ros2-gbp/sick_scan_xd-release.git";
        rev = "9290df801c548da006c3540783b1b06b4804140b";
        hash = "sha256-D4FtnQ6Mrapxk5u+2qI9oUBjQIUomc6DmPWQSOsL6Ts=";
      };
    };
  });
  meta = {
    description = "ROS 1 and 2 driver for SICK scanner";
  };
})
