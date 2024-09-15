{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  generate_parameter_library,
  moveit_core,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2_eigen,
  tf2_eigen_kdl,
  tf2_geometry_msgs,
  tf2_kdl,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_resources_prbt_ikfast_manipulator_plugin = substituteSource {
      src = fetchgit {
        name = "moveit_resources_prbt_ikfast_manipulator_plugin-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "628bd334934de4f5361702d76195392538d093d5";
        hash = "sha256-3jp2d4fWMgZrmfzyREuAa9rG/lPVjD4zLbUcZPN6mpI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_resources_prbt_ikfast_manipulator_plugin";
  version = "2.10.0-1";
  src = sources.moveit_resources_prbt_ikfast_manipulator_plugin;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ generate_parameter_library moveit_core pluginlib rclcpp tf2_eigen tf2_eigen_kdl tf2_geometry_msgs tf2_kdl ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The prbt_ikfast_manipulator_plugin package";
  };
}
