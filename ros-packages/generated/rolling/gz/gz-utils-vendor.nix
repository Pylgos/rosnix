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
  version = "0.2.2-1";
  src = finalAttrs.passthru.sources."gz_utils_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor ];
  propagatedBuildInputs = [ spdlog-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gz-utils3" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "gz_utils_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_utils_vendor-source";
        url = "https://github.com/ros2-gbp/gz_utils_vendor-release.git";
        rev = "f478a76d8f18aa2c8ae215b815611fa8b564de56";
        hash = "sha256-QEOAu8r9tNsrQnhQO9IDmE6GVSDTRw7r153sZcJOETc=";
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
        rev = "fd0a40c09be4fd7b2a40d877bb56d2fa1c7607e3";
        hash = "sha256-fYzysdB608jfMb/EbqiGD4hXmPxcaVTUrt9Wx0dBlto=";
      };
    };
  });
  meta = {
    description = "Vendor package for: gz-utils3 3.1.1 Gazebo Utils : Classes and functions for robot applications";
  };
})
