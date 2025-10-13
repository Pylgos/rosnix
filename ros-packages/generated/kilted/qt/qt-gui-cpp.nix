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
  tinyxml2-vendor,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "qt_gui_cpp";
  version = "2.9.2-1";
  src = finalAttrs.passthru.sources."qt_gui_cpp";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ pluginlib python-qt-binding qt-gui tinyxml2-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" "qt5-qmake" "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pluginlib python-qt-binding qt-gui tinyxml2-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" "qt5-qmake" "qtbase5-dev" ]; };
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "qt_gui_cpp" = substituteSource {
      src = fetchgit {
        name = "qt_gui_cpp-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "4929b24ad8e48cd5223388156b4f076e8b29a612";
        hash = "sha256-BqoRYFrt/pFq8UQQ5cSRo23XmWilSxb3okVMNKCEo1g=";
      };
    };
  });
  meta = {
    description = "\n    qt_gui_cpp provides the foundation for C++-bindings for qt_gui and creates bindings for every generator available.\n    At least one specific binding must be available in order to use C++-plugins.\n  ";
  };
})
