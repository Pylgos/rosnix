{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  performance-test-fixture,
  rcl,
  rcpputils,
  rcutils,
  rmw,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  statistics-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "libstatistics_collector";
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."libstatistics_collector";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ builtin-interfaces rcl rcpputils rmw statistics-msgs ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ builtin-interfaces rcl rcpputils rmw statistics-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common performance-test-fixture rcutils rosidl-default-generators rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "libstatistics_collector" = substituteSource {
      src = fetchgit {
        name = "libstatistics_collector-source";
        url = "https://github.com/ros2-gbp/libstatistics_collector-release.git";
        rev = "b12e2a891de4f23e26c254c77dcb27b22a13f33d";
        hash = "sha256-a7SokRItjwk/7hKuvB5eTdZc85a5VJUGe2664dDiSyM=";
      };
    };
  });
  meta = {
    description = "Lightweight aggregation utilities to collect statistics and measure message metrics.";
  };
})
