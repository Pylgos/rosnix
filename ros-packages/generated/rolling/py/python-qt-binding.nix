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
  version = "2.3.1-1";
  src = finalAttrs.passthru.sources."python_qt_binding";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-qt5-bindings" "qtbase5-dev" ]; };
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "python_qt_binding" = substituteSource {
      src = fetchgit {
        name = "python_qt_binding-source";
        url = "https://github.com/ros2-gbp/python_qt_binding-release.git";
        rev = "7f687ab903a3513f6deda9b43e67b1a0edbeb97f";
        hash = "sha256-DtKuJ821tUUjTjVfhszlBKW/kLLCVB2j9VL8oF37kJo=";
      };
    };
  });
  meta = {
    description = "This stack provides Python bindings for Qt. There are two providers: pyside and pyqt. PySide2 is available under the GPL, LGPL and a commercial license. PyQt is released under the GPL. Both the bindings and tools to build bindings are included from each available provider. For PySide, it is called \"Shiboken\". For PyQt, this is called \"SIP\". Also provided is adapter code to make the user's Python code independent of which binding provider was actually used which makes it very easy to switch between these.";
  };
})
