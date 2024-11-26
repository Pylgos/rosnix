{
  ament-cmake,
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
  version = "0.5.0-2";
  src = finalAttrs.passthru.sources."imu_transformer";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ message-filters rclcpp rclcpp-components sensor-msgs tf2-ros tf2-sensor-msgs ];
  checkInputs = [ geometry-msgs tf2-geometry-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "imu_transformer" = substituteSource {
      src = fetchgit {
        name = "imu_transformer-source";
        url = "https://github.com/ros2-gbp/imu_pipeline-release.git";
        rev = "0c04705f881a8a4221d5bbe5ff182578662f09df";
        hash = "sha256-lcQiOtqXK/0Dj9s+hSjZPSC6ypDEmOUVpRrIqNzO+Qw=";
      };
    };
  });
  meta = {
    description = "Node/components to transform sensor_msgs::Imu data from one frame into another.";
  };
})
