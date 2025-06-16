{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-target-dependencies,
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
  version = "4.7.0-1";
  src = finalAttrs.passthru.sources."microstrain_inertial_driver";
  nativeBuildInputs = [ rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = [ ament-cmake ament-cmake-target-dependencies diagnostic-aggregator diagnostic-updater geometry-msgs lifecycle-msgs microstrain-inertial-msgs nav-msgs nmea-msgs rclcpp-lifecycle ros-environment rosidl-default-runtime rtcm-msgs sensor-msgs std-msgs std-srvs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "geographiclib" ]; };
  buildInputs = [ rosidl-default-generators ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "git" ]; };
  propagatedBuildInputs = [ ament-cmake ament-cmake-target-dependencies diagnostic-aggregator diagnostic-updater geometry-msgs lifecycle-msgs microstrain-inertial-msgs nav-msgs nmea-msgs rclcpp-lifecycle ros-environment rosidl-default-runtime rtcm-msgs sensor-msgs std-msgs std-srvs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "geographiclib" ]; };
  checkInputs = [ ament-cmake-gtest ament-cpplint ];
  passthru.sources = mkSourceSet (sources: {
    "microstrain_inertial_driver" = substituteSource {
      src = fetchgit {
        name = "microstrain_inertial_driver-source";
        url = "https://github.com/ros2-gbp/microstrain_inertial-release.git";
        rev = "cd076fe357be21580ebe2d6a2c8d9b75618befe2";
        hash = "sha256-IgR0CsSrVU4guKcHxcCpeRnGGveJYyZNGsjK2IsZWqc=";
      };
    };
  });
  meta = {
    description = "The ros_mscl package provides a driver for the LORD/Microstrain inertial products.";
  };
})
