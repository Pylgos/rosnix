{
  ament_cmake,
  ament_cmake_gmock,
  backward_ros,
  buildRosPackage,
  control_msgs,
  control_toolbox,
  controller_interface,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  filters,
  generate_parameter_library,
  geometry_msgs,
  hardware_interface,
  hardware_interface_testing,
  joint_trajectory_controller,
  kinematics_interface,
  kinematics_interface_kdl,
  pluginlib,
  rclcpp,
  rclcpp_lifecycle,
  realtime_tools,
  ros2_control_test_assets,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2_eigen,
  tf2_geometry_msgs,
  tf2_kdl,
  tf2_ros,
  trajectory_msgs,
}:
let
  sources = rec {
    admittance_controller = substituteSource {
      src = fetchgit {
        name = "admittance_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "dbd445a826312bf82bf564bd2dc48c0e32963a42";
        hash = "sha256-gXGKMcrzhuK4TA07VVx2TPmwuw6V38lDgLotJgP6E4E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "admittance_controller";
  version = "4.14.0-1";
  src = sources.admittance_controller;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ backward_ros control_msgs control_toolbox controller_interface filters generate_parameter_library geometry_msgs hardware_interface joint_trajectory_controller kinematics_interface pluginlib rclcpp rclcpp_lifecycle realtime_tools tf2 tf2_eigen tf2_geometry_msgs tf2_kdl tf2_ros trajectory_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock controller_manager hardware_interface_testing kinematics_interface_kdl ros2_control_test_assets ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Implementation of admittance controllers for different input and output interface.";
  };
}
