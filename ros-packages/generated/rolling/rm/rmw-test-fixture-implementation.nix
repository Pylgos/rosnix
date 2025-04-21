{
  ament-cmake,
  ament-cmake-ros-core,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcpputils,
  rcutils,
  rmw,
  rmw-implementation,
  rmw-implementation-cmake,
  rmw-test-fixture,
  rmw-zenoh-cpp,
  rosSystemPackages,
  rpyutils,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmw_test_fixture_implementation";
  version = "0.14.3-1";
  src = finalAttrs.passthru.sources."rmw_test_fixture_implementation";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros-core ];
  propagatedNativeBuildInputs = [ rcpputils rmw-implementation rmw-implementation-cmake rmw-test-fixture rpyutils ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-ros-core ];
  propagatedBuildInputs = [ rcpputils rmw-implementation rmw-implementation-cmake rmw-test-fixture rpyutils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-dev" ]; };
  depsTargetTargetPropagated = [ rcutils rmw rmw-zenoh-cpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_test_fixture_implementation" = substituteSource {
      src = fetchgit {
        name = "rmw_test_fixture_implementation-source";
        url = "https://github.com/ros2-gbp/ament_cmake_ros-release.git";
        rev = "8cbc0ce228e5cddf30b325077ede0f93b43aaeae";
        hash = "sha256-XitKrajl80OLoUKpnTVcFNXH6XG3Ifm+HaEX946+qIU=";
      };
    };
  });
  meta = {
    description = "Tools for isolating ROS environments at the RMW layer";
  };
})
