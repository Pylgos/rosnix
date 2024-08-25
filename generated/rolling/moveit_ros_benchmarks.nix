{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_param_builder,
  moveit_common,
  moveit_configs_utils,
  moveit_core,
  moveit_ros_planning,
  moveit_ros_warehouse,
  pluginlib,
  python3Packages,
  rclcpp,
  substituteSource,
  tf2_eigen,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_ros_benchmarks = substituteSource {
      src = fetchgit {
        name = "moveit_ros_benchmarks-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "e12e9316459fa2e0cbe76050d7d0cdc10a5b7d8e";
        hash = "sha256-sHVNAk/cZy7UtZldddJLN7kWaaakA6FCskuG1egghKU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_ros_benchmarks";
  version = "2.10.0-1";
  src = sources.moveit_ros_benchmarks;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_param_builder moveit_common moveit_configs_utils moveit_core moveit_ros_planning moveit_ros_warehouse pluginlib python3Packages.boost rclcpp tf2_eigen ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Enhanced tools for benchmarks in MoveIt";
  };
}
