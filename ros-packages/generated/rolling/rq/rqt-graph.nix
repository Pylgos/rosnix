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
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_graph";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."rqt_graph";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-python python-qt-binding qt-dotgraph rclpy rqt-gui rqt-gui-py ];
  propagatedBuildInputs = [ ament-index-python python-qt-binding qt-dotgraph rclpy rqt-gui rqt-gui-py ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_graph" = substituteSource {
      src = fetchgit {
        name = "rqt_graph-source";
        url = "https://github.com/ros2-gbp/rqt_graph-release.git";
        rev = "3a9be20a27742180171e010cd7296d772df09e10";
        hash = "sha256-Upj2s//xxuCiiQYIugnV8NKp20u2vjcCatwOOHaaB0U=";
      };
    };
  });
  meta = {
    description = "rqt_graph provides a GUI plugin for visualizing the ROS\n      computation graph.";
  };
})
