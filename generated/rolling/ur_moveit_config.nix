{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_configs_utils,
  moveit_kinematics,
  moveit_planners,
  moveit_planners_chomp,
  moveit_ros_move_group,
  moveit_ros_visualization,
  moveit_servo,
  moveit_simple_controller_manager,
  substituteSource,
  ur_description,
  warehouse_ros_sqlite,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    ur_moveit_config = substituteSource {
      src = fetchgit {
        name = "ur_moveit_config-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_ROS2_Driver-release.git";
        rev = "d0f45ff8f22f0af438356650e25476299f63bda7";
        hash = "sha256-ehDdSfC52jfDqW0FLFFSpNdDLO5KRl84iMvHkMlnAWM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ur_moveit_config";
  version = "2.4.9-1";
  src = sources.ur_moveit_config;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ moveit_configs_utils moveit_kinematics moveit_planners moveit_planners_chomp moveit_ros_move_group moveit_ros_visualization moveit_servo moveit_simple_controller_manager ur_description warehouse_ros_sqlite xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "An example package with MoveIt2 configurations for UR robots.";
  };
}
