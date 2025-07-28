{
  ament-index-python,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-qt-binding,
  qt-dotgraph,
  rosSystemPackages,
  rqt-gui,
  rqt-gui-py,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_graph";
  version = "1.5.5-1";
  src = finalAttrs.passthru.sources."rqt_graph";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-python python-qt-binding qt-dotgraph rqt-gui rqt-gui-py ];
  propagatedBuildInputs = [ ament-index-python python-qt-binding qt-dotgraph rqt-gui rqt-gui-py ];
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_graph" = substituteSource {
      src = fetchgit {
        name = "rqt_graph-source";
        url = "https://github.com/ros2-gbp/rqt_graph-release.git";
        rev = "1bc818d270b3ab78b2e1b2d5946da61a5e158076";
        hash = "sha256-WU0Qy2qdiFjn+cleWweZwN2mNeFhN3AbeEHipLi/5iE=";
      };
    };
  });
  meta = {
    description = "rqt_graph provides a GUI plugin for visualizing the ROS\n      computation graph.";
  };
})
