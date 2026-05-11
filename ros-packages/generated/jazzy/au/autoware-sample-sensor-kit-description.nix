{
  ament-cmake-auto,
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
  pname = "autoware_sample_sensor_kit_description";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_sample_sensor_kit_description";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ velodyne-description xacro ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ velodyne-description xacro ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_sample_sensor_kit_description" = substituteSource {
      src = fetchgit {
        name = "autoware_sample_sensor_kit_description-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "a001936ab2de22119d90d6c471f04554610174fd";
        hash = "sha256-KVuyyaya4cSW7AD5p0vSXjIKWRsYhp9ZpqBfYxf2AnA=";
      };
    };
  });
  meta = {
    description = "The autoware_sample_sensor_kit_description package";
  };
})
