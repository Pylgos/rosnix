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
  version = "2.7.5-1";
  src = finalAttrs.passthru.sources."qt_dotgraph";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ python-qt-binding ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pydot" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ python-qt-binding ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pydot" ]; };
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pygraphviz" ]; };
  passthru.sources = mkSourceSet (sources: {
    "qt_dotgraph" = substituteSource {
      src = fetchgit {
        name = "qt_dotgraph-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "a78ff9d99e06e6d02c731d4f5606693857cf8aa7";
        hash = "sha256-abvt9oUqCVa1aJ75mrMeVeHysPeQZt8cZyU5MRkZBHc=";
      };
    };
  });
  meta = {
    description = "\n    qt_dotgraph provides helpers to work with dot graphs.\n  ";
  };
})
