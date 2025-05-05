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
  version = "0.5.1-1";
  src = finalAttrs.passthru.sources."imu_transformer";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ];
  propagatedBuildInputs = [ message-filters rclcpp-components sensor-msgs tf2-ros tf2-sensor-msgs ];
  checkInputs = [ geometry-msgs tf2-geometry-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "imu_transformer" = substituteSource {
      src = fetchgit {
        name = "imu_transformer-source";
        url = "https://github.com/ros2-gbp/imu_pipeline-release.git";
        rev = "cf1bad6b1f2c292bc278d6ce87a201ac2bae71c7";
        hash = "sha256-ZYeYSxM5GmmK7wtqGJS7jyVNaPMJnGPwEa12oEf/GxM=";
      };
    };
  });
  meta = {
    description = "Node/components to transform sensor_msgs::Imu data from one frame into another.";
  };
})
