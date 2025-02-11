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
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gz_cmake_vendor";
  version = "0.0.9-1";
  src = finalAttrs.passthru.sources."gz_cmake_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" "pkg-config" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "gz-cmake3" ]; };
  buildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" "pkg-config" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "gz-cmake3" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  passthru.sources = mkSourceSet (sources: {
    "gz_cmake_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_cmake_vendor-source";
        url = "https://github.com/ros2-gbp/gz_cmake_vendor-release.git";
        rev = "1b1d85e6433fd9a728c0ac4a48958c03418c649e";
        hash = "sha256-D3cyPzGBiRVFeecc+01Qs1gbjGVzm905UsGH8ehuoYI=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${sources."gz_cmake_vendor/gz-cmake"}";
        }
      ];
    };
    "gz_cmake_vendor/gz-cmake" = substituteSource {
      src = fetchgit {
        name = "gz-cmake-source";
        url = "https://github.com/gazebosim/gz-cmake.git";
        rev = "4d88b0f45c7c387dbf728b8656e7ae7bc9c95a30";
        hash = "sha256-mP0bBPWWAoUFsUwKn95Eqv1lW3lJdPEu3hhfmiK3mNQ=";
      };
    };
  });
  meta = {
    description = "Vendor package for: gz-cmake3 3.5.4 Gazebo CMake : CMake Modules for Gazebo Projects";
  };
})
