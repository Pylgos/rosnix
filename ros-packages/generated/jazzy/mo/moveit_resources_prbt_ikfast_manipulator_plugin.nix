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
    moveit_resources_prbt_ikfast_manipulator_plugin-b15cc6b1a54aa61aed6476ae3d8484ead2d20e7c = substituteSource {
      src = fetchgit {
        name = "moveit_resources_prbt_ikfast_manipulator_plugin-b15cc6b1a54aa61aed6476ae3d8484ead2d20e7c-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "b15cc6b1a54aa61aed6476ae3d8484ead2d20e7c";
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
  src = sources.moveit_resources_prbt_ikfast_manipulator_plugin-b15cc6b1a54aa61aed6476ae3d8484ead2d20e7c;
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
