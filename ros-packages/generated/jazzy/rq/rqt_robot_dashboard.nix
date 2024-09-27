{
  buildRosPackage,
  diagnostic_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  python_qt_binding,
  qt_gui,
  rclpy,
  rosSystemPackages,
  rqt_console,
  rqt_gui,
  rqt_gui_py,
  rqt_robot_monitor,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_robot_dashboard-9af87622aa4d2f3d538fb7353965bb5e49686d92 = substituteSource {
      src = fetchgit {
        name = "rqt_robot_dashboard-9af87622aa4d2f3d538fb7353965bb5e49686d92-source";
        url = "https://github.com/ros2-gbp/rqt_robot_dashboard-release.git";
        rev = "9af87622aa4d2f3d538fb7353965bb5e49686d92";
        hash = "sha256-o2FskVGSpDLTcYD8PlfRgHpBlDa3UId/Xq+IlAvaZGY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_robot_dashboard";
  version = "0.6.1-5";
  src = sources.rqt_robot_dashboard-9af87622aa4d2f3d538fb7353965bb5e49686d92;
  nativeBuildInputs = [ wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-setuptools" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ diagnostic_msgs python_qt_binding qt_gui rclpy rqt_console rqt_gui rqt_gui_py rqt_robot_monitor ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "rqt_robot_dashboard provides an infrastructure for building robot dashboard plugins in rqt.";
  };
}
