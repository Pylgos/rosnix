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
  version = "0.14.3-1";
  src = finalAttrs.passthru.sources."rmw_test_fixture";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros-core ];
  buildInputs = [ ament-cmake ament-cmake-ros-core ];
  depsTargetTargetPropagated = [ rmw ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_test_fixture" = substituteSource {
      src = fetchgit {
        name = "rmw_test_fixture-source";
        url = "https://github.com/ros2-gbp/ament_cmake_ros-release.git";
        rev = "ab81a2df1f085f0874d9d8035215774b4a06d4f3";
        hash = "sha256-ZAoOfqa46BVyLOhhtLWSNvT/XM0IxuAlCAFIYgxlHy0=";
      };
    };
  });
  meta = {
    description = "Plugin interface for tools for isolating ROS communication at the RMW layer";
  };
})
