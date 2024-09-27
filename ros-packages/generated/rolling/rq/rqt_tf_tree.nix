{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python_qt_binding,
  qt_dotgraph,
  rclpy,
  rosSystemPackages,
  rqt_graph,
  rqt_gui,
  rqt_gui_py,
  substituteSource,
  tf2_msgs,
  tf2_ros,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "rqt_tf_tree" = substituteSource {
      src = fetchgit {
        name = "rqt_tf_tree-source";
        url = "https://github.com/ros2-gbp/rqt_tf_tree-release.git";
        rev = "9ac6e7eb6042e247e804e02fd83663916e5abb10";
        hash = "sha256-waY5Aa3qycV9O2EEFcztdpfuu+CFOxb42p7gI/IuZUU=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rqt_tf_tree";
  version = "1.0.5-1";
  src = sources."rqt_tf_tree";
  nativeBuildInputs = [ wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ python_qt_binding qt_dotgraph rclpy rqt_graph rqt_gui rqt_gui_py tf2_msgs tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-mock" "python3-pytest" ]; };
  meta = {
    description = "rqt_tf_tree provides a GUI plugin for visualizing the ROS TF frame tree.";
  };
}
