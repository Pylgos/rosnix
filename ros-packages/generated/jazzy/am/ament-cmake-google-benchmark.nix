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
  version = "2.5.4-1";
  src = finalAttrs.passthru.sources."ament_cmake_google_benchmark";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-export-dependencies ament-cmake-python ];
  propagatedNativeBuildInputs = [ ament-cmake-test google-benchmark-vendor ];
  buildInputs = [ ament-cmake-core ament-cmake-export-dependencies ament-cmake-python ];
  propagatedBuildInputs = [ ament-cmake-test google-benchmark-vendor ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_google_benchmark" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_google_benchmark-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "9d0d31a50e9e759166a32b14e912018048c8f3e8";
        hash = "sha256-oiozHQwsKTzqaXQ3EqGXeyTuEnEc1owsXIAMHeww9yI=";
      };
    };
  });
  meta = {
    description = "The ability to add Google Benchmark tests in the ament buildsystem in CMake.";
  };
})
