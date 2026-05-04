{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  microstrain-inertial-driver,
  mkSourceSet,
  rosSystemPackages,
  rviz-imu-plugin,
  rviz2,
  sensor-msgs,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "microstrain_inertial_examples";
  version = "4.8.0-2";
  src = finalAttrs.passthru.sources."microstrain_inertial_examples";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ microstrain-inertial-driver rviz2 rviz-imu-plugin sensor-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ microstrain-inertial-driver rviz2 rviz-imu-plugin sensor-msgs tf2-ros ];
  passthru.sources = mkSourceSet (sources: {
    "microstrain_inertial_examples" = substituteSource {
      src = fetchgit {
        name = "microstrain_inertial_examples-source";
        url = "https://github.com/ros2-gbp/microstrain_inertial-release.git";
        rev = "1765586a799caee0fb1f23feef33774af6edacb6";
        hash = "sha256-Fi3/glh9npsjJqdLj8bi8532sDvjVJw9EW0SkVWAUTw=";
      };
    };
  });
  meta = {
    description = "Simple examples using the microstrain_inertial_driver for MicroStrain sensors.";
  };
})
