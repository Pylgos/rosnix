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
  gz-utils-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gz_math_vendor";
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."gz_math_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor gz-utils-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "gz-math" "pybind11-dev" ]; };
  buildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ gz-cmake-vendor gz-utils-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "gz-math" "pybind11-dev" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "gz_math_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_math_vendor-source";
        url = "https://github.com/ros2-gbp/gz_math_vendor-release.git";
        rev = "56748d1be7d4eb49793fdb79528f1923035fd3ad";
        hash = "sha256-305awNGcCAn7kxLCen5Fxon+Ij9hXZUtrLdd3JDIHgI=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${sources."gz_math_vendor/gz-math"}";
        }
      ];
    };
    "gz_math_vendor/gz-math" = substituteSource {
      src = fetchgit {
        name = "gz-math-source";
        url = "https://github.com/gazebosim/gz-math.git";
        rev = "8f6528e07d90b67daf1b44d087825dede1f52f03";
        hash = "sha256-n88sNgLcOvoxzZ5YnnErQ7l+iS2LJj7AXkw02OB5Ljk=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package for: gz-math 9.0.0\n\n    Gazebo Math : Math classes and functions for robot applications\n  ";
  };
})
