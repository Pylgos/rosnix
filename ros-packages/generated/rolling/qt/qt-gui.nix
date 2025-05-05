{
  ament-cmake,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-qt-binding,
  rosSystemPackages,
  substituteSource,
  tango-icons-vendor,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "qt_gui";
  version = "2.10.0-1";
  src = finalAttrs.passthru.sources."qt_gui";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-python python-qt-binding tango-icons-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-catkin-pkg-modules" "python3-qt5-bindings" "qt5-qmake" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-python python-qt-binding tango-icons-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-catkin-pkg-modules" "python3-qt5-bindings" "qt5-qmake" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "qt_gui" = substituteSource {
      src = fetchgit {
        name = "qt_gui-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "d0a1e676079702bba293f618d05d9a4a0c596273";
        hash = "sha256-W8BkNWiuDhuWMxwpsei3/1WcREogfjx5o0f6aUELR7I=";
      };
    };
  });
  meta = {
    description = "\n    qt_gui provides the infrastructure for an integrated graphical user interface based on Qt.\n    It is extensible with Python- and C++-based plugins (implemented in separate packages) which can contribute arbitrary widgets.\n    It requires either PyQt or PySide bindings.\n  ";
  };
})
