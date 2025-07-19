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
  version = "2.3.1-2";
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
        rev = "088925fdb8343736a3639d7c3da3bc9bbc3e3bf4";
        hash = "sha256-DtKuJ821tUUjTjVfhszlBKW/kLLCVB2j9VL8oF37kJo=";
      };
    };
  });
  meta = {
    description = "\n    This stack provides Python bindings for Qt.\n    There are two providers: pyside and pyqt.  PySide2 is available under\n    the GPL, LGPL and a commercial license.  PyQt is released under the GPL.\n\n    Both the bindings and tools to build bindings are included from each\n    available provider.  For PySide, it is called \"Shiboken\".  For PyQt,\n    this is called \"SIP\".\n\n    Also provided is adapter code to make the user's Python code\n    independent of which binding provider was actually used which makes\n    it very easy to switch between these.\n  ";
  };
})
