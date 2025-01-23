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
  version = "2.7.2-2";
  src = finalAttrs.passthru.sources."ament_cmake_google_benchmark";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-export-dependencies ament-cmake-python ];
  propagatedNativeBuildInputs = [ ament-cmake-test ];
  buildInputs = [ ament-cmake-core ament-cmake-export-dependencies ament-cmake-python ];
  propagatedBuildInputs = [ ament-cmake-test ];
  depsTargetTargetPropagated = [ google-benchmark-vendor ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_google_benchmark" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_google_benchmark-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "72fd6e00bc2d947b91fc6dbd1bc4493139bef2c7";
        hash = "sha256-gLW3M6Ozo1+gwvQ4oLKh/e30/U1TlAEVy95r6N1/pno=";
      };
    };
  });
  meta = {
    description = "The ability to add Google Benchmark tests in the ament buildsystem in CMake.";
  };
})
