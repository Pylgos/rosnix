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
  version = "4.8.0-1";
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
        rev = "a6ca1c1c990a9b910fbf88ef2f04b3f1746b1132";
        hash = "sha256-Fi3/glh9npsjJqdLj8bi8532sDvjVJw9EW0SkVWAUTw=";
      };
    };
  });
  meta = {
    description = "Simple examples using the microstrain_inertial_driver for MicroStrain sensors.";
  };
})
