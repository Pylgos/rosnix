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
  version = "0.5.1-1";
  src = finalAttrs.passthru.sources."imu_processors";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs rclcpp rclcpp-components sensor-msgs tf2-ros ];
  checkInputs = [ ament-cmake-cpplint ];
  passthru.sources = mkSourceSet (sources: {
    "imu_processors" = substituteSource {
      src = fetchgit {
        name = "imu_processors-source";
        url = "https://github.com/ros2-gbp/imu_pipeline-release.git";
        rev = "4ac0bccd63f6a97ba4c83f001b94564efbf62296";
        hash = "sha256-nR+qfTKb/LRKfxhLxvif+LfnxgSg03zUtC+XvrCCrEY=";
      };
    };
  });
  meta = {
    description = "Processors for sensor_msgs::Imu data";
  };
})
