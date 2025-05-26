{
  ament-cmake,
  ament-cmake-cpplint,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "imu_processors";
  version = "0.6.0-1";
  src = finalAttrs.passthru.sources."imu_processors";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs nav-msgs rclcpp rclcpp-components sensor-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs rclcpp rclcpp-components sensor-msgs tf2-ros ];
  checkInputs = [ ament-cmake-cpplint ];
  passthru.sources = mkSourceSet (sources: {
    "imu_processors" = substituteSource {
      src = fetchgit {
        name = "imu_processors-source";
        url = "https://github.com/ros2-gbp/imu_pipeline-release.git";
        rev = "7957246e846cc38456a43b29d5fd4202e4d353ad";
        hash = "sha256-ostbDvthj76bEQ7wkhla2OqT36rf90mapxwhnsm2C3I=";
      };
    };
  });
  meta = {
    description = "Processors for sensor_msgs::Imu data";
  };
})
