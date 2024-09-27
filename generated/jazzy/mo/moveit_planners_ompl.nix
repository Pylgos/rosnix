{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
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
  rosSystemPackages,
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
  nativeBuildInputs = [ ament_cmake eigen3_cmake_module wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ moveit_common moveit_core moveit_msgs moveit_ros_planning ompl pluginlib rclcpp tf2_eigen tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libomp-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest moveit_resources_fanuc_moveit_config moveit_resources_panda_moveit_config moveit_resources_pr2_description tf2_eigen ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  meta = {
    description = "MoveIt interface to OMPL";
  };
}
