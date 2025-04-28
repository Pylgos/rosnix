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
  version = "3.1.0-1";
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
        rev = "4126e1f0101e5f8645e9eba9f2ffb3e9e5a75bea";
        hash = "sha256-O9DHVy9fEI6+iNuMYWlgfLd+8W6QNrCibP+Q1LVW6/A=";
      };
    };
  });
  meta = {
    description = "Proxy implementation of the ROS 2 Middleware Interface.";
  };
})
