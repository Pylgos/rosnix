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
    moveit_ros_control_interface = substituteSource {
      src = fetchgit {
        name = "moveit_ros_control_interface-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "383b68e74d0acb96fbdf23f41520568302f96105";
        hash = "sha256-a1utRXpwmm6CBhWSD22zr/g13LtmmsfbvAd7cMHF6SY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_ros_control_interface";
  version = "2.11.0-1";
  src = sources.moveit_ros_control_interface;
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
