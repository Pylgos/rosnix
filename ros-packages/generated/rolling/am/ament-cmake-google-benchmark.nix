{
  ament-cmake-core,
  ament-cmake-export-dependencies,
  ament-cmake-python,
  ament-cmake-test,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  google-benchmark-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_google_benchmark";
  version = "2.7.2-1";
  src = finalAttrs.passthru.sources."ament_cmake_google_benchmark";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-export-dependencies ament-cmake-python ];
  propagatedNativeBuildInputs = [ ament-cmake-test google-benchmark-vendor ];
  buildInputs = [ ament-cmake-core ament-cmake-export-dependencies ament-cmake-python ];
  propagatedBuildInputs = [ ament-cmake-test google-benchmark-vendor ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ament_cmake_google_benchmark" = substituteSource {
        src = fetchgit {
          name = "ament_cmake_google_benchmark-source";
          url = "https://github.com/ros2-gbp/ament_cmake-release.git";
          rev = "b3ff51ca59819d85241b8f6fcbe0ed0dc10c0787";
          hash = "sha256-gLW3M6Ozo1+gwvQ4oLKh/e30/U1TlAEVy95r6N1/pno=";
        };
      };
    });
  };
  meta = {
    description = "The ability to add Google Benchmark tests in the ament buildsystem in CMake.";
  };
})
