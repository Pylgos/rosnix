{
  ament-cmake,
  ament-cmake-auto,
  ament-cmake-ros,
  buildAmentCmakePackage,
  diagnostic-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  gps-msgs,
  gtest-vendor,
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
  version = "1.4.4-1";
  src = finalAttrs.passthru.sources."septentrio_gnss_driver";
  nativeBuildInputs = [ ament-cmake ament-cmake-auto ];
  propagatedNativeBuildInputs = [ ament-cmake-ros diagnostic-msgs geometry-msgs gps-msgs gtest-vendor nav-msgs nmea-msgs rclcpp rclcpp-components rosidl-default-generators rosidl-default-runtime sensor-msgs tf2 tf2-eigen tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "geographiclib" "libpcap" ]; };
  buildInputs = [ ament-cmake ament-cmake-auto ];
  propagatedBuildInputs = [ ament-cmake-ros diagnostic-msgs geometry-msgs gps-msgs gtest-vendor nav-msgs nmea-msgs rclcpp rclcpp-components rosidl-default-generators rosidl-default-runtime sensor-msgs tf2 tf2-eigen tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "geographiclib" "libpcap" ]; };
  passthru.sources = mkSourceSet (sources: {
    "septentrio_gnss_driver" = substituteSource {
      src = fetchgit {
        name = "septentrio_gnss_driver-source";
        url = "https://github.com/ros2-gbp/septentrio_gnss_driver_ros2-release.git";
        rev = "99a1b2356f571fb7e1e811c55094e9896bf8d6c1";
        hash = "sha256-26WQwHazdYIoi6VtCtkoVHVBPhs7SenfHWcgj49wTcI=";
      };
    };
  });
  meta = {
    description = "ROSaic: C++ driver for Septentrio's GNSS and INS receivers";
  };
})
