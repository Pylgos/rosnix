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
  rmw-implementation-cmake,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmw_implementation";
  version = "3.0.5-1";
  src = finalAttrs.passthru.sources."rmw_implementation";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp rcpputils rcutils rmw rmw-connextdds rmw-cyclonedds-cpp rmw-fastrtps-cpp rmw-fastrtps-dynamic-cpp rmw-implementation-cmake ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp rcpputils rcutils rmw rmw-connextdds rmw-cyclonedds-cpp rmw-fastrtps-cpp rmw-fastrtps-dynamic-cpp rmw-implementation-cmake ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common performance-test-fixture ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_implementation" = substituteSource {
      src = fetchgit {
        name = "rmw_implementation-source";
        url = "https://github.com/ros2-gbp/rmw_implementation-release.git";
        rev = "8709814e435e050bbb844b912620456d1fc30a0d";
        hash = "sha256-8oDE7CEMTGPS8oTFS36MSp6TkWui1hJQllNeR1nqqws=";
      };
    };
  });
  meta = {
    description = "Proxy implementation of the ROS 2 Middleware Interface.";
  };
})
