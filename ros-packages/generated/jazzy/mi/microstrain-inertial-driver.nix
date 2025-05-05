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
  version = "4.6.1-1";
  src = finalAttrs.passthru.sources."microstrain_inertial_driver";
  nativeBuildInputs = [ rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = [ diagnostic-aggregator diagnostic-updater geometry-msgs lifecycle-msgs microstrain-inertial-msgs nav-msgs nmea-msgs rclcpp-lifecycle ros-environment rosidl-default-runtime rtcm-msgs sensor-msgs std-msgs std-srvs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "curl" "eigen" "geographiclib" "jq" ]; };
  buildInputs = [ rosidl-default-generators ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "git" ]; };
  propagatedBuildInputs = [ diagnostic-aggregator diagnostic-updater geometry-msgs lifecycle-msgs microstrain-inertial-msgs nav-msgs nmea-msgs rclcpp-lifecycle ros-environment rosidl-default-runtime rtcm-msgs sensor-msgs std-msgs std-srvs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "curl" "eigen" "geographiclib" "jq" ]; };
  checkInputs = [ ament-cmake-gtest ament-cpplint ];
  passthru.sources = mkSourceSet (sources: {
    "microstrain_inertial_driver" = substituteSource {
      src = fetchgit {
        name = "microstrain_inertial_driver-source";
        url = "https://github.com/ros2-gbp/microstrain_inertial-release.git";
        rev = "40aab0fee2f77d5f4d1d23514949827bd2fc6bf2";
        hash = "sha256-FYq0ThGCrBJVKbzAx7DcHVaAIJ/b8dEIs57lbTiVb9k=";
      };
    };
  });
  meta = {
    description = "The ros_mscl package provides a driver for the LORD/Microstrain inertial products.";
  };
})
