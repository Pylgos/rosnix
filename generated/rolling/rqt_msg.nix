{
  ament_flake8,
  ament_index_python,
  ament_xmllint,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  python_qt_binding,
  rclpy,
  rosSystemPackages,
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
      src = fetchFromGitHub {
        name = "rqt_msg-source";
        owner = "ros2-gbp";
        repo = "rqt_msg-release";
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
  nativeBuildInputs = [ wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_python python_qt_binding rclpy rosidl_runtime_py rqt_console rqt_gui rqt_gui_py rqt_py_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_flake8 ament_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "A Python GUI plugin for introspecting available ROS message types.";
  };
}
