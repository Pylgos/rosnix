{
  ament_cmake,
  ament_cmake_gmock,
  backward_ros,
  buildRosPackage,
  control_msgs,
  controller_interface,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  generate_parameter_library,
  hardware_interface,
  hardware_interface_testing,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp_lifecycle,
  ros2_control_test_assets,
  rosSystemPackages,
  std_srvs,
  steering_controllers_library,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "bicycle_steering_controller" = substituteSource {
      src = fetchgit {
        name = "bicycle_steering_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "c33c67256ecbe177b2a8ea48e715dee2cb71d9a1";
        hash = "sha256-DReIua9zsSoVXfBzzHv0uhjiZNype55TV8pR/oUIgHs=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "bicycle_steering_controller";
  version = "4.14.0-1";
  src = sources."bicycle_steering_controller";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ backward_ros control_msgs controller_interface generate_parameter_library hardware_interface pluginlib rclcpp rclcpp_lifecycle std_srvs steering_controllers_library ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock controller_manager hardware_interface hardware_interface_testing ros2_control_test_assets ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Steering controller with bicycle kinematics. Rear fixed wheel is powering the vehicle and front wheel is steering.";
  };
}