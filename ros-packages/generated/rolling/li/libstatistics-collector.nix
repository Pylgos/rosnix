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
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."libstatistics_collector";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ builtin-interfaces rcl rcpputils rmw statistics-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common performance-test-fixture rcutils rosidl-default-generators rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "libstatistics_collector" = substituteSource {
      src = fetchgit {
        name = "libstatistics_collector-source";
        url = "https://github.com/ros2-gbp/libstatistics_collector-release.git";
        rev = "94b7dd7e7505bd7c6516a4a78c1ac90aa46ee8ce";
        hash = "sha256-p7JRqvcZxMp4Asp+dQKmo5r6JA3yDcTtCzT4iViw61k=";
      };
    };
  });
  meta = {
    description = "Lightweight aggregation utilities to collect statistics and measure message metrics.";
  };
})
