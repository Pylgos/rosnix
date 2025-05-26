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
  version = "0.6.0-1";
  src = finalAttrs.passthru.sources."imu_transformer";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ message-filters rclcpp rclcpp-components sensor-msgs tf2-ros tf2-sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ message-filters rclcpp rclcpp-components sensor-msgs tf2-ros tf2-sensor-msgs ];
  checkInputs = [ geometry-msgs tf2-geometry-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "imu_transformer" = substituteSource {
      src = fetchgit {
        name = "imu_transformer-source";
        url = "https://github.com/ros2-gbp/imu_pipeline-release.git";
        rev = "f5c8cd7861061c6542f5478f84efd6ed5c1107f5";
        hash = "sha256-H3rDOYmhj0NvEjWAU1CPNQRrnWq1lwC0K02sy+AT3Fk=";
      };
    };
  });
  meta = {
    description = "Node/components to transform sensor_msgs::Imu data from one frame into another.";
  };
})
