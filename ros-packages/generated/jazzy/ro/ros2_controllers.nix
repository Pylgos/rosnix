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
  rosSystemPackages,
  steering_controllers_library,
  substituteSource,
  tricycle_controller,
  tricycle_steering_controller,
  velocity_controllers,
}:
let
  sources = rec {
    ros2_controllers-dd869935a92880cea24a50284ce545ff0d234c5a = substituteSource {
      src = fetchgit {
        name = "ros2_controllers-dd869935a92880cea24a50284ce545ff0d234c5a-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "dd869935a92880cea24a50284ce545ff0d234c5a";
        hash = "sha256-MuYZvs0hB5whSJOO+DZGlpsf/N6KpKhL/z0AoPY3uZA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2_controllers";
  version = "4.14.0-1";
  src = sources.ros2_controllers-dd869935a92880cea24a50284ce545ff0d234c5a;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ackermann_steering_controller admittance_controller bicycle_steering_controller diff_drive_controller effort_controllers force_torque_sensor_broadcaster forward_command_controller imu_sensor_broadcaster joint_state_broadcaster joint_trajectory_controller pid_controller position_controllers range_sensor_broadcaster steering_controllers_library tricycle_controller tricycle_steering_controller velocity_controllers ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Metapackage for ROS2 controllers related packages";
  };
}
