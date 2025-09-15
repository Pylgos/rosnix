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
  mkSourceSet,
  rosSystemPackages,
  spdlog-vendor,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gz_utils_vendor";
  version = "0.4.0-2";
  src = finalAttrs.passthru.sources."gz_utils_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor spdlog-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cli11" "gz-utils" ]; };
  buildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ gz-cmake-vendor spdlog-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cli11" "gz-utils" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "gz_utils_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_utils_vendor-source";
        url = "https://github.com/ros2-gbp/gz_utils_vendor-release.git";
        rev = "ab1743628c7a202f1a327f6d3eca1b039c9dbcd3";
        hash = "sha256-EN/nmfwBgQCwKui/z3HqFy5qP3GKaHKJKWPfU839sNE=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${sources."gz_utils_vendor/gz-utils"}";
        }
      ];
    };
    "gz_utils_vendor/gz-utils" = substituteSource {
      src = fetchgit {
        name = "gz-utils-source";
        url = "https://github.com/gazebosim/gz-utils.git";
        rev = "5c075daab7bddd42615c8aa8df5f57a45e643c15";
        hash = "sha256-UZh4d+WngOWFJepHGD3JLWtf1hz8yWJ5EaQ/1iXlZc0=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package for: gz-utils 4.0.0\n\n    Gazebo Utils : Classes and functions for robot applications\n  ";
  };
})
