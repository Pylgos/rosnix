{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher,
  joint-state-publisher-gui,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  rviz2,
  substituteSource,
  urdf,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ffw_description";
  version = "1.1.5-1";
  src = finalAttrs.passthru.sources."ffw_description";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ joint-state-publisher joint-state-publisher-gui robot-state-publisher rviz2 urdf xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joint-state-publisher joint-state-publisher-gui robot-state-publisher rviz2 urdf xacro ];
  passthru.sources = mkSourceSet (sources: {
    "ffw_description" = substituteSource {
      src = fetchgit {
        name = "ffw_description-source";
        url = "https://github.com/ros2-gbp/ai_worker-release.git";
        rev = "c1fb34f2de19d674ba6f04274dbfcba89351c356";
        hash = "sha256-U6w9fJCgOizGQeHEG6BpP51pbOsf2Iml+JaFc9MGpoc=";
      };
    };
  });
  meta = {
    description = "\n    3D models of the FFW for simulation and visualization\n  ";
  };
})
