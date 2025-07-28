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
  version = "1.8.1-1";
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
        rev = "391d274108550dd452e48b412f3d76b86399cf6a";
        hash = "sha256-n94YrC+LvdqBFMeE0iKduPpJJy1o6fsJvaoq1Apmsbk=";
      };
    };
  });
  meta = {
    description = "rqt_graph provides a GUI plugin for visualizing the ROS\n      computation graph.";
  };
})
