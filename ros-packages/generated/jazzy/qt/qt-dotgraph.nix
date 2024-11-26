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
  python-qt-binding,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "qt_dotgraph";
  version = "2.7.4-2";
  src = finalAttrs.passthru.sources."qt_dotgraph";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ python-qt-binding ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pydot" ]; };
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pygraphviz" ]; };
  passthru.sources = mkSourceSet (sources: {
    "qt_dotgraph" = substituteSource {
      src = fetchgit {
        name = "qt_dotgraph-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "f4dc66c120b1196c813ea3c91f55e17c7565ff86";
        hash = "sha256-neIiFXuQRDJ4lsjRo1j9tUX/QwS8Qsz2SSvk8AaL3yE=";
      };
    };
  });
  meta = {
    description = "qt_dotgraph provides helpers to work with dot graphs.";
  };
})
