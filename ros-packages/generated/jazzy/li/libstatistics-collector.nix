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
  version = "1.7.3-1";
  src = finalAttrs.passthru.sources."libstatistics_collector";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ builtin-interfaces rcl rcpputils rmw statistics-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common performance-test-fixture rcutils rosidl-default-generators rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "libstatistics_collector" = substituteSource {
      src = fetchgit {
        name = "libstatistics_collector-source";
        url = "https://github.com/ros2-gbp/libstatistics_collector-release.git";
        rev = "19d619f753118a3cae6e41d2f9974d9a37fea539";
        hash = "sha256-cvI6rweNMAPnISrPDjCi0dRMq6O79AA7JWqrBt01vEA=";
      };
    };
  });
  meta = {
    description = "Lightweight aggregation utilities to collect statistics and measure message metrics.";
  };
})
