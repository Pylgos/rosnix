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
  rmw-connextdds,
  rmw-cyclonedds-cpp,
  rmw-desert,
  rmw-fastrtps-cpp,
  rmw-fastrtps-dynamic-cpp,
  rmw-gurumdds-cpp,
  rmw-implementation-cmake,
  rmw-zenoh-cpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmw_implementation";
  version = "3.0.4-1";
  src = finalAttrs.passthru.sources."rmw_implementation";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp rcpputils rmw-implementation-cmake ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp rcpputils rmw-implementation-cmake ];
  depsTargetTargetPropagated = [ rcutils rmw rmw-connextdds rmw-cyclonedds-cpp rmw-desert rmw-fastrtps-cpp rmw-fastrtps-dynamic-cpp rmw-gurumdds-cpp rmw-zenoh-cpp ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common performance-test-fixture ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_implementation" = substituteSource {
      src = fetchgit {
        name = "rmw_implementation-source";
        url = "https://github.com/ros2-gbp/rmw_implementation-release.git";
        rev = "10b9d35aead5ddf5076172f3245bdf0789f658d5";
        hash = "sha256-Npi9nim5WxtGOXAZEBHv871KR4typ4H8hhENCXanx/g=";
      };
    };
  });
  meta = {
    description = "Proxy implementation of the ROS 2 Middleware Interface.";
  };
})
