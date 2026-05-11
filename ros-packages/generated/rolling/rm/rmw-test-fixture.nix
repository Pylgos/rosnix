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
  version = "0.16.0-1";
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
        rev = "b57757494cd8584880dedfb1a35765801b63a8da";
        hash = "sha256-924agw/jRHVBed4i3tJW7QR3O8erel0r3BxYpyRkFBU=";
      };
    };
  });
  meta = {
    description = "Plugin interface for tools for isolating ROS communication at the RMW layer";
  };
})
