{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-cmake-vendor-package,
  ament-cmake-xmllint,
  buildRosPackage,
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
        rev = "b1df53423a413bc1bfe58f348d12198e3a4e25b0";
        hash = "sha256-Mye+bjAqaEK5YvHwmYhw8ZX2VThs5xxVMIHZ418w/no=";
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
        rev = "2f22722233b1839698744eeb2c5ad0f9809ce715";
        hash = "sha256-8Ato7/YRL7JebbVPASD6VF9lf/Uyq26MIg2l+jQ4GDk=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "gz_sensors_vendor";
  version = "0.2.0-1";
  src = sources."gz_sensors_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gz-common-vendor gz-math-vendor gz-msgs-vendor gz-rendering-vendor gz-tools-vendor gz-transport-vendor sdformat-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gz-sensors9" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "xvfb" ]; };
  meta = {
    description = "Vendor package for: gz-sensors9 9.0.0 Gazebo Sensors : Sensor models for simulation";
  };
}
