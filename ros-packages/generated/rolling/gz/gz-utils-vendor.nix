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
  version = "0.2.1-1";
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
        rev = "b95028f8a7a5bde2b5e7610ab75dd4e80888fcc9";
        hash = "sha256-VUAuNlFUNWctJk03oykkRbs38D/9hCeeHnfsMTqhmAw=";
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
        rev = "5e1e78be9e4df46c4cfc97165a6447753d179cff";
        hash = "sha256-pbbFO/4h3Tos+uigPC8XHWzv+Yuyd6EdzLWQPdmXaN8=";
      };
    };
  });
  meta = {
    description = "Vendor package for: gz-utils3 3.1.0 Gazebo Utils : Classes and functions for robot applications";
  };
})
