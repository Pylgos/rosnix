{
  ament-copyright,
  ament-flake8,
  ament-index-python,
  ament-pep257,
  buildRosPackage,
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
let
  sources = mkSourceSet (sources: {
    "rqt_dotgraph" = substituteSource {
      src = fetchgit {
        name = "rqt_dotgraph-source";
        url = "https://github.com/ros2-gbp/rqt_dotgraph-release.git";
        rev = "329d51c4a4a7468c4fff9cdc082397c6d6035ea8";
        hash = "sha256-E3jyDyZUR8kaZcp14TvVDshyfZiJ5qW3/sKe9Em2jQc=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rqt_dotgraph";
  version = "0.0.4-1";
  src = sources."rqt_dotgraph";
  nativeBuildInputs = [ wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament-index-python python-qt-binding qt-dotgraph qt-gui-py-common rqt-graph rqt-gui rqt-gui-py std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pyside2" "python3-qt5-bindings" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "rqt GUI plugin to visualize dot graphs.";
  };
}
