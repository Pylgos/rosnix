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
  version = "0.15.0-1";
  src = finalAttrs.passthru.sources."rmw_test_fixture_implementation";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros-core ];
  propagatedNativeBuildInputs = [ rcpputils rcutils rmw rmw-implementation rmw-implementation-cmake rmw-test-fixture rmw-zenoh-cpp rpyutils ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-ros-core ];
  propagatedBuildInputs = [ rcpputils rcutils rmw rmw-implementation rmw-implementation-cmake rmw-test-fixture rmw-zenoh-cpp rpyutils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_test_fixture_implementation" = substituteSource {
      src = fetchgit {
        name = "rmw_test_fixture_implementation-source";
        url = "https://github.com/ros2-gbp/ament_cmake_ros-release.git";
        rev = "babc461d424bc952cc09443bb321dcdccdd51921";
        hash = "sha256-ULy0pXbNXCv085hOOwv1G6hECLJuUtajwJ3d05p3S30=";
      };
    };
  });
  meta = {
    description = "Tools for isolating ROS environments at the RMW layer";
  };
})
