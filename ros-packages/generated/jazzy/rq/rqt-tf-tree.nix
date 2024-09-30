{
  buildRosPackage,
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
let
  sources = mkSourceSet (sources: {
    "rqt_tf_tree" = substituteSource {
      src = fetchgit {
        name = "rqt_tf_tree-source";
        url = "https://github.com/ros2-gbp/rqt_tf_tree-release.git";
        rev = "bddd1dc3eb5c80eae48a68e9701110d3e5832e0c";
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
  propagatedBuildInputs = [ python-qt-binding qt-dotgraph rclpy rqt-graph rqt-gui rqt-gui-py tf2-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-mock" "python3-pytest" ]; };
  meta = {
    description = "rqt_tf_tree provides a GUI plugin for visualizing the ROS TF frame tree.";
  };
}
