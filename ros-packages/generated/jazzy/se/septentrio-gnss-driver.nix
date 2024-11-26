{
  ament-cmake,
  buildAmentCmakePackage,
  diagnostic-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  gps-msgs,
  mkSourceSet,
  nav-msgs,
  nmea-msgs,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-eigen,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "septentrio_gnss_driver";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."septentrio_gnss_driver";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ diagnostic-msgs geometry-msgs gps-msgs nav-msgs nmea-msgs rclcpp rclcpp-components rosidl-default-runtime sensor-msgs tf2 tf2-eigen tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "geographiclib" "libpcap" ]; };
  passthru.sources = mkSourceSet (sources: {
    "septentrio_gnss_driver" = substituteSource {
      src = fetchgit {
        name = "septentrio_gnss_driver-source";
        url = "https://github.com/ros2-gbp/septentrio_gnss_driver_ros2-release.git";
        rev = "eb96ef59eedf47dc809ec590f844586bfdf67b21";
        hash = "sha256-0hF2yHegysVB6UW1kJ6htFYxwG5CX3O5uEtfuVT7LYg=";
      };
    };
  });
  meta = {
    description = "ROSaic: C++ driver for Septentrio's GNSS and INS receivers";
  };
})
