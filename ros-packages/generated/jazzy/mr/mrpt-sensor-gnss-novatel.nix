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
  pname = "mrpt_sensor_gnss_novatel";
  version = "0.2.3-1";
  src = finalAttrs.passthru.sources."mrpt_sensor_gnss_novatel";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-lint-auto ament-lint-common ros-environment ];
  propagatedBuildInputs = [ cv-bridge geometry-msgs mrpt-libhwdrivers mrpt-libros-bridge mrpt-msgs mrpt-sensorlib nav-msgs rclcpp rclcpp-components sensor-msgs std-msgs stereo-msgs tf2 tf2-ros ];
  passthru = {
    sources = mkSourceSet (sources: {
      "mrpt_sensor_gnss_novatel" = substituteSource {
        src = fetchgit {
          name = "mrpt_sensor_gnss_novatel-source";
          url = "https://github.com/ros2-gbp/mrpt_sensors-release.git";
          rev = "fa2122329ce5274533fcb681a454d0fc459e5673";
          hash = "sha256-a+Dr6zLT/8aT1Es2/Z+1frdq7qfMXe/ogHp5XRpXhgg=";
        };
      };
    });
  };
  meta = {
    description = "ROS node for GNSS/IMU Novatel receivers with RTK precision using an NTRIP HTTP source (based on mrpt-hwdrivers)";
  };
})
