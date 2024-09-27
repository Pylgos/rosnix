{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit_configs_utils,
  moveit_kinematics,
  moveit_planners,
  moveit_planners_chomp,
  moveit_ros_move_group,
  moveit_ros_visualization,
  moveit_servo,
  moveit_simple_controller_manager,
  rosSystemPackages,
  substituteSource,
  ur_description,
  warehouse_ros_sqlite,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = mkSourceSet (sources: {
    "ur_moveit_config" = substituteSource {
      src = fetchgit {
        name = "ur_moveit_config-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_ROS2_Driver-release.git";
        rev = "ee896ce6582b02ff9b5afe63d9a3a36e279b44d3";
        hash = "sha256-qvHGwtUJecBk9mV2nEUbnOjBvR0gkyqZSPeJ9LFYVRc=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ur_moveit_config";
  version = "2.4.10-1";
  src = sources."ur_moveit_config";
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ moveit_configs_utils moveit_kinematics moveit_planners moveit_planners_chomp moveit_ros_move_group moveit_ros_visualization moveit_servo moveit_simple_controller_manager ur_description warehouse_ros_sqlite xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "An example package with MoveIt2 configurations for UR robots.";
  };
}
