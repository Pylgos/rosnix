{
  buildRosPackage,
  controller_manager,
  controller_manager_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  rclpy,
  rqt_gui,
  rqt_gui_py,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_controller_manager = substituteSource {
      src = fetchgit {
        name = "rqt_controller_manager-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "d92bf7170b1d327caeaea8f6c8f7debe80e85853";
        hash = "sha256-M4jffpRApCWuX10IgES/ECgj25DVmIHQa/kTJORqwGA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_controller_manager";
  version = "4.15.0-1";
  src = sources.rqt_controller_manager;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_manager controller_manager_msgs rclpy rqt_gui rqt_gui_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Graphical frontend for interacting with the controller manager.";
  };
}
