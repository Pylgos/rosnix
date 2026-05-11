{
  ament-copyright,
  ament-flake8,
  ament-index-python,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-qt-binding,
  qt-dotgraph,
  rclpy,
  rosSystemPackages,
  rqt-gui,
  rqt-gui-py,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_graph";
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."rqt_graph";
  propagatedNativeBuildInputs = [ ament-index-python python-qt-binding qt-dotgraph rclpy rqt-gui rqt-gui-py ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-qt-bindings" ]; };
  propagatedBuildInputs = [ ament-index-python python-qt-binding qt-dotgraph rclpy rqt-gui rqt-gui-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-qt-bindings" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_graph" = substituteSource {
      src = fetchgit {
        name = "rqt_graph-source";
        url = "https://github.com/ros2-gbp/rqt_graph-release.git";
        rev = "cc084bd8f2efc65ea1e15e2f3759a3a2d33117e6";
        hash = "sha256-zpi3IIbwPl7DTOM5fu6YfDq3Uvo2F3EtnM2rquPUL6U=";
      };
    };
  });
  meta = {
    description = "rqt_graph provides a GUI plugin for visualizing the ROS\n      computation graph.";
  };
})
