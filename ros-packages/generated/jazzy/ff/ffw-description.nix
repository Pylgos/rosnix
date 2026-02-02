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
  version = "1.1.16-1";
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
        rev = "e2a313a033eb4fe15469cc3e8f25c6fe497b444c";
        hash = "sha256-ERhIAKjWdcSL4NXYeZVlvU+J14JMdFlBeOnxYGgIAUE=";
      };
    };
  });
  meta = {
    description = "\n    3D models of the FFW for simulation and visualization\n  ";
  };
})
