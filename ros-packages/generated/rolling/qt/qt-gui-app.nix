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
  qt-gui,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "qt_gui_app";
  version = "2.10.1-1";
  src = finalAttrs.passthru.sources."qt_gui_app";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-python qt-gui ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-python qt-gui ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "qt_gui_app" = substituteSource {
      src = fetchgit {
        name = "qt_gui_app-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "3c19277ee1f0c32e6a1d0315a89f1074c334ddbf";
        hash = "sha256-oKIo+/GYy5+1tBuFAUOIU7/ZouE2wD32nNJ4cp5YWnY=";
      };
    };
  });
  meta = {
    description = "\n    qt_gui_app provides the main to start an instance of the integrated graphical user interface provided by qt_gui.\n  ";
  };
})
