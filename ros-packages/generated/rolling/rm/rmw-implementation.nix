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
  version = "3.2.0-1";
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
        rev = "5ab239165e9334b832870f33343f7379b1d6a3a9";
        hash = "sha256-pIRdP3lbvAo9bmw2gkfydywm70YMiDRGF3JT0P98jUo=";
      };
    };
  });
  meta = {
    description = "Proxy implementation of the ROS 2 Middleware Interface.";
  };
})
