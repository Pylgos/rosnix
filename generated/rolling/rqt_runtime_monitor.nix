{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  buildRosPackage,
  diagnostic_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  python_qt_binding,
  qt_gui,
  rclpy,
  rqt_gui,
  rqt_gui_py,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_runtime_monitor = substituteSource {
      src = fetchgit {
        name = "rqt_runtime_monitor-source";
        url = "https://github.com/ros2-gbp/rqt_runtime_monitor-release.git";
        rev = "8a3ca23e7d99c28c65dc0400ef34e5833ee4a5cb";
        hash = "sha256-7LyebmhKcj1ltMsj4LbDUxXX5v9ejuW4g4lIKitP28Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_runtime_monitor";
  version = "1.0.0-4";
  src = sources.rqt_runtime_monitor;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python diagnostic_msgs python_qt_binding qt_gui rclpy rqt_gui rqt_gui_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [ "python3-rospkg" ];
  meta = {
    description = "rqt_runtime_monitor provides a GUI plugin viewing DiagnosticsArray messages.";
  };
}
