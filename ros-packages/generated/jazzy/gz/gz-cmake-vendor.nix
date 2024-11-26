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
  version = "0.0.8-1";
  src = finalAttrs.passthru.sources."gz_cmake_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "gz-cmake3" ]; };
  buildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "gz-cmake3" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "gz_cmake_vendor" = substituteSource {
        src = fetchgit {
          name = "gz_cmake_vendor-source";
          url = "https://github.com/ros2-gbp/gz_cmake_vendor-release.git";
          rev = "f20c7fd5e142e2fabd75b12ae3576fd7c6a1bc7d";
          hash = "sha256-mh1shfa2X3rE8xoqZP26ifszBx1NDE+RqsWMx6QZjj0=";
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
          rev = "ddd38ff196640024d6e054ff59cf5fea1ef01d73";
          hash = "sha256-fnN3Fmp7F5W0JixJUEp2v/OnXzmRidS5ujmSYxIRWto=";
        };
      };
    });
  };
  meta = {
    description = "Vendor package for: gz-cmake3 3.5.3 Gazebo CMake : CMake Modules for Gazebo Projects";
  };
})
