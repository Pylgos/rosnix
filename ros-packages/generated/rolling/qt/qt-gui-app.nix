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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "qt_gui_app";
  version = "2.10.5-1";
  src = finalAttrs.passthru.sources."qt_gui_app";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-python qt-gui ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-python qt-gui ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "qt_gui_app" = substituteSource {
      src = fetchgit {
        name = "qt_gui_app-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "7abd544b958272ddd40d566907e58a5bdf14dfba";
        hash = "sha256-Ag4A2xjRMYW6TNF1H/eu5CkYEajcxjjhLxjZa61EZN0=";
      };
    };
  });
  meta = {
    description = "\n    qt_gui_app provides the main to start an instance of the integrated graphical user interface provided by qt_gui.\n  ";
  };
})
