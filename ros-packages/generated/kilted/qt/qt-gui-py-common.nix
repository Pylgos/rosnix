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
  version = "2.9.2-1";
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
        rev = "b3deff01d69299c8e037a0b61e0ed1d9d4589bf9";
        hash = "sha256-zKeH7j4DP+FfHSTZhWyFKAvTFE82B+whK7RdGDwx93I=";
      };
    };
  });
  meta = {
    description = "\n    qt_gui_py_common provides common functionality for GUI plugins written in Python.\n  ";
  };
})
