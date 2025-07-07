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
  version = "0.15.1-1";
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
        rev = "966f843277320d5c5afe07dac1b12c3030eea28b";
        hash = "sha256-VJP+CbYwO6y1AhvpI98D7c5nB1nNOxujHA7RczDteIw=";
      };
    };
  });
  meta = {
    description = "Plugin interface for tools for isolating ROS communication at the RMW layer";
  };
})
