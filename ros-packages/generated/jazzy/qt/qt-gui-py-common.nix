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
  version = "2.7.4-2";
  src = finalAttrs.passthru.sources."qt_gui_py_common";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ ament-index-python python-qt-binding ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "qt_gui_py_common" = substituteSource {
      src = fetchgit {
        name = "qt_gui_py_common-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "fed5071489e0c1bc1ad02393a2a596636f9c834e";
        hash = "sha256-fr/eKfgCisQ89QrL92zKHDa6k20UvCg4Zhr3pYFz6ug=";
      };
    };
  });
  meta = {
    description = "qt_gui_py_common provides common functionality for GUI plugins written in Python.";
  };
})
