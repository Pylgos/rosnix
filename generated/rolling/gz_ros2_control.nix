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
  substituteSource,
  wrapRosQtAppsHook,
  yaml_cpp_vendor,
}:
let
  sources = rec {
    gz_ros2_control = substituteSource {
      src = fetchgit {
        name = "gz_ros2_control-source";
        url = "https://github.com/ros2-gbp/ign_ros2_control-release.git";
        rev = "140e4cedf806a19f9b6c6646a25284fc865c8d4a";
        hash = "sha256-9Du1YIjYkEmSmlqkoKSqg8vb0CdVTVOQPdtHZQgpSFw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_ros2_control";
  version = "2.0.0-3";
  src = sources.gz_ros2_control;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp controller_manager gz_plugin_vendor gz_sim_vendor hardware_interface pluginlib rclcpp rclcpp_lifecycle yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Gazebo ros2_control package allows to control simulated robots using ros2_control framework.";
  };
}
