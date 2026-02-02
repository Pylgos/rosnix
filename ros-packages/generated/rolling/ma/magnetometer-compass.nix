{
  ament-cmake,
  ament-cmake-gen-version-h,
  ament-cmake-gtest,
  ament-cmake-ros,
  angles,
  buildAmentCmakePackage,
  builtin-interfaces,
  compass-conversions,
  compass-interfaces,
  cras-cpp-common,
  cras-lint,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  magnetometer-pipeline,
  message-filters,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
  tf2-sensor-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "magnetometer_compass";
  version = "3.0.2-1";
  src = finalAttrs.passthru.sources."magnetometer_compass";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ];
  propagatedNativeBuildInputs = [ angles compass-conversions compass-interfaces cras-cpp-common geometry-msgs magnetometer-pipeline message-filters pluginlib rclcpp rclcpp-components sensor-msgs std-msgs tf2 tf2-geometry-msgs tf2-ros tf2-sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake ament-cmake-gen-version-h ];
  propagatedBuildInputs = [ angles compass-conversions compass-interfaces cras-cpp-common geometry-msgs magnetometer-pipeline message-filters pluginlib rclcpp rclcpp-components sensor-msgs std-msgs tf2 tf2-geometry-msgs tf2-ros tf2-sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-ros builtin-interfaces cras-lint ];
  passthru.sources = mkSourceSet (sources: {
    "magnetometer_compass" = substituteSource {
      src = fetchgit {
        name = "magnetometer_compass-source";
        url = "https://github.com/ros2-gbp/compass-release.git";
        rev = "882cae5e94dd6c3a6ebc6b7a8a0d097fc10f2818";
        hash = "sha256-EymeKW57WyYkmXVJOYYaJ9xuxpSHojsm9jVCkKtPez8=";
      };
    };
  });
  meta = {
    description = "Compass based on a 3-axis magnetometer, attitude readings and possibly also GNSS.";
  };
})
