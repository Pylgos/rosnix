{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  qt-dotgraph,
  qt-gui,
  qt-gui-app,
  qt-gui-cpp,
  qt-gui-py-common,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "qt_gui_core";
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."qt_gui_core";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ qt-dotgraph qt-gui qt-gui-app qt-gui-cpp qt-gui-py-common ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ qt-dotgraph qt-gui qt-gui-app qt-gui-cpp qt-gui-py-common ];
  passthru.sources = mkSourceSet (sources: {
    "qt_gui_core" = substituteSource {
      src = fetchgit {
        name = "qt_gui_core-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "ecf2f10379104909534b92ec3250d0269cb82a46";
        hash = "sha256-m+pNB2fo4cVGHsUAzuvGAtijhI+oK4S+a05jvW+G+pE=";
      };
    };
  });
  meta = {
    description = "\n    Integration of the ROS package system and ROS-specific plugins for a Qt-based GUI.\n  ";
  };
})
