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
let
  sources = mkSourceSet (sources: {
    "gz_sensors_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_sensors_vendor-source";
        url = "https://github.com/ros2-gbp/gz_sensors_vendor-release.git";
        rev = "085d65b284ef6a7536ff40f18e64e298e56f0ec0";
        hash = "sha256-lIlYTD+b6EjuknN8kJlsw7yW6ti8Nu+XTiF1pyKE5EU=";
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
        rev = "410a999f1e0e91bdcf81c6aff70fa3e95e369757";
        hash = "sha256-j/8kS+Bvaim2gtsZcp+/u8CAE+N24/5qZhciFR0Q8+M=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "gz_sensors_vendor";
  version = "0.0.4-1";
  src = finalAttrs.passthru.sources."gz_sensors_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gz-common-vendor gz-math-vendor gz-msgs-vendor gz-rendering-vendor gz-tools-vendor gz-transport-vendor sdformat-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gz-sensors8" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "xvfb" ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Vendor package for: gz-sensors8 8.2.0 Gazebo Sensors : Sensor models for simulation";
  };
})
