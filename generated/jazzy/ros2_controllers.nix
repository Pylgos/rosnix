{
  ackermann_steering_controller,
  admittance_controller,
  ament_cmake,
  bicycle_steering_controller,
  buildRosPackage,
  diff_drive_controller,
  effort_controllers,
  fetchgit,
  fetchurl,
  fetchzip,
  force_torque_sensor_broadcaster,
  forward_command_controller,
  imu_sensor_broadcaster,
  joint_state_broadcaster,
  joint_trajectory_controller,
  pid_controller,
  position_controllers,
  range_sensor_broadcaster,
  steering_controllers_library,
  substituteSource,
  tricycle_controller,
  tricycle_steering_controller,
  velocity_controllers,
}:
let
  sources = rec {
    ros2_controllers = substituteSource {
      src = fetchgit {
        name = "ros2_controllers-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "bd69c1e1cb94c334486febf0641fd66245b93df3";
        hash = "sha256-uRw2jj1Aok7qTivFp0RHQA4AtNEN5M2noluO7KSbs/g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2_controllers";
  version = "4.12.1-1";
  src = sources.ros2_controllers;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ackermann_steering_controller admittance_controller bicycle_steering_controller diff_drive_controller effort_controllers force_torque_sensor_broadcaster forward_command_controller imu_sensor_broadcaster joint_state_broadcaster joint_trajectory_controller pid_controller position_controllers range_sensor_broadcaster steering_controllers_library tricycle_controller tricycle_steering_controller velocity_controllers ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Metapackage for ROS2 controllers related packages";
  };
}
