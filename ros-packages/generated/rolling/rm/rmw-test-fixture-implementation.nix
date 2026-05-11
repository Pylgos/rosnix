{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
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
  rosSystemPackages,
  rpyutils,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmw_test_fixture_implementation";
  version = "0.16.0-1";
  src = finalAttrs.passthru.sources."rmw_test_fixture_implementation";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros-core ];
  propagatedNativeBuildInputs = [ rcpputils rcutils rmw rmw-implementation rmw-implementation-cmake rmw-test-fixture rpyutils ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-ros-core ];
  propagatedBuildInputs = [ rcpputils rcutils rmw rmw-implementation rmw-implementation-cmake rmw-test-fixture rpyutils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_test_fixture_implementation" = substituteSource {
      src = fetchgit {
        name = "rmw_test_fixture_implementation-source";
        url = "https://github.com/ros2-gbp/ament_cmake_ros-release.git";
        rev = "f5a80f8462a3e915f315ec56f98e0269786de5cd";
        hash = "sha256-mUW49R7QDVu+LlTwn+Fz7MHAYXwTdeJ+xa8Fkwbgbu8=";
      };
    };
  });
  meta = {
    description = "Tools for isolating ROS environments at the RMW layer";
  };
})
