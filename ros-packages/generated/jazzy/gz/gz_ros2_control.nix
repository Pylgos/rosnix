{
  ament_cmake,
  ament_index_cpp,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  gz_plugin_vendor,
  gz_sim_vendor,
  hardware_interface,
  pluginlib,
  rclcpp,
  rclcpp_lifecycle,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
  yaml_cpp_vendor,
}:
let
  sources = rec {
    gz_ros2_control-be6876ddfe3e1fc8e12df8368be75e464dd96b53 = substituteSource {
      src = fetchgit {
        name = "gz_ros2_control-be6876ddfe3e1fc8e12df8368be75e464dd96b53-source";
        url = "https://github.com/ros2-gbp/ign_ros2_control-release.git";
        rev = "be6876ddfe3e1fc8e12df8368be75e464dd96b53";
        hash = "sha256-Gb7jqOSSi8KjgdTd5FtzzyP161itAUNh/VSAyK63pf0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_ros2_control";
  version = "1.2.7-1";
  src = sources.gz_ros2_control-be6876ddfe3e1fc8e12df8368be75e464dd96b53;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_cpp controller_manager gz_plugin_vendor gz_sim_vendor hardware_interface pluginlib rclcpp rclcpp_lifecycle yaml_cpp_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Gazebo ros2_control package allows to control simulated robots using ros2_control framework.";
  };
}
