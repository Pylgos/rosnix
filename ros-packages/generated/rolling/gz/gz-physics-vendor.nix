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
  version = "0.2.2-1";
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
        rev = "7188bfa5a9dbe53627bb512f34621ece61476890";
        hash = "sha256-k/aiOoZa8BCdK7Qg3iVyKbeEjAfWDWPJZFjmpkBScEI=";
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
        rev = "5946ee6bb7cfc586c4c0ee36521e6d8ff5591817";
        hash = "sha256-VJyle2xrsjnSyXjlw7s7dIIzC8NxfTJ2hsRc0R4gkCw=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package for: gz-physics8 8.2.0\n\n    Gazebo Physics : Physics classes and functions for robot applications\n  ";
  };
})
