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
  version = "2.9.0-1";
  src = finalAttrs.passthru.sources."qt_gui_cpp";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ pluginlib python-qt-binding qt-gui tinyxml2-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qt5-qmake" "qtbase5-dev" ]; };
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "qt_gui_cpp" = substituteSource {
      src = fetchgit {
        name = "qt_gui_cpp-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "d26686fb79ea7010edb6f76740fe70b4462d72f2";
        hash = "sha256-o3vYmlglovQBtgByoL9MZB6zV1Y3QmbyVulIWOgevrI=";
      };
    };
  });
  meta = {
    description = "qt_gui_cpp provides the foundation for C++-bindings for qt_gui and creates bindings for every generator available. At least one specific binding must be available in order to use C++-plugins.";
  };
})
