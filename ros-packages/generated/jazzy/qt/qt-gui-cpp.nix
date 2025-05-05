{
  ament-cmake,
  ament-cmake-pytest,
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
  version = "2.7.5-1";
  src = finalAttrs.passthru.sources."qt_gui_cpp";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ pluginlib python-qt-binding qt-gui tinyxml2-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" "qt5-qmake" "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pluginlib python-qt-binding qt-gui tinyxml2-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" "qt5-qmake" "qtbase5-dev" ]; };
  checkInputs = [ ament-cmake-pytest ];
  passthru.sources = mkSourceSet (sources: {
    "qt_gui_cpp" = substituteSource {
      src = fetchgit {
        name = "qt_gui_cpp-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "efe0933cb37f50b5302567c4f32fdd4eeb122aa6";
        hash = "sha256-AUsso8ASTrjPl3/sfOWB8JphEgCwUnGqGs5hyaYbnmU=";
      };
    };
  });
  meta = {
    description = "\n    qt_gui_cpp provides the foundation for C++-bindings for qt_gui and creates bindings for every generator available.\n    At least one specific binding must be available in order to use C++-plugins.\n  ";
  };
})
