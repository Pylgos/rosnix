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
  version = "2.8.3-1";
  src = finalAttrs.passthru.sources."qt_gui";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-catkin-pkg-modules" ]; };
  propagatedBuildInputs = [ ament-index-python python-qt-binding tango-icons-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-qt5-bindings" "qt5-qmake" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "qt_gui" = substituteSource {
      src = fetchgit {
        name = "qt_gui-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "daa4ab39b176fa1cd3f74d0bf9af5c90562cee4e";
        hash = "sha256-dDBzB5E8AKbMRg1VA5EojsOrd19x4iTGvnbdI/8be6c=";
      };
    };
  });
  meta = {
    description = "qt_gui provides the infrastructure for an integrated graphical user interface based on Qt. It is extensible with Python- and C++-based plugins (implemented in separate packages) which can contribute arbitrary widgets. It requires either PyQt or PySide bindings.";
  };
})
