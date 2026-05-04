{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-qt-binding,
  qt-dotgraph,
  rclpy,
  rosSystemPackages,
  rqt-graph,
  rqt-gui,
  rqt-gui-py,
  substituteSource,
  tf2-msgs,
  tf2-ros,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_tf_tree";
  version = "1.0.6-2";
  src = finalAttrs.passthru.sources."rqt_tf_tree";
  propagatedNativeBuildInputs = [ python-qt-binding qt-dotgraph rclpy rqt-graph rqt-gui rqt-gui-py tf2-msgs tf2-ros ];
  propagatedBuildInputs = [ python-qt-binding qt-dotgraph rclpy rqt-graph rqt-gui rqt-gui-py tf2-msgs tf2-ros ];
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-mock" "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_tf_tree" = substituteSource {
      src = fetchgit {
        name = "rqt_tf_tree-source";
        url = "https://github.com/ros2-gbp/rqt_tf_tree-release.git";
        rev = "5471cc744599ccc3adc8f734ff3ed13c2e1576f4";
        hash = "sha256-+qJqoYDRTXe7jO8L15aKuTISnLl7pW8WSvZTXISgccA=";
      };
    };
  });
  meta = {
    description = "rqt_tf_tree provides a GUI plugin for visualizing the ROS TF frame tree.";
  };
})
