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
  version = "2.8.3-1";
  src = finalAttrs.passthru.sources."qt_dotgraph";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ python-qt-binding ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pydot" ]; };
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pygraphviz" ]; };
  passthru.sources = mkSourceSet (sources: {
    "qt_dotgraph" = substituteSource {
      src = fetchgit {
        name = "qt_dotgraph-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "dcb078d735052eb01c11e26fac12855f92411f9d";
        hash = "sha256-Thfpn1oL2lns2mG7P5Ew1WhtHh8VSuWEOsetEZAxpKk=";
      };
    };
  });
  meta = {
    description = "qt_dotgraph provides helpers to work with dot graphs.";
  };
})
