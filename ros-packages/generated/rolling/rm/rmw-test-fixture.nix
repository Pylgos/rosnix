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
  version = "0.15.0-1";
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
        rev = "ff6cab1cc33a6fde5b926bb4b770ad4291ce4dde";
        hash = "sha256-4ln0IFT1/TO9rkmo0W1L5VnWNw+EvPddspk1FUIyCQ0=";
      };
    };
  });
  meta = {
    description = "Plugin interface for tools for isolating ROS communication at the RMW layer";
  };
})
