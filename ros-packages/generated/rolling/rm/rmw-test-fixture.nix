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
  rmw,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmw_test_fixture";
  version = "0.15.7-2";
  src = finalAttrs.passthru.sources."rmw_test_fixture";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros-core ];
  propagatedNativeBuildInputs = [ rmw ];
  buildInputs = [ ament-cmake ament-cmake-ros-core ];
  propagatedBuildInputs = [ rmw ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_test_fixture" = substituteSource {
      src = fetchgit {
        name = "rmw_test_fixture-source";
        url = "https://github.com/ros2-gbp/ament_cmake_ros-release.git";
        rev = "e54df978855f8f9066d15718553871764ae1465c";
        hash = "sha256-2TrbMxNYkJZ8ubHvLhyFYnFJbzCryp0ZgLjUBOOdKvQ=";
      };
    };
  });
  meta = {
    description = "Plugin interface for tools for isolating ROS communication at the RMW layer";
  };
})
