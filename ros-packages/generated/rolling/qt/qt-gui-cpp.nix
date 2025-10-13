{
  ament-cmake,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  python-qt-binding,
  qt-gui,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "qt_gui_cpp";
  version = "2.10.2-1";
  src = finalAttrs.passthru.sources."qt_gui_cpp";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ pluginlib python-qt-binding qt-gui ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" "qt5-qmake" "qtbase5-dev" "tinyxml2" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pluginlib python-qt-binding qt-gui ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" "qt5-qmake" "qtbase5-dev" "tinyxml2" ]; };
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "qt_gui_cpp" = substituteSource {
      src = fetchgit {
        name = "qt_gui_cpp-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "2d42512d7d8ec673bd04613c5626da991b3a6998";
        hash = "sha256-oWHA2TqSVyBxkFzjxyuGS1X5MTTcb65I4HylnnyDxhY=";
      };
    };
  });
  meta = {
    description = "\n    qt_gui_cpp provides the foundation for C++-bindings for qt_gui and creates bindings for every generator available.\n    At least one specific binding must be available in order to use C++-plugins.\n  ";
  };
})
