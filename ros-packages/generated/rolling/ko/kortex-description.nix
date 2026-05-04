{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-ros2-control,
  joint-state-publisher,
  joint-state-publisher-gui,
  joint-trajectory-controller,
  mkSourceSet,
  parallel-gripper-controller,
  picknik-reset-fault-controller,
  picknik-twist-controller,
  robot-state-publisher,
  robotiq-description,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kortex_description";
  version = "0.2.5-2";
  src = finalAttrs.passthru.sources."kortex_description";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ gz-ros2-control joint-state-publisher joint-state-publisher-gui joint-trajectory-controller parallel-gripper-controller picknik-reset-fault-controller picknik-twist-controller robot-state-publisher robotiq-description rviz2 ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ gz-ros2-control joint-state-publisher joint-state-publisher-gui joint-trajectory-controller parallel-gripper-controller picknik-reset-fault-controller picknik-twist-controller robot-state-publisher robotiq-description rviz2 ];
  passthru.sources = mkSourceSet (sources: {
    "kortex_description" = substituteSource {
      src = fetchgit {
        name = "kortex_description-source";
        url = "https://github.com/ros2-gbp/ros2_kortex-release.git";
        rev = "d8d88aa8f79ba2329959c16cfced8fe52d7c7e05";
        hash = "sha256-M5p/cqXdIqrr0rviEuWPQclA7h7KvIZm7IRhNr0mhN4=";
      };
    };
  });
  meta = {
    description = "\n    ";
  };
})
