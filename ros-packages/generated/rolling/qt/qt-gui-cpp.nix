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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "qt_gui_cpp";
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."qt_gui_cpp";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ pluginlib python-qt-binding qt-gui ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libqtwidgets" "pkg-config" "qt-base-dev" "tinyxml2" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pluginlib python-qt-binding qt-gui ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqtwidgets" "pkg-config" "qt-base-dev" "tinyxml2" ]; };
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "qt_gui_cpp" = substituteSource {
      src = fetchgit {
        name = "qt_gui_cpp-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "e343843e797acf84a71a28d4d7888fc9cacb5a48";
        hash = "sha256-TMqn2VA6z38zAQkjsns86vgult8wpY9vCURMkYWf7zA=";
      };
    };
  });
  meta = {
    description = "\n    qt_gui_cpp provides the foundation for C++-bindings for qt_gui and creates bindings for every generator available.\n    At least one specific binding must be available in order to use C++-plugins.\n  ";
  };
})
