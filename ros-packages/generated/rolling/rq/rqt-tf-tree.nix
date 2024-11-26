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
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_tf_tree";
  version = "1.0.5-1";
  src = finalAttrs.passthru.sources."rqt_tf_tree";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedBuildInputs = [ python-qt-binding qt-dotgraph rclpy rqt-graph rqt-gui rqt-gui-py tf2-msgs tf2-ros ];
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-mock" "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "rqt_tf_tree" = substituteSource {
        src = fetchgit {
          name = "rqt_tf_tree-source";
          url = "https://github.com/ros2-gbp/rqt_tf_tree-release.git";
          rev = "9ac6e7eb6042e247e804e02fd83663916e5abb10";
          hash = "sha256-waY5Aa3qycV9O2EEFcztdpfuu+CFOxb42p7gI/IuZUU=";
        };
      };
    });
  };
  meta = {
    description = "rqt_tf_tree provides a GUI plugin for visualizing the ROS TF frame tree.";
  };
})
