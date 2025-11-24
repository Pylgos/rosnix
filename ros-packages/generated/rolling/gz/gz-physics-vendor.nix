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
  version = "0.4.2-1";
  src = finalAttrs.passthru.sources."gz_physics_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor gz-common-vendor gz-dartsim-vendor gz-math-vendor gz-plugin-vendor gz-utils-vendor sdformat-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "benchmark" "bullet" "eigen" "gz-physics" ]; };
  buildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ gz-cmake-vendor gz-common-vendor gz-dartsim-vendor gz-math-vendor gz-plugin-vendor gz-utils-vendor sdformat-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "benchmark" "bullet" "eigen" "gz-physics" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "gz_physics_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_physics_vendor-source";
        url = "https://github.com/ros2-gbp/gz_physics_vendor-release.git";
        rev = "38b8c72b038338c61c2f63add703f45d62089c0b";
        hash = "sha256-YtTZxI1amSy42uCv1WIHS/SQXjXbpxAzcQIcSKVv198=";
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
        rev = "d362e9627a35cac538895e2a50c47ac25808ce2e";
        hash = "sha256-q+R+SgaN27G+nXXBCEADXDzYXOHNsnKULJCwvRiSZPg=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package for: gz-physics 9.0.0\n\n    Gazebo Physics : Physics classes and functions for robot applications\n  ";
  };
})
