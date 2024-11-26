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
  version = "2.8.3-1";
  src = finalAttrs.passthru.sources."qt_gui_app";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ ament-index-python qt-gui ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "qt_gui_app" = substituteSource {
        src = fetchgit {
          name = "qt_gui_app-source";
          url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
          rev = "0580a4ba839e42a0f583e15826c89e829cadfbc1";
          hash = "sha256-cZamnJ0l8IlwpXbF+tgSSck3qDyALVsL4zb67037anY=";
        };
      };
    });
  };
  meta = {
    description = "qt_gui_app provides the main to start an instance of the integrated graphical user interface provided by qt_gui.";
  };
})
