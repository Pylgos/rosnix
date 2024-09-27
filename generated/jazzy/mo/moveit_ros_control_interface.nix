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
  rosSystemPackages,
  substituteSource,
  trajectory_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_ros_control_interface-5795f623592a04d8002e48ee67f9cb5775818429 = substituteSource {
      src = fetchgit {
        name = "moveit_ros_control_interface-5795f623592a04d8002e48ee67f9cb5775818429-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "5795f623592a04d8002e48ee67f9cb5775818429";
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
  src = sources.moveit_ros_control_interface-5795f623592a04d8002e48ee67f9cb5775818429;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ controller_manager_msgs moveit_common moveit_core moveit_simple_controller_manager pluginlib rclcpp_action trajectory_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ros_control controller manager interface for MoveIt";
  };
}
