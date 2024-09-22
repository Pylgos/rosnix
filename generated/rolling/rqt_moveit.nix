{
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  python_qt_binding,
  rclpy,
  rosSystemPackages,
  rosidl_default_generators,
  rqt_gui,
  rqt_gui_py,
  rqt_py_common,
  rqt_topic,
  sensor_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_moveit = substituteSource {
      src = fetchFromGitHub {
        name = "rqt_moveit-source";
        owner = "ros2-gbp";
        repo = "rqt_moveit-release";
        rev = "77d26a0f8c1dbfb5f7e482933936a95ff0173b5d";
        hash = "sha256-A4bGoHfpokKaYjSrBzvtYgzyf6sJGECfPJCIM0iZgYU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_moveit";
  version = "1.0.1-4";
  src = sources.rqt_moveit;
  nativeBuildInputs = [ rosidl_default_generators wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-setuptools" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ python_qt_binding rclpy rqt_gui rqt_gui_py rqt_py_common rqt_topic sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "An rqt-based tool that assists monitoring tasks for";
  };
}
