{
  ament-cmake-auto,
  autoware-sample-sensor-kit-description,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  velodyne-description,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_awsim_sensor_kit_description";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_awsim_sensor_kit_description";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ autoware-sample-sensor-kit-description velodyne-description xacro ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ autoware-sample-sensor-kit-description velodyne-description xacro ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_awsim_sensor_kit_description" = substituteSource {
      src = fetchgit {
        name = "autoware_awsim_sensor_kit_description-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "42966bbf6682f761e98ec5260c68827614bffc69";
        hash = "sha256-Fdu00zqRs015zKbIx93Oq8eTLUsVRJz8bdOTWIEqddA=";
      };
    };
  });
  meta = {
    description = "The autoware_awsim_sensor_kit_description package";
  };
})
