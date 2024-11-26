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
  pname = "mrpt_sensor_imu_taobotics";
  version = "0.2.3-1";
  src = finalAttrs.passthru.sources."mrpt_sensor_imu_taobotics";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-lint-auto ament-lint-common ros-environment ];
  propagatedBuildInputs = [ cv-bridge geometry-msgs mrpt-libhwdrivers mrpt-libros-bridge mrpt-msgs mrpt-sensorlib nav-msgs rclcpp rclcpp-components sensor-msgs std-msgs stereo-msgs tf2 tf2-ros ];
  passthru = {
    sources = mkSourceSet (sources: {
      "mrpt_sensor_imu_taobotics" = substituteSource {
        src = fetchgit {
          name = "mrpt_sensor_imu_taobotics-source";
          url = "https://github.com/ros2-gbp/mrpt_sensors-release.git";
          rev = "2e8f5f720340576209ed4abe820edd84d5eebaea";
          hash = "sha256-i/VI6NybgOTVnmZO3RoHSnA7Gbjea8iGtqnuJ2+MjmQ=";
        };
      };
    });
  };
  meta = {
    description = "ROS node for Taobotics USB IMUs (based on mrpt-hwdrivers)";
  };
})
