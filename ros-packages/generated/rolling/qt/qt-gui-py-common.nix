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
  version = "2.10.2-1";
  src = finalAttrs.passthru.sources."qt_gui_py_common";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-python python-qt-binding ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-python python-qt-binding ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "qt_gui_py_common" = substituteSource {
      src = fetchgit {
        name = "qt_gui_py_common-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "18a4036fe8f0c410c5091e44937fcadd2b6db00f";
        hash = "sha256-qJhRrPGnHqCOQCzRg3cLovSU3R/XjtzjhaZs7zb4KRU=";
      };
    };
  });
  meta = {
    description = "\n    qt_gui_py_common provides common functionality for GUI plugins written in Python.\n  ";
  };
})
