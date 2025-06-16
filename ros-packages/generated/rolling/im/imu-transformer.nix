{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  message-filters,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2-geometry-msgs,
  tf2-ros,
  tf2-sensor-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "imu_transformer";
  version = "0.6.1-1";
  src = finalAttrs.passthru.sources."imu_transformer";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ message-filters rclcpp rclcpp-components sensor-msgs tf2-ros tf2-sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ message-filters rclcpp rclcpp-components sensor-msgs tf2-ros tf2-sensor-msgs ];
  checkInputs = [ ament-cmake-gtest geometry-msgs tf2-geometry-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "imu_transformer" = substituteSource {
      src = fetchgit {
        name = "imu_transformer-source";
        url = "https://github.com/ros2-gbp/imu_pipeline-release.git";
        rev = "fca04754e2985b6c28a16f05fd03c5644bd239ea";
        hash = "sha256-XZ9/IIjquFuN3HzDWn6ZTkIiKIzKz9HGVjjAbbiAblY=";
      };
    };
  });
  meta = {
    description = "Node/components to transform sensor_msgs::Imu data from one frame into another.";
  };
})
