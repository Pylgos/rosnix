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
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "python_qt_binding";
  version = "2.5.4-2";
  src = finalAttrs.passthru.sources."python_qt_binding";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dev" "python3-qt-bindings" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-dev" "python3-qt-bindings" ]; };
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "python_qt_binding" = substituteSource {
      src = fetchgit {
        name = "python_qt_binding-source";
        url = "https://github.com/ros2-gbp/python_qt_binding-release.git";
        rev = "976c34ff39ef778a6d8976ccb2b54128e7e106dd";
        hash = "sha256-C8TtbDGUdhy+NcvhUHNqvVjeiouRXCFE2noIfwoIwFE=";
      };
    };
  });
  meta = {
    description = "\n    This stack provides Python bindings for Qt.\n    There are two providers: pyside and pyqt.  PySide2 is available under\n    the GPL, LGPL and a commercial license.  PyQt is released under the GPL.\n\n    Both the bindings and tools to build bindings are included from each\n    available provider.  For PySide, it is called \"Shiboken\".  For PyQt,\n    this is called \"SIP\".\n\n    Also provided is adapter code to make the user's Python code\n    independent of which binding provider was actually used which makes\n    it very easy to switch between these.\n  ";
  };
})
