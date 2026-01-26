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
  version = "0.2.6-1";
  src = finalAttrs.passthru.sources."gz_math_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor gz-utils-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "gz-math8" "pybind11-dev" ]; };
  buildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ gz-cmake-vendor gz-utils-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "gz-math8" "pybind11-dev" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "gz_math_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_math_vendor-source";
        url = "https://github.com/ros2-gbp/gz_math_vendor-release.git";
        rev = "1030bba44ed9706e51d4977731074372fcb5b0e0";
        hash = "sha256-WDU1gKxW+rNp2M3mJuZ9rWSDxLyruYgEj+Bal13TDds=";
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
        rev = "5d34ccfafc9cd1ece7877a5acb8ce504d93054cf";
        hash = "sha256-/gwSCv2DVWjXdMexEzgpAV0ZPQjjQTiDEztoXixNX3Y=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package for: gz-math8 8.2.1\n\n    Gazebo Math : Math classes and functions for robot applications\n  ";
  };
})
