{
  ament_cmake,
  ament_cmake_python,
  buildRosPackage,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  gripper_controllers,
  joint_state_broadcaster,
  joint_state_publisher,
  joint_trajectory_controller,
  kortex_description,
  kortex_driver,
  launch,
  launch_ros,
  mkSourceSet,
  rclpy,
  robotiq_description,
  rosSystemPackages,
  rviz2,
  substituteSource,
  urdf,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = mkSourceSet (sources: {
    "kortex_bringup" = substituteSource {
      src = fetchgit {
        name = "kortex_bringup-source";
        url = "https://github.com/ros2-gbp/ros2_kortex-release.git";
        rev = "7b1b9e5b58add56d94b77593684e748c7b8b68d0";
        hash = "sha256-IQ2mPpCxvX2VcdeA/0EEI0NE3gUueLUjdVkn5RlveZs=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "kortex_bringup";
  version = "0.2.2-2";
  src = sources."kortex_bringup";
  nativeBuildInputs = [ ament_cmake ament_cmake_python wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ controller_manager gripper_controllers joint_state_broadcaster joint_state_publisher joint_trajectory_controller kortex_description kortex_driver launch launch_ros rclpy robotiq_description rviz2 urdf xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gazebo_ros2_control" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Launch file and run-time configurations, e.g. controllers.";
  };
}
