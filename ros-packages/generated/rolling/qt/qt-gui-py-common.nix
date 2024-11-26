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
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "qt_gui_py_common";
  version = "2.8.3-1";
  src = finalAttrs.passthru.sources."qt_gui_py_common";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ ament-index-python python-qt-binding ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "qt_gui_py_common" = substituteSource {
        src = fetchgit {
          name = "qt_gui_py_common-source";
          url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
          rev = "49258317e712be609b148da384dcad7b4be98895";
          hash = "sha256-pufl4pBdEWLdh1QgAJMn8eVv5LmJIt4r1n//jJNvkdk=";
        };
      };
    });
  };
  meta = {
    description = "qt_gui_py_common provides common functionality for GUI plugins written in Python.";
  };
})
