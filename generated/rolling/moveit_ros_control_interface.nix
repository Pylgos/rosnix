{
  ament_cmake,
  buildRosPackage,
  controller_manager_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_common,
  moveit_core,
  moveit_simple_controller_manager,
  pluginlib,
  rclcpp_action,
  substituteSource,
  trajectory_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_ros_control_interface = substituteSource {
      src = fetchgit {
        name = "moveit_ros_control_interface-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "b74d8a71aa168eca642821bb7f4384bc8fdf8579";
        hash = "sha256-B6O13tr7cM05cETrXCrQREZPR6laPf99em5jREAsHt4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_ros_control_interface";
  version = "2.10.0-1";
  src = sources.moveit_ros_control_interface;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_manager_msgs moveit_common moveit_core moveit_simple_controller_manager pluginlib rclcpp_action trajectory_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "ros_control controller manager interface for MoveIt";
  };
}
