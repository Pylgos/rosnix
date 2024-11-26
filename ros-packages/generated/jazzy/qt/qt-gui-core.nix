{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "qt_gui_core";
  version = "2.7.4-2";
  src = finalAttrs.passthru.sources."qt_gui_core";
  nativeBuildInputs = [ ament-cmake ];
  passthru = {
    sources = mkSourceSet (sources: {
      "qt_gui_core" = substituteSource {
        src = fetchgit {
          name = "qt_gui_core-source";
          url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
          rev = "0d3d2456d64c9eae29bdacfb5c196129db530563";
          hash = "sha256-MY4qrGTr1ir5q/XdggeSBKaCGFXruCU/sFvoT1MNtQc=";
        };
      };
    });
  };
  meta = {
    description = "Integration of the ROS package system and ROS-specific plugins for a Qt-based GUI.";
  };
})
