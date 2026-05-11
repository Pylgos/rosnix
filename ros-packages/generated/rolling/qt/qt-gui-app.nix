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
  version = "3.0.0-1";
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
        rev = "50c3cbaff9e07b4cfd11dce19afa9b4db48249e4";
        hash = "sha256-NvSDqGeqCTEsEq0RhyDyG3VYZwx7nPaXyZ6InUNO6XE=";
      };
    };
  });
  meta = {
    description = "\n    qt_gui_app provides the main to start an instance of the integrated graphical user interface provided by qt_gui.\n  ";
  };
})
