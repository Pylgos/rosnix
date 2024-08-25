{
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python_qt_binding,
  rclpy,
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
      src = fetchgit {
        name = "rqt_moveit-source";
        url = "https://github.com/ros2-gbp/rqt_moveit-release.git";
        rev = "907f5687d674b3f68e5590c2d0d08eddac25ec41";
        hash = "sha256-A4bGoHfpokKaYjSrBzvtYgzyf6sJGECfPJCIM0iZgYU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_moveit";
  version = "1.0.1-5";
  src = sources.rqt_moveit;
  nativeBuildInputs = [ buildPackages.python3Packages.setuptools rosidl_default_generators wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python_qt_binding rclpy rqt_gui rqt_gui_py rqt_py_common rqt_topic sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "An rqt-based tool that assists monitoring tasks for";
  };
}
