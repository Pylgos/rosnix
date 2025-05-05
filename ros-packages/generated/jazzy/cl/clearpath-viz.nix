{
  ament-cmake,
  buildAmentCmakePackage,
  clearpath-platform-description,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher-gui,
  mkSourceSet,
  rosSystemPackages,
  rqt-robot-monitor,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_viz";
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."clearpath_viz";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ clearpath-platform-description joint-state-publisher-gui rqt-robot-monitor rviz2 ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ clearpath-platform-description joint-state-publisher-gui rqt-robot-monitor rviz2 ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_viz" = substituteSource {
      src = fetchgit {
        name = "clearpath_viz-source";
        url = "https://github.com/clearpath-gbp/clearpath_desktop-release.git";
        rev = "8a0809f6093a60fe4dfb9071e60702c73423d362";
        hash = "sha256-x+SxmiFqWoKPtwEGr1avAMoM9Ajb57in3KkaSLkMJvE=";
      };
    };
  });
  meta = {
    description = "Visualization launchers for Clearpath Platforms.";
  };
})
