{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  mrpt-libhwdrivers,
  mrpt-libros-bridge,
  mrpt-msgs,
  mrpt-sensorlib,
  nav-msgs,
  nmea-msgs,
  rclcpp,
  rclcpp-components,
  ros-environment,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  stereo-msgs,
  substituteSource,
  tf2,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mrpt_sensor_gnss_nmea";
  version = "0.2.3-1";
  src = finalAttrs.passthru.sources."mrpt_sensor_gnss_nmea";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-lint-auto ament-lint-common rclcpp ros-environment ];
  propagatedBuildInputs = [ cv-bridge geometry-msgs mrpt-libhwdrivers mrpt-libros-bridge mrpt-msgs mrpt-sensorlib nav-msgs nmea-msgs rclcpp-components sensor-msgs std-msgs stereo-msgs tf2 tf2-ros ];
  passthru.sources = mkSourceSet (sources: {
    "mrpt_sensor_gnss_nmea" = substituteSource {
      src = fetchgit {
        name = "mrpt_sensor_gnss_nmea-source";
        url = "https://github.com/ros2-gbp/mrpt_sensors-release.git";
        rev = "170d5682248d72aa34bf624c2ca7e2f53d39d387";
        hash = "sha256-AZcZeGwHOjz/3QOqQ7+B9U1A1MQLQZJfbvs+EwbBJWw=";
      };
    };
  });
  meta = {
    description = "ROS node for GNSS receivers generating NMEA messages (based on mrpt-hwdrivers)";
  };
})
