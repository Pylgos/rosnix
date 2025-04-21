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
  version = "2.7.3-1";
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
        rev = "71c7c1b36027f413c958e706924beda2fe966792";
        hash = "sha256-nqDTtXMc5hjs1zNxrgpNgJQCq3kfsX0uNhkUbEizB38=";
      };
    };
  });
  meta = {
    description = "The ability to add Google Benchmark tests in the ament buildsystem in CMake.";
  };
})
