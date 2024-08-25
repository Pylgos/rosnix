{
  ament_index_python,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  python_qt_binding,
  rclpy,
  rqt_gui,
  rqt_gui_py,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_robot_steering = substituteSource {
      src = fetchgit {
        name = "rqt_robot_steering-source";
        url = "https://github.com/ros2-gbp/rqt_robot_steering-release.git";
        rev = "23aabcc88d8b6f2ec7260073b80eaf8bb5d51d24";
        hash = "sha256-GQCdfFYxE/yR3Eostcf+T9VKwP2N45EzidAhXz5uVrw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_robot_steering";
  version = "1.0.0-5";
  src = sources.rqt_robot_steering;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python geometry_msgs python_qt_binding rclpy rqt_gui rqt_gui_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "rqt_robot_steering provides a GUI plugin for steering a robot using Twist messages.";
  };
}
