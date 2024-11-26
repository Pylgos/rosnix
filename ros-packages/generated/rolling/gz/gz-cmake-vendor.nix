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
  version = "0.2.1-1";
  src = finalAttrs.passthru.sources."gz_cmake_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "gz-cmake4" ]; };
  buildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "gz-cmake4" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "gz_cmake_vendor" = substituteSource {
        src = fetchgit {
          name = "gz_cmake_vendor-source";
          url = "https://github.com/ros2-gbp/gz_cmake_vendor-release.git";
          rev = "46e4ed7cab736fd57e68e12aa31c46cfece68356";
          hash = "sha256-3LOsOvMbjd+vBxT6PINb6nGBIb4FjOlIFSW5buTsd3U=";
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
          rev = "eb1c510e6278935eb742ed92c6a6d1388439f8bd";
          hash = "sha256-GyVDbJM3qdFSdp+Kw8z1vB6ipOkB0+4TYWLV+FhIsj4=";
        };
      };
    });
  };
  meta = {
    description = "Vendor package for: gz-cmake4 4.1.0 Gazebo CMake : CMake Modules for Gazebo Projects";
  };
})
