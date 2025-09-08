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
  gz-dartsim-vendor,
  gz-math-vendor,
  gz-plugin-vendor,
  gz-utils-vendor,
  mkSourceSet,
  rosSystemPackages,
  sdformat-vendor,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gz_physics_vendor";
  version = "0.3.0-1";
  src = finalAttrs.passthru.sources."gz_physics_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor gz-common-vendor gz-dartsim-vendor gz-math-vendor gz-plugin-vendor gz-utils-vendor sdformat-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "benchmark" "bullet" "eigen" "gz-physics8" ]; };
  buildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ gz-cmake-vendor gz-common-vendor gz-dartsim-vendor gz-math-vendor gz-plugin-vendor gz-utils-vendor sdformat-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "benchmark" "bullet" "eigen" "gz-physics8" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "gz_physics_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_physics_vendor-source";
        url = "https://github.com/ros2-gbp/gz_physics_vendor-release.git";
        rev = "81aeea800ac43f14d04cedecd1db9729fc48e07b";
        hash = "sha256-MZxG483G5/pRTxc0BWZHw9h17raAAm7cjSEIp/F/4W8=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${sources."gz_physics_vendor/gz-physics"}";
        }
      ];
    };
    "gz_physics_vendor/gz-physics" = substituteSource {
      src = fetchgit {
        name = "gz-physics-source";
        url = "https://github.com/gazebosim/gz-physics.git";
        rev = "7fa86b6fe080e2771151a486eae7f9b33ba22dd2";
        hash = "sha256-U02OIZ59IMxxbZeC8bjqmFKmfWTzDTc7F4YO5gsJdYg=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package for: gz-physics8 8.3.0\n\n    Gazebo Physics : Physics classes and functions for robot applications\n  ";
  };
})
