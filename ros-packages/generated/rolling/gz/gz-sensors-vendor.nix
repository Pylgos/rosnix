{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-cmake-vendor-package,
  ament-cmake-xmllint,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-cmake-vendor,
  gz-common-vendor,
  gz-math-vendor,
  gz-msgs-vendor,
  gz-rendering-vendor,
  gz-tools-vendor,
  gz-transport-vendor,
  mkSourceSet,
  rosSystemPackages,
  sdformat-vendor,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gz_sensors_vendor";
  version = "0.3.2-1";
  src = finalAttrs.passthru.sources."gz_sensors_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor gz-common-vendor gz-math-vendor gz-msgs-vendor gz-rendering-vendor gz-tools-vendor gz-transport-vendor sdformat-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "gz-sensors" ]; };
  buildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ gz-cmake-vendor gz-common-vendor gz-math-vendor gz-msgs-vendor gz-rendering-vendor gz-tools-vendor gz-transport-vendor sdformat-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gz-sensors" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "xvfb" ]; };
  passthru.sources = mkSourceSet (sources: {
    "gz_sensors_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_sensors_vendor-source";
        url = "https://github.com/ros2-gbp/gz_sensors_vendor-release.git";
        rev = "2f2ccd96418a777f3eb25ad297a29f48862e8201";
        hash = "sha256-CqEYJA+l4d7Nid2arn2Xb09C9gh7Tvx03ZuQmWv9znY=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${sources."gz_sensors_vendor/gz-sensors"}";
        }
      ];
    };
    "gz_sensors_vendor/gz-sensors" = substituteSource {
      src = fetchgit {
        name = "gz-sensors-source";
        url = "https://github.com/gazebosim/gz-sensors.git";
        rev = "3b9b02090d2aec1159069067044364ba198d59b3";
        hash = "sha256-EsDGEUUko/Bqxc2RpYy5e0tsN8P1t+TntXyvgVhP3vg=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package for: gz-sensors 10.0.1\n\n    Gazebo Sensors : Sensor models for simulation\n  ";
  };
})
