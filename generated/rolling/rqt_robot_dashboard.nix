{
  buildPackages,
  buildRosPackage,
  diagnostic_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  python_qt_binding,
  qt_gui,
  rclpy,
  rqt_console,
  rqt_gui,
  rqt_gui_py,
  rqt_robot_monitor,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_robot_dashboard = substituteSource {
      src = fetchgit {
        name = "rqt_robot_dashboard-source";
        url = "https://github.com/ros2-gbp/rqt_robot_dashboard-release.git";
        rev = "5f494a3d0b594188ba864a2ef165ea22e059566e";
        hash = "sha256-o2FskVGSpDLTcYD8PlfRgHpBlDa3UId/Xq+IlAvaZGY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_robot_dashboard";
  version = "0.6.1-4";
  src = sources.rqt_robot_dashboard;
  nativeBuildInputs = [ buildPackages.python3Packages.setuptools wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ diagnostic_msgs python_qt_binding qt_gui rclpy rqt_console rqt_gui rqt_gui_py rqt_robot_monitor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "rqt_robot_dashboard provides an infrastructure for building robot dashboard plugins in rqt.";
  };
}
