{
  ament_flake8,
  ament_index_python,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  python_qt_binding,
  rclpy,
  rosidl_runtime_py,
  rqt_console,
  rqt_gui,
  rqt_gui_py,
  rqt_py_common,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_msg = substituteSource {
      src = fetchgit {
        name = "rqt_msg-source";
        url = "https://github.com/ros2-gbp/rqt_msg-release.git";
        rev = "c283d62faec39121b5d5cc7ae440a1da9f75e0f4";
        hash = "sha256-HLLdZuTgk34mEBVPJlTRHzk598ItMroTW4gKtcJw0X8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_msg";
  version = "1.6.0-1";
  src = sources.rqt_msg;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python python_qt_binding rclpy rosidl_runtime_py rqt_console rqt_gui rqt_gui_py rqt_py_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_flake8 ament_xmllint python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "A Python GUI plugin for introspecting available ROS message types.";
  };
}
