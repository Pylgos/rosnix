{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ess_imu_driver2";
  version = "2.0.3-1";
  src = finalAttrs.passthru.sources."ess_imu_driver2";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ess_imu_driver2" = substituteSource {
      src = fetchgit {
        name = "ess_imu_driver2-source";
        url = "https://github.com/ros2-gbp/ess_imu_driver2-release.git";
        rev = "5cae0d71330689da0a42025737bb24fb5b94bd02";
        hash = "sha256-sl95nraOLRrr+xOM42NPP/JCS8bEFgJyvZeOtL+cW7Y=";
      };
    };
  });
  meta = {
    description = "ROS2 package for Epson IMU using C++ wrapper around Linux C driver";
  };
})
