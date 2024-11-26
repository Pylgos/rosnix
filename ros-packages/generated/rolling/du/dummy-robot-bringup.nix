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
  version = "0.35.1-1";
  src = finalAttrs.passthru.sources."dummy_robot_bringup";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-python dummy-map-server dummy-sensors launch launch-ros robot-state-publisher ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "dummy_robot_bringup" = substituteSource {
      src = fetchgit {
        name = "dummy_robot_bringup-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "6eace22064a7a57cbfaf879fd01c2c4b92ddf9a1";
        hash = "sha256-voUg4NonSVtDqhap/BOmygeH4ZR4hZlztXOCLWWlm2g=";
      };
    };
  });
  meta = {
    description = "dummy robot bringup";
  };
})
