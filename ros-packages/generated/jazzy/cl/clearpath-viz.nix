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
  version = "2.7.0-2";
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
        rev = "592b982c4ddebd19a43abbc7178eb55caf94133a";
        hash = "sha256-nlpdsADOSDqhiUzfPmqKW3XLa4cqfhUoeH589gcA57Y=";
      };
    };
  });
  meta = {
    description = "Visualization launchers for Clearpath Platforms.";
  };
})
