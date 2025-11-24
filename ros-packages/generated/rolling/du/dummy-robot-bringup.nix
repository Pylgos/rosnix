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
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dummy_robot_bringup";
  version = "0.37.4-1";
  src = finalAttrs.passthru.sources."dummy_robot_bringup";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-python dummy-map-server dummy-sensors launch launch-ros robot-state-publisher rviz2 ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-python dummy-map-server dummy-sensors launch launch-ros robot-state-publisher rviz2 ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "dummy_robot_bringup" = substituteSource {
      src = fetchgit {
        name = "dummy_robot_bringup-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "ccc1f0e5a49e9a471eca67d1c0094bd2921fbba8";
        hash = "sha256-aaJrORQu87Ky76DBzUbAoqshCt9RaBLufGV0C6fSvNo=";
      };
    };
  });
  meta = {
    description = "\n    dummy robot bringup\n  ";
  };
})
