{
  ament-cmake-gtest,
  ament-cpplint,
  buildAmentCmakePackage,
  diagnostic-aggregator,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  lifecycle-msgs,
  microstrain-inertial-msgs,
  mkSourceSet,
  nav-msgs,
  nmea-msgs,
  rclcpp-lifecycle,
  ros-environment,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  rtcm-msgs,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "microstrain_inertial_driver";
  version = "4.6.0-1";
  src = finalAttrs.passthru.sources."microstrain_inertial_driver";
  nativeBuildInputs = [ rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = [ ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "curl" ]; };
  propagatedBuildInputs = [ diagnostic-aggregator diagnostic-updater geometry-msgs lifecycle-msgs microstrain-inertial-msgs nav-msgs nmea-msgs rclcpp-lifecycle rosidl-default-runtime rtcm-msgs sensor-msgs std-msgs std-srvs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "geographiclib" "jq" ]; };
  checkInputs = [ ament-cmake-gtest ament-cpplint ];
  passthru.sources = mkSourceSet (sources: {
    "microstrain_inertial_driver" = substituteSource {
      src = fetchgit {
        name = "microstrain_inertial_driver-source";
        url = "https://github.com/ros2-gbp/microstrain_inertial-release.git";
        rev = "58bcb547ed1f9d296587361f22ebbbd132e373bd";
        hash = "sha256-CIHPuMN3AhNh4GlxG3GYM0bu79WGc0r+ipJ1xrt+osM=";
      };
    };
  });
  meta = {
    description = "The ros_mscl package provides a driver for the LORD/Microstrain inertial products.";
  };
})
