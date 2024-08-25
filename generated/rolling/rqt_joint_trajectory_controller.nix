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
        rev = "d8d863d9cbd9820b5c4dfe7eee335d0c04d26f11";
        hash = "sha256-uP0FZUSt5kRNgU9cFkP7fDPr6V6PObI3qaMT6M18vNA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_joint_trajectory_controller";
  version = "4.13.0-1";
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
