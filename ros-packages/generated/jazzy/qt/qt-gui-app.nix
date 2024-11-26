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
  version = "2.7.4-2";
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
          rev = "3930bb62257a42688018d6f9c6e445fc670f1946";
          hash = "sha256-OU68D6ke+OYEcT00UuAmVxqOKUeC5NEf4XwD7qMKLMI=";
        };
      };
    });
  };
  meta = {
    description = "qt_gui_app provides the main to start an instance of the integrated graphical user interface provided by qt_gui.";
  };
})
