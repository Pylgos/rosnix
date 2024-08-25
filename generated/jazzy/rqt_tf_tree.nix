{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  python_qt_binding,
  qt_dotgraph,
  rclpy,
  rqt_graph,
  rqt_gui,
  rqt_gui_py,
  substituteSource,
  tf2_msgs,
  tf2_ros,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_tf_tree = substituteSource {
      src = fetchgit {
        name = "rqt_tf_tree-source";
        url = "https://github.com/ros2-gbp/rqt_tf_tree-release.git";
        rev = "bddd1dc3eb5c80eae48a68e9701110d3e5832e0c";
        hash = "sha256-waY5Aa3qycV9O2EEFcztdpfuu+CFOxb42p7gI/IuZUU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_tf_tree";
  version = "1.0.5-1";
  src = sources.rqt_tf_tree;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python_qt_binding qt_dotgraph rclpy rqt_graph rqt_gui rqt_gui_py tf2_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ python3Packages.mock python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "rqt_tf_tree provides a GUI plugin for visualizing the ROS TF frame tree.";
  };
}
