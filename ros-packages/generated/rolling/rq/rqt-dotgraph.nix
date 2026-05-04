{
  ament-copyright,
  ament-flake8,
  ament-index-python,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-qt-binding,
  qt-dotgraph,
  qt-gui-py-common,
  rosSystemPackages,
  rqt-graph,
  rqt-gui,
  rqt-gui-py,
  std-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_dotgraph";
  version = "0.0.5-2";
  src = finalAttrs.passthru.sources."rqt_dotgraph";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-python python-qt-binding qt-dotgraph qt-gui-py-common rqt-graph rqt-gui rqt-gui-py std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-qt5-bindings" ]; };
  propagatedBuildInputs = [ ament-index-python python-qt-binding qt-dotgraph qt-gui-py-common rqt-graph rqt-gui rqt-gui-py std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-qt5-bindings" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_dotgraph" = substituteSource {
      src = fetchgit {
        name = "rqt_dotgraph-source";
        url = "https://github.com/ros2-gbp/rqt_dotgraph-release.git";
        rev = "ceff130bcb3b1616120891fc13ddb1f5479ac2cb";
        hash = "sha256-Jvwjjr9OlV42FVq6kD2CXeb6HizSxxGx/550w72hNP8=";
      };
    };
  });
  meta = {
    description = "rqt GUI plugin to visualize dot graphs.";
  };
})
