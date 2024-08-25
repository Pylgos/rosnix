{
  buildRosPackage,
  control_msgs,
  controller_manager_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  python_qt_binding,
  qt_gui,
  rclpy,
  rqt_gui,
  rqt_gui_py,
  substituteSource,
  trajectory_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_joint_trajectory_controller = substituteSource {
      src = fetchgit {
        name = "rqt_joint_trajectory_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "40c1d3c9abfab10a10fad6fd1194feaf5aa226b9";
        hash = "sha256-lqD9mZwdRRIBUzt9WcQvGWeTAKLcp8OM7WNiqEqCuuo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_joint_trajectory_controller";
  version = "4.12.1-1";
  src = sources.rqt_joint_trajectory_controller;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ control_msgs controller_manager_msgs python_qt_binding qt_gui rclpy rqt_gui rqt_gui_py trajectory_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [ "python3-rospkg" ];
  meta = {
    description = "Graphical frontend for interacting with joint_trajectory_controller instances.";
  };
}
