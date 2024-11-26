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
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmw_implementation";
  version = "2.15.3-1";
  src = finalAttrs.passthru.sources."rmw_implementation";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rmw-implementation-cmake ];
  propagatedBuildInputs = [ ament-index-cpp rcpputils rcutils rmw rmw-connextdds rmw-cyclonedds-cpp rmw-fastrtps-cpp rmw-fastrtps-dynamic-cpp rmw-gurumdds-cpp ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common performance-test-fixture ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rmw_implementation" = substituteSource {
        src = fetchgit {
          name = "rmw_implementation-source";
          url = "https://github.com/ros2-gbp/rmw_implementation-release.git";
          rev = "6f7fca96237a7a41e888dc55ff8406876dd3cd1b";
          hash = "sha256-m0Kurk9EC6Yc7JrKHFGjSZ5eIanWr0QxoYkXWNLXQ2o=";
        };
      };
    });
  };
  meta = {
    description = "Proxy implementation of the ROS 2 Middleware Interface.";
  };
})
