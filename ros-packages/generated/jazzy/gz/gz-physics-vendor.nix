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
  version = "0.0.6-1";
  src = finalAttrs.passthru.sources."gz_physics_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor ];
  propagatedBuildInputs = [ gz-common-vendor gz-dartsim-vendor gz-math-vendor gz-plugin-vendor gz-utils-vendor sdformat-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "benchmark" "bullet" "eigen" "gz-physics7" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "gz_physics_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_physics_vendor-source";
        url = "https://github.com/ros2-gbp/gz_physics_vendor-release.git";
        rev = "06308a2358fbc1af7ddefb1bccc0a7183ada198e";
        hash = "sha256-0De+B+qVThqQuFjXKBsmaPQKJ0+WiJ4awQfr05Qqzjg=";
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
        rev = "966563e1a403e90bf9a9cbf642dd0f58809f4a36";
        hash = "sha256-75myTqDeEybvj5rsJxRambLPle1cen6HIatZGbVoXro=";
      };
    };
  });
  meta = {
    description = "Vendor package for: gz-physics7 7.5.0 Gazebo Physics : Physics classes and functions for robot applications";
  };
})
