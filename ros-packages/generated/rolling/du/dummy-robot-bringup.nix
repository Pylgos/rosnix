{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  dummy-map-server,
  dummy-sensors,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-ros,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dummy_robot_bringup";
  version = "0.37.0-1";
  src = finalAttrs.passthru.sources."dummy_robot_bringup";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-python dummy-map-server dummy-sensors launch launch-ros robot-state-publisher ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "dummy_robot_bringup" = substituteSource {
      src = fetchgit {
        name = "dummy_robot_bringup-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "a4b0fa81dc6a64ef4138b2fcddd55369fc6e4611";
        hash = "sha256-su4JyBGTqLA9Sbix3h03x4wk1AaIu5A22YQp/ur244Q=";
      };
    };
  });
  meta = {
    description = "dummy robot bringup";
  };
})
