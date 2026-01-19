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
  version = "0.2.6-1";
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
        rev = "f7c42cd3a993551240770c29560e831d03580a80";
        hash = "sha256-/mzECt9cFPZ84fYL0oo6STY9OfPqmQysQ65C/Z6NSKE=";
      };
    };
  });
  meta = {
    description = "\n    ";
  };
})
