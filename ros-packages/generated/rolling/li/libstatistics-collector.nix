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
  version = "2.1.1-1";
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
        rev = "cc599f6c1b73a58734ce4a00d3a82281751d34de";
        hash = "sha256-lY8os4sw8aifvgmtpLKpR1do1JOTjRb+3XaeAZy+4eg=";
      };
    };
  });
  meta = {
    description = "Lightweight aggregation utilities to collect statistics and measure message metrics.";
  };
})
