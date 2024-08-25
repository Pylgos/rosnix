{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  eigen,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  llvmPackages,
  moveit_common,
  moveit_core,
  moveit_msgs,
  moveit_resources_fanuc_moveit_config,
  moveit_resources_panda_moveit_config,
  moveit_resources_pr2_description,
  moveit_ros_planning,
  ompl,
  pluginlib,
  rclcpp,
  substituteSource,
  tf2_eigen,
  tf2_ros,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_planners_ompl = substituteSource {
      src = fetchgit {
        name = "moveit_planners_ompl-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "e1c5a7257b73f495419808e94652fae0b0782afc";
        hash = "sha256-W+rFXVi8+8p9Zw1yJ7jOSgc6aT0r1pT4bZ9kGXdDySc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_planners_ompl";
  version = "2.10.0-1";
  src = sources.moveit_planners_ompl;
  nativeBuildInputs = [ ament_cmake eigen3_cmake_module wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ llvmPackages.openmp moveit_common moveit_core moveit_msgs moveit_ros_planning ompl pluginlib rclcpp tf2_eigen tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest eigen moveit_resources_fanuc_moveit_config moveit_resources_panda_moveit_config moveit_resources_pr2_description tf2_eigen ];
  missingDependencies = [  ];
  meta = {
    description = "MoveIt interface to OMPL";
  };
}
