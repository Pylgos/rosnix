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
  version = "2.15.4-1";
  src = finalAttrs.passthru.sources."rmw_implementation";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rmw-implementation-cmake ];
  propagatedBuildInputs = [ ament-index-cpp rcpputils rcutils rmw rmw-connextdds rmw-cyclonedds-cpp rmw-fastrtps-cpp rmw-fastrtps-dynamic-cpp rmw-gurumdds-cpp rmw-zenoh-cpp ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common performance-test-fixture ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_implementation" = substituteSource {
      src = fetchgit {
        name = "rmw_implementation-source";
        url = "https://github.com/ros2-gbp/rmw_implementation-release.git";
        rev = "6f1ebf546fa5846c54e347c11e66920d0dd0510d";
        hash = "sha256-nLsBl+2Qs88ZgCkaFsvFKOCntvdhAVRhDCDvF41a7TI=";
      };
    };
  });
  meta = {
    description = "Proxy implementation of the ROS 2 Middleware Interface.";
  };
})
