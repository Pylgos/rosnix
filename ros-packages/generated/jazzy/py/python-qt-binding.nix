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
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "python_qt_binding";
  version = "2.2.1-1";
  src = finalAttrs.passthru.sources."python_qt_binding";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-qt5-bindings" "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-qt5-bindings" "qtbase5-dev" ]; };
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "python_qt_binding" = substituteSource {
      src = fetchgit {
        name = "python_qt_binding-source";
        url = "https://github.com/ros2-gbp/python_qt_binding-release.git";
        rev = "68ffe1fac31519713735be637c6c3280455dbc2a";
        hash = "sha256-6O8drSOVJ+eJfYkt/pqnGBJYqAulmgEjbElU4k8h68M=";
      };
    };
  });
  meta = {
    description = "\n    This stack provides Python bindings for Qt.\n    There are two providers: pyside and pyqt.  PySide2 is available under\n    the GPL, LGPL and a commercial license.  PyQt is released under the GPL.\n\n    Both the bindings and tools to build bindings are included from each\n    available provider.  For PySide, it is called \"Shiboken\".  For PyQt,\n    this is called \"SIP\".\n\n    Also provided is adapter code to make the user's Python code\n    independent of which binding provider was actually used which makes\n    it very easy to switch between these.\n  ";
  };
})
