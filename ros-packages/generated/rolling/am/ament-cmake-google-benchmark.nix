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
  version = "2.8.0-1";
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
        rev = "db41901e4121e622cf85f02cb5a46e1e82fbe935";
        hash = "sha256-VecDj8NLSFzuKCCN3UwdtC62C5dgZoBoCDznq1zU+EI=";
      };
    };
  });
  meta = {
    description = "The ability to add Google Benchmark tests in the ament buildsystem in CMake.";
  };
})
