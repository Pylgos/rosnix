{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  performance-test-fixture,
  rcpputils,
  rcutils,
  rmw,
  rmw-implementation-cmake,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmw_implementation";
  version = "3.1.3-1";
  src = finalAttrs.passthru.sources."rmw_implementation";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp rcpputils rcutils rmw rmw-implementation-cmake ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp rcpputils rcutils rmw rmw-implementation-cmake ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common performance-test-fixture ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_implementation" = substituteSource {
      src = fetchgit {
        name = "rmw_implementation-source";
        url = "https://github.com/ros2-gbp/rmw_implementation-release.git";
        rev = "96e5412623ef6eca663b30ed6dd65aba81ff470a";
        hash = "sha256-FOHN1BmsCMTnqFDf3oBT3Nc4SuHSO49xj8Tq8vP62A0=";
      };
    };
  });
  meta = {
    description = "Proxy implementation of the ROS 2 Middleware Interface.";
  };
})
