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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "qt_gui_py_common";
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."qt_gui_py_common";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-python python-qt-binding ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-python python-qt-binding ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "qt_gui_py_common" = substituteSource {
      src = fetchgit {
        name = "qt_gui_py_common-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "517dcc854894df85325a546302d12c10e9ab2627";
        hash = "sha256-XkVMkRg92R1LDFPnrlJbmKu4dR/V2Zf9OSIvGF2QjQo=";
      };
    };
  });
  meta = {
    description = "\n    qt_gui_py_common provides common functionality for GUI plugins written in Python.\n  ";
  };
})
